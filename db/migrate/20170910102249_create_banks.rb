class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :money, default: "0"

      t.timestamps null: false
    end
  end
end
