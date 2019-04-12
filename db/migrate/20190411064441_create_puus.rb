class CreatePuus < ActiveRecord::Migration[5.2]
  def change
    create_table :puus do |t|
      t.text :image
      t.timestamps
    end
  end
end
