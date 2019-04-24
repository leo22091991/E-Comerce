class Cart < ApplicationRecord
	has_many :line_items, :as => :line_itemable, dependent: :destroy
	has_many :products, through: :line_items

	before_create :set_total
	accepts_nested_attributes_for :line_items


	def set_total
		details = self.line_items
		self.total = 0
		details.each do |det|
			self.total = self.total + det.subtotal
		end
		return total
	end
end
