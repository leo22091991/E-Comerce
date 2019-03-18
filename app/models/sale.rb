class Sale < ApplicationRecord
	has_many :detail_sales, dependent: :destroy
	has_many :products, through: :datailSales

	before_create :set_date_sale
	accepts_nested_attributes_for :detail_sales
	
	def set_total_cost
		details = self.detail_sales
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
