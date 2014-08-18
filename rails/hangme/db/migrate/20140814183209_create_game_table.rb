
class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :answer
      t.integer :max_misses, default: 6
      t.integer :misses, default: 0
      t.string :guessed # although an array, this is technically strings
      t.timestamps # created_at, updated_at
    end
  end
end
