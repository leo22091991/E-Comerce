class AddLineItemableIdToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :line_itemable_id, :integer
  end
end
