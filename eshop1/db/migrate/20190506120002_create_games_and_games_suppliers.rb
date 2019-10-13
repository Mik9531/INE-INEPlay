class CreateGamesAndGamesSuppliers < ActiveRecord::Migration[5.1]
  def up
    create_table :games do |t|
      t.string :name, :limit => 255, :null => false
      t.integer :developer_id, :limit => 8, :null => false
      t.datetime :developed_at
      t.text :blurb
      t.integer :pegi
      t.float :price
      t.timestamps
    end

    create_table :games_suppliers do |t|
      t.integer :game_id, :limit => 8, :null => false
      t.integer :supplier_id, :limit => 8, :null => false
      t.timestamps
    end

    say_with_time 'Adding foreing keys' do
      # Add foreign key reference to games_suppliers table
      execute 'ALTER TABLE games_suppliers ADD CONSTRAINT fk_games_suppliers_suppliers
              FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE'      
      execute 'ALTER TABLE games_suppliers ADD CONSTRAINT fk_games_suppliers_games
              FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE'
      # Add foreign key reference to developers table
      execute 'ALTER TABLE games ADD CONSTRAINT fk_games_developers
              FOREIGN KEY (developer_id) REFERENCES developers(id) ON DELETE CASCADE'
    end
  end

  def self.down
    drop_table :games
    drop_table :games_suppliers
  end
end
