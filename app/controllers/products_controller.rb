class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update ]
# hien thi
  def index
    @products = Product.all
  end
# show id
  def show
    @product = Product.find(params[:id])
  end
# tao san pham moi
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  # sua san pham
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def product_params
      params.expect(product: [ :name ])
    end

    def product_params
      params.expect(product: [ :name ])
    end
end