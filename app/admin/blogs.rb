ActiveAdmin.register Blog, as: 'Story' do
  permit_params :title, :body

  menu priority: 2

  # includes :user

  sidebar :help do
    ul do
      li 'Need help? Email us at help@example.com'
      li 'Admin email: admin@example.com'
    end
  end

  csv do
    column :title
    column :body
    column(:user) { |st| st.user.user_name }
  end

  index do
    selectable_column
    id_column
    column(:title) { |st| st.title.truncate(15) }
    column(:body) { |st| st.body.truncate(70) }
    column :user_id do |st|
      link_to st.user.user_name, admin_user_path(User.find_by(id: st.user_id)), target: '_blank'
    end
    # column '' do |st|
    #   link_to 'Edit', edit_admin_story_path(st), target: '_blank' if authorized? :update, st
    # end
    column :created_at
    actions do |st|
      item "Story", blog_path(st), target: '_blank', class: ""
    end
  end
  index download_links: [:csv]

  filter :title

  action_item :story_action, only: :show do
    link_to 'View on site', blog_path(story)
  end

  show do
    h4 'Title:'
      h5 story.title
    h4 'Story:'
      h5 story.body
    h4 'Created by:'
      h5 story.user.user_name
    panel "Commets" do
      table_for story.all_comments do
        column :title
        column :body
        column :user
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Story' do
      f.input :title
      f.input :body
    end
    f.inputs 'Comments' do
      f.has_many :all_comments, allow_destroy: true, new_record: false do |c|
        c.input :title
        c.input :body
      end
    end
    f.actions
  end

  controller do
  end
end
