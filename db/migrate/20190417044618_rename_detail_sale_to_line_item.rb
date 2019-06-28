class RenameDetailSaleToLineItem < ActiveRecord::Migration[5.2]
  def self.up 
    rename_table :detail_sale, :line_item 
    end 

   def self.down 
    rename_table :line_item, :detail_sale 
   end 
end 
end
