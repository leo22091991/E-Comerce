class Cart < ApplicationRecord
	has_many :line_items, :as => :line_itemable, dependent: :destroy
	has_many :products, through: :line_items

	accepts_nested_attributes_for :line_items
end
