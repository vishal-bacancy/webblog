class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :blog, index: true
      t.belongs_to :user, index: true
      t.references :parent_comment, index: true
      t.timestamps
    end
  end
end
