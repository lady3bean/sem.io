class IndexWordsOnLanguageId < ActiveRecord::Migration[4.2]
  def change
    change_table :words do |t|
      t.belongs_to :language, index: true
    end
    add_foreign_key :words, :languages
  end
end
