class IndexWordOriginChildrenOnWord < ActiveRecord::Migration[4.2]
  def change
    change_table :word_origins do |t|
      t.belongs_to :origin, index: true
    end 
  end
end
