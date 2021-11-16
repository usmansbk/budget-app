class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.string :name
      t.decimal :amount
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
