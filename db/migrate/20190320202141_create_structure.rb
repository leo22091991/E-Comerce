class CreateStructure < ActiveRecord::Migration[5.2]
  def change
  	create_table "categories", force: :true do |t|
	    t.string "name"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

	create_table "detail_sales", force: :true do |t|
	    t.integer "product_id"
	    t.integer "sale_id"
	    t.integer "quantity"
	    t.float "subtotal"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
	    t.index ["product_id"], name: "index_detail_sales_on_product_id"
	    t.index ["sale_id"], name: "index_detail_sales_on_sale_id"
  	end

  	create_table "products", force: :true do |t|
	    t.integer "category_id"
	    t.string "name"
	    t.float "price"
	    t.text "description"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
	    t.index ["category_id"], name: "index_products_on_category_id"
  	end

  	create_table "sales", force: :true do |t|
	    t.date "date_sale"
	    t.float "total_cost"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
   	end
  end
end
