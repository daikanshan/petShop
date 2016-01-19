class Seller::ProductsController < SellerController
  before_action :set_seller_product, only: [:show, :edit, :update, :destroy]

  # GET /seller/products
  # GET /seller/products.json
  def index
    @seller_products = login_user.products.paginate(page:params[:page],per_page:10)
  end

  # GET /seller/products/1
  # GET /seller/products/1.json
  def show
  end

  # GET /seller/products/new
  def new
    @seller_product = Seller::Product.new
  end

  # GET /seller/products/1/edit
  def edit
  end

  # POST /seller/products
  # POST /seller/products.json
  def create
    @seller_product = Seller::Product.new(seller_product_params)
    @seller_product.user_id = login_user.id
    respond_to do |format|
      if @seller_product.save
        format.html { redirect_to @seller_product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @seller_product }
      else
        format.html { render :new }
        format.json { render json: @seller_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seller/products/1
  # PATCH/PUT /seller/products/1.json
  def update
    respond_to do |format|
      if @seller_product.update(seller_product_params)
        format.html { redirect_to @seller_product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @seller_product }
      else
        format.html { render :edit }
        format.json { render json: @seller_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller/products/1
  # DELETE /seller/products/1.json
  def destroy
    @seller_product.destroy
    respond_to do |format|
      format.html { redirect_to seller_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_product
      @seller_product = Seller::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_product_params
      params.require(:seller_product).permit(:name, :price, :avatar,:avatar_cache, :user_id)
    end
end
