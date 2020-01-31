class CreateWordOriginsAndAddIndexOnWords < ActiveRecord::Migration[4.2]
  def change
    create_table :word_origins do |t|
      t.belongs_to :word, index: true
    end
    add_foreign_key :word_origins, :words
  end
end
