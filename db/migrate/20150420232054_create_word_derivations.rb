class CreateWordDerivations < ActiveRecord::Migration[4.2]
  def change
    create_table :word_derivations do |t|
      t.belongs_to :word, index: true
      t.belongs_to :derived_from, index: true
    end
    add_foreign_key 'word_derivations', 'words'
    add_foreign_key 'word_derivations', 'words', :column => 'derived_from_id'
  end
end
