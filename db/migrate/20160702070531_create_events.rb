class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.text :tag
      t.string :time
      t.timestamps
    end
  end
end
