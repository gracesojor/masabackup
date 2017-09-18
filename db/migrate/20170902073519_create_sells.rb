class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.string :name
      t.string :maker
      t.integer :number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
