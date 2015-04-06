class CreateWordRoots < ActiveRecord::Migration
  def change
    create_table :word_roots do |t|
      t.belongs_to :word, index: true

      t.timestamps null: false
    end
    add_foreign_key :word_roots, :words
  end
end
