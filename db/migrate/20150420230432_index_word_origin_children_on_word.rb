class IndexWordOriginChildrenOnWord < ActiveRecord::Migration
  def change
    change_table :word_origins do |t|
      t.belongs_to :origin, index: true
    end 
  end
end
