class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.text :store
      t.text :category
      t.string :size
      t.text :style
      t.text :note
      t.references :user, index: true

      t.timestamps
    end
  end
end
