class AddNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :slug, null: false
      t.timestamps
    end
    add_index :news, :slug, unique: true
  end
end
