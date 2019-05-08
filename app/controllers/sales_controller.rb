class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create

    @sale = Sale.new(total_cost: total_sale)

    current_cart.line_items.each do |li|
      product_id = li.product_id
      quantity = li.quantity
      subtotal = li.subtotal

      @sale.line_items.new(
        product_id: product_id, 
        quantity: quantity, 
        subtotal: subtotal
        )

    end


    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }

        current_cart.line_items.delete_all

      else
        format.html { render :new }
        format.json { render json: @sales.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update

    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:date_sale, line_items_attributes: [:product_id, :quantity])
    end

    def current_cart
      @cart = Cart.first
    end

    def total_sale
      details = current_cart.line_items
      total = 0.0
      details.each do |detalle|
        total = total + detalle.subtotal
      end
      return total
    end
end
