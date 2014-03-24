class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
