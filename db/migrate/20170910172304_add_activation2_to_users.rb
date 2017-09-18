class AddActivation2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :money, :integer,                         default: 0
    add_column :users, :money_yet, :integer,                         default: 0
  end
end
