class Purchaser::CartsController < PurchaserController
  before_action :set_purchaser_cart, only: [:show, :edit, :update, :destroy]

  # GET /purchaser/carts
  # GET /purchaser/carts.json
  def index
    @purchaser_carts = Purchaser::Cart.all
  end

  # GET /purchaser/carts/1
  # GET /purchaser/carts/1.json
  def show
    begin
      @cart = Purchaser::Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, :notice => "无效的购物车"
    else
      respond_to do |format|
        format.html
        format.json { render json: @cart }
      end
    end
  end

  # GET /purchaser/carts/new
  def new
    @purchaser_cart = Purchaser::Cart.new
  end

  # GET /purchaser/carts/1/edit
  def edit
  end

  # POST /purchaser/carts
  # POST /purchaser/carts.json
  def create
    @purchaser_cart = Purchaser::Cart.new(purchaser_cart_params)

    respond_to do |format|
      if @purchaser_cart.save
        format.html { redirect_to @purchaser_cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @purchaser_cart }
      else
        format.html { render :new }
        format.json { render json: @purchaser_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchaser/carts/1
  # PATCH/PUT /purchaser/carts/1.json
  def update
    respond_to do |format|
      if @purchaser_cart.update(purchaser_cart_params)
        format.html { redirect_to @purchaser_cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchaser_cart }
      else
        format.html { render :edit }
        format.json { render json: @purchaser_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchaser/carts/1
  # DELETE /purchaser/carts/1.json
  def destroy
    @purchaser_cart = current_cart
    @purchaser_cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchaser_cart
      @purchaser_cart = Purchaser::Cart.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchaser_cart_params
      params[:purchaser_cart]
    end
end
