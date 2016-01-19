class Purchaser::OrdersController < PurchaserController
  before_action :set_purchaser_order, only: [:show, :edit, :update, :destroy]

  # GET /purchaser/orders
  # GET /purchaser/orders.json
  def index
    @purchaser_orders = Purchaser::Order.all
  end

  # GET /purchaser/orders/1
  # GET /purchaser/orders/1.json
  def show
  end

  # GET /purchaser/orders/new
  def new
    @purchaser_order = Purchaser::Order.new
  end

  # GET /purchaser/orders/1/edit
  def edit
  end

  # POST /purchaser/orders
  # POST /purchaser/orders.json
  def create
    @purchaser_order = Purchaser::Order.create(handled:0)
    @purchaser_order.user_id = session[:user_id]
    current_cart.lists.each do |item|
      @purchaser_order.lists<<item
    end
    respond_to do |format|
      if @purchaser_order.save
        format.html { redirect_to @purchaser_order }
        format.json { render :show, status: :created, location: @purchaser_order }
      else
        format.html { render :new }
        format.json { render json: @purchaser_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchaser/orders/1
  # PATCH/PUT /purchaser/orders/1.json
  def update
    respond_to do |format|
      current_user = login_user
      if current_user.money - @purchaser_order.total_price>0
        current_user.money-=@purchaser_order.total_price
        current_user.save
        @purchaser_order.lists.each do |l|
          product = l.product
          product.quantity -= l.quantity
          product.save
        end
        @purchaser_order.handled = 1 #已付款
        @purchaser_order.save
        current_cart.destroy
        session[:cart_id] = nil
        format.html { redirect_to @purchaser_order }
        format.json { render :show, status: :ok, location: @purchaser_order }
      else
        @purchaser_order.handled = 0 #已付款
        @purchaser_order.save
        current_cart.destroy
        format.html { redirect_to @purchaser_order }
        format.json { render :show, status: :ok, location: @purchaser_order }
      end
    end
  end

  # DELETE /purchaser/orders/1
  # DELETE /purchaser/orders/1.json
  def destroy
    @purchaser_order.destroy
    respond_to do |format|
      format.html { redirect_to purchaser_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchaser_order
      @purchaser_order = Purchaser::Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchaser_order_params
      params[:purchaser_order]
    end
end
