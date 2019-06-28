class RenameDetailSalesToLineItems < ActiveRecord::Migration[5.2]
  def change
  	rename_table :detail_sales, :line_items
  end
end
