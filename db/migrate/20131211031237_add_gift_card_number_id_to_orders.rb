class AddGiftCardNumberIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :gift_card_number_id, :integer
  end
end
