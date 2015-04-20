class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :definition
    end
  end
end
