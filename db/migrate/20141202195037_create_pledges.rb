class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.integer :amount

      t.timestamps
    end
  end
end
