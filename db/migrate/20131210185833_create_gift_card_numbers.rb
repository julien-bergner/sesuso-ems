class CreateGiftCardNumbers < ActiveRecord::Migration
  def change
    create_table :gift_card_numbers do |t|
      t.string :number
      t.boolean :activated, default: false

      t.timestamps
    end
  end
end
