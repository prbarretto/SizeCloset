class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.string :title
      t.user :references

      t.timestamps
    end
  end
end
