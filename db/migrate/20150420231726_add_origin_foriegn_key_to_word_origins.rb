class AddOriginForiegnKeyToWordOrigins < ActiveRecord::Migration
  def change
    add_foreign_key 'word_origins', 'words', :column => 'origin_id'
  end
end
