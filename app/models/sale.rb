class Sale < ApplicationRecord
	has_many :line_items, :as => :line_itemable, dependent: :destroy
	has_many :products, through: :line_items


	#before_create :set_total_cost
	validate :check_sales
	before_create :set_date_sale
	accepts_nested_attributes_for :line_items


	
	private

	def set_date_sale
		self.date_sale = self.created_at
	end

	def check_sales
		if total_cost == 0.0
			errors.add(:sales, 'no agrego ningun producto al carrito')
		end	
	end




end
#
#Sale.create(
#	detail_sales: [
#		{product_id: 6, quantity: 2}
#	]
#)
#
#Sale.new(line_items_attributes: [{product_id: 6, quantity: 2}])
