class CreateRsspages < ActiveRecord::Migration
  def change
    create_table :rsspages do |t|
      t.string :title
      t.text :url
      t.text :description
      t.references :rsssite, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
