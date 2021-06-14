class CreateAllComments < ActiveRecord::Migration[5.2]
  def change
    create_table :all_comments do |t|
      t.string :name
      t.text :body
      t.references :user, polymorphic: true

      t.timestamps
    end
  end
end
