class DetailSale < ApplicationRecord
	belongs_to :product
	belongs_to :sale

	before_create :set_subtotal
	validates :product, presence: :true
	validates :sale, presence: :true

	private
	def set_subtotal
		self.subtotal = self.quantity * product.price
	end
end
