class AddLineItemableTypeToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :line_itemable_type, :string
  end
end
