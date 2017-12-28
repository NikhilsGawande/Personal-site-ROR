class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.text :title
      t.integer :category
      t.boolean :done

      t.timestamps
    end
  end
end
