class AddPositionToInterests < ActiveRecord::Migration[5.1]
  def change
    add_column :interests, :position, :integer
  end
end
