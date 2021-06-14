ActiveAdmin.register AllComment, as: 'Comment' do
  permit_params :title, :body

  index do
    selectable_column
    id_column
    column :title
    column :body
    # column :user_type
    # column :user_id
    column :blog_id
    column :created_at
    actions
  end

  filter :title
  filter :user_type
  # filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
    end
    f.actions
  end

  show do
    h2 comment.title
    div do
      simple_format comment.body
    end
  end

  controller do
    def create
      comment = AllComment.new(comment_params)
      comment.user = current_admin_user if current_admin_user.present?
      if comment.save
        redirect_to admin_comments_path
      else
        redirect_to action: :new
      end
    end

    private

    def comment_params
      params.require(:all_comment).permit(:title, :body)
    end
  end
end
