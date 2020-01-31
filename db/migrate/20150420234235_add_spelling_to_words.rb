class AddSpellingToWords < ActiveRecord::Migration[4.2]
  def change
    add_column :words, :spelling, :text
  end
end
