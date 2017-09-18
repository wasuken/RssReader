class CreateRsssites < ActiveRecord::Migration
  def change
    create_table :rsssites do |t|
      t.string :name
      t.text :url

      t.timestamps null: false
    end
  end
end
