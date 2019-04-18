class LineItem < ApplicationRecord
	belongs_to :product
	#belongs_to :sale
	#belongs_to :cart
	belongs_to :line_itemable, :polymorphic => true

	before_validation :set_subtotal
	validates :product, presence: :true
	#validates :sale, presence: :true

	
	def set_subtotal
		self.subtotal = self.quantity * product.price
	end
end
