class AddBlogIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :all_comments, :blog_id, :integer
  end
end
