class CreateSneakers < ActiveRecord::Migration[5.0]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :image_url
      t.integer :price

      t.timestamps
    end
  end
end
