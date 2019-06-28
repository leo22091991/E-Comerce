class WelcomeController < ApplicationController
  def index
  	@products = Product.all
  end

  def cart
  	@products = Product.all
  	@cart = Cart.first
  end

  def update
  	
  end

  private
  	def current_car
      @cart = Cart.first
    end
end
