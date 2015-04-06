class Word < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :spelling
      t.text :definition
    end
  end
end
