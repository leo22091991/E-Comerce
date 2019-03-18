class CreateDetailSales < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_sales do |t|
      t.belongs_to :product
      t.belongs_to :sale
      t.integer :quantity
      t.float :subtotal

      t.timestamps
    end
  end
end
