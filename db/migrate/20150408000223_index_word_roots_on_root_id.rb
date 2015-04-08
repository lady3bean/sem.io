class IndexWordRootsOnRootId < ActiveRecord::Migration
  def change
    change_table :word_roots do |t|
      t.belongs_to :root, index: true
    end
  end
end
