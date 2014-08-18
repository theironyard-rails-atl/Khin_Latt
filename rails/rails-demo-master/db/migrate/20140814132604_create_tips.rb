class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.text :content

      t.timestamps # created_at, updated_at
    end
  end
end
