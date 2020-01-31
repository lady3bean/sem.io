class IndexSpelling < ActiveRecord::Migration[4.2]
  def change
    add_index :words, :spelling
  end
end
