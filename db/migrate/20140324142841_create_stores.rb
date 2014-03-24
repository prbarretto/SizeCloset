class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.text :name
      t.references :closet, index: true

      t.timestamps
    end
  end
end
