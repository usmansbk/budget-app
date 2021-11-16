class CreateJoinTableUserDeal < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :deals, table_name: "categories" do |t|
      t.primary_key :id
      t.string :name,               null: false
      t.string :icon
      t.index [:user_id, :deal_id]
    end
  end
end
