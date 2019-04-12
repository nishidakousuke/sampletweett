class AddNameToPuus < ActiveRecord::Migration[5.2]
  def change
    add_column :puus, :name, :string
  end
end
