class LineItemsController < ApplicationController
	def index
    @line = LineItem.all
  end

	def update_add_quantity

		line_item = current_cart.line_items.find_by_id(params[:line_item_id])
		line_item.update(quantity: line_item.quantity + 1)

		redirect_to '/welcome/cart'
	end

	def update_quantity

		line_item2 = current_cart.line_items.find_by_id(params[:line_item_id])
		line_item2.update(quantity: line_item2.quantity + params[:quantity].to_i)

		redirect_to '/welcome/cart'
	end

	private

	def current_cart
		@cart = Cart.last
	end

	def line_items_params
      params.require(:line_items).permit(:product_id, :quantity, :subtotal)
    end
end
