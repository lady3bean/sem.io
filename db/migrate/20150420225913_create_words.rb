class CreateWords < ActiveRecord::Migration[4.2]
  def change
    create_table :words do |t|
      t.text :definition
    end
  end
end
