class CreateAccesslogs < ActiveRecord::Migration
  def change
    create_table :accesslogs do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
