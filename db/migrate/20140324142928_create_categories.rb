class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :name
      t.references :store, index: true

      t.timestamps
    end
  end
end
