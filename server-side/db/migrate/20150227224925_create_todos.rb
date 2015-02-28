class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.boolean :completed
      t.integer :user_id

      t.timestamps
    end
  end
end
