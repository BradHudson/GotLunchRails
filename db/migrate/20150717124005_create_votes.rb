class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :name
      t.integer :vote
      t.date :date

      t.timestamps null: false
    end
  end
end
