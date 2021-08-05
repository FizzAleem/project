class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, except: [:index,:show]
  before_action :valid_account,only:[:edit,:update,:destroy]
  # GET /products or /products.json
  def index
    @products = Product.all.with_attached_images

    # @order_item = current_order.order_item.new

    # render json: @products.map { |product|
    #   product.as_json.merge({ images: url_for(product.images) })
    # }
  end

  # GET /products/1 or /products/1.json
  def show
    @product =Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end



  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.account_id = current_account.id


    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :description, images:[])
    end

    def valid_account
      @prod = current_account.products.find_by(id: params[:id])
      redirect_to products_path,notice: "authorization failed" if @prod.nil?
    end


end
