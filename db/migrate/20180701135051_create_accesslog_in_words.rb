class CreateAccesslogInWords < ActiveRecord::Migration
  def change
    create_table :accesslog_in_words do |t|
      t.references :accesslog, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
