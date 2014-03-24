class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size
      t.references :category, index: true

      t.timestamps
    end
  end
end
