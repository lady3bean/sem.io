class IndexWordsOnLanguageId < ActiveRecord::Migration
  def change
    change_table :words do |t|
      t.belongs_to :language, index: true
    end
    add_foreign_key :words, :languages
  end
end
