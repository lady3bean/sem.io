class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.text :iso_code, :limit => 3, index: true
      t.text :name
    end
  end
end
