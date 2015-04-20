class AddSpellingToWords < ActiveRecord::Migration
  def change
    add_column :words, :spelling, :text
  end
end
