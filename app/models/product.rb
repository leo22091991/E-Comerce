class Product < ApplicationRecord
  belongs_to :category
  has_many :LineItems
  has_many :sales, through: :LineItems

  validates :name, presence: :true, length: {in: 5..40}, uniqueness: true
  validates :price, presence: :true, numericality: true
  validates :description, presence: :true, length: {maximum: 100}
end
