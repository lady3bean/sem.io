class AddOriginForiegnKeyToWordOrigins < ActiveRecord::Migration[4.2]
  def change
    add_foreign_key 'word_origins', 'words', :column => 'origin_id'
  end
end
