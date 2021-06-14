ActiveAdmin.register User do
  config.filters = false
  config.per_page = [5, 10]
  config.clear_action_items!

  permit_params :user_name, :email, :active

  actions :all, except: [:edit, :update, :destroy]

  menu priority: 1

  scope :all
  scope :inactive, group: :status

  # index download_links: [:pdf]

  index do
    # selectable_column
    id_column
    column :user_name
    column :email
    column :active
    column :created_at
    actions do |user|
      res = []
      res << link_to(user.active ? 'Disapprove' : 'Approve', approve_admin_user_path(user))
      res.column_concat
    end
  end

  # filter :user_name
  # filter :email

  collection_action :approvel_all do
    User.update_all(active: true)
    redirect_to admin_users_path, notice: "Successfully approved all users!"
  end

  member_action :approve do
    user = User.find(params[:id])
    user.update_columns(active: !user.active)
    msg = "#{user.user_name} was "
    redirect_to admin_users_path, notice: msg + (user.active ? 'approved!' : 'disapproved!')
  end

  action_item :super_action, only: :index do
    link_to 'Approve all users', approvel_all_admin_users_path
  end

  form do |f|
    f.inputs do
      f.input :user_name
      f.input :email
      f.input :active
    end
    f.actions
  end

  # form title: 'A custom form' do |f|
  #   inputs 'Details' do
  #     input :user_name
  #     input :updated_at, label: "Updated At"
  #     li "Created at #{f.object.created_at}" unless f.object.new_record?
  #     input :email
  #   end
  #   panel 'Markup' do
  #     "The following can be used in the content below..."
  #   end
  #   inputs 'Content', :password
  #   para "Press cancel to return to the list without saving."
  #   actions
  # end

  # controller do
  # end
end
