class AddGiftCardNumberIdToOrders < ActiveRecord::Migration
  def change
    add_column :order_items, :gift_card_number_id, :integer
  end
end
