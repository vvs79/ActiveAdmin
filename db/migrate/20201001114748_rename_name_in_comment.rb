class RenameNameInComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :all_comments, :name, :title
  end
end
