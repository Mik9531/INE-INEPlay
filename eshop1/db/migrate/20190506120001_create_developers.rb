class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
    t.string :name, :limit => 255, :null => false, :unique => true
      t.timestamps
    end
  end
end
