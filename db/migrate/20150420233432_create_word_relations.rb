class CreateWordRelations < ActiveRecord::Migration[4.2]
  def change
    create_table :word_relations do |t|
      t.belongs_to :word, index: true
      t.belongs_to :relation
    end
    add_foreign_key 'word_relations', 'words'
    add_foreign_key 'word_relations', 'words', :column => 'relation_id'
  end
end
