class Cart < ApplicationRecord
	has_many :line_items, :as => :line_itemable, dependent: :destroy
	has_many :products, through: :line_items

	before_update :set_totals

	
	validate :check_products
	
	accepts_nested_attributes_for :line_items


	def set_totals
		details = self.line_items
		total = 0.0
		details.each do |det|
			total = total + det.subtotal
		end
		return total
	end

	private

	def check_products
		products_added = []
		line_items.each do |line_item|
			if products_added.include? line_item.product_id
				errors.add(:line_items, 'Este producto ya fue agregado')	
			else
				products_added << line_item.product_id
			end
		end
	end
end

