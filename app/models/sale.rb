class Sale < ApplicationRecord
	has_many :line_items, :as => :line_itemable, dependent: :destroy
	has_many :products, through: :line_items

	before_create :set_date_sale
	accepts_nested_attributes_for :line_items
	
	def set_total_cost
		details = self.line_items
		total_cost = 0 
		details.each do |ds|
			total_cost = total_cost + ds.subtotal
		end
		return total_cost
	end

	
	private

	def set_date_sale
		self.date_sale = self.created_at
	end


end
#
#Sale.create(
#	detail_sales: [
#		{product_id: 6, quantity: 2}
#	]
#)
#
#Sale.new(detail_sales_attributes: [{product_id: 6, quantity: 2}])
