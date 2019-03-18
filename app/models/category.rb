class Category < ApplicationRecord
	has_many :products
	validates :name, presence: true, uniqueness: true, length: {maximum: 15}
end
