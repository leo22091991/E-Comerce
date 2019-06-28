class LineItem < ApplicationRecord
	belongs_to :product
	#belongs_to :sale
	#belongs_to :cart
	belongs_to :line_itemable, :polymorphic => true

	before_validation :set_subtotal
	validates :product, presence: :true
	validate :check_quantity

	
	def set_subtotal
		self.subtotal = self.quantity * product.price
	end

	private

	def check_quantity
		if quantity <= 0
			errors.add(:sales, 'no puede disminuir la cantidad del producto a 0 (cero)')
		end
	end

end
