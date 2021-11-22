class CreateJoinTableCategoryDeal < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :deals do |t|
      t.index [:category_id, :deal_id]
      # t.index [:deal_id, :category_id]
    end
  end
end
