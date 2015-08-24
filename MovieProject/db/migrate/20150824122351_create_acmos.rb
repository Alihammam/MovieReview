class CreateAcmos < ActiveRecord::Migration
  def change
    create_table :acmos do |t|
      t.integer :actor_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
