class Purchaser::ListsController < PurchaserController
  before_action :set_purchaser_list, only: [:show, :edit, :update, :destroy]

  # GET /purchaser/lists
  # GET /purchaser/lists.json
  def index
    @purchaser_lists = Purchaser::List.all
  end

  # GET /purchaser/lists/1
  # GET /purchaser/lists/1.json
  def show
  end

  # GET /purchaser/lists/new
  def new
    @purchaser_list = Purchaser::List.new
  end

  # GET /purchaser/lists/1/edit
  def edit
  end

  # POST /purchaser/lists
  # POST /purchaser/lists.json
  def create
    if !login_user
      respond_to do |format|
        format.html { redirect_to login_path}
        format.json { head :no_content }
      end
      return
    end
    @cart = current_cart
    product = Seller::Product.find(params[:product_id])
    @purchaser_list = @cart.add_product(product.id)
    respond_to do |format|
      if @purchaser_list.save
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @purchaser_list }
      else
        format.html { render :new }
        format.json { render json: @purchaser_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchaser/lists/1
  # PATCH/PUT /purchaser/lists/1.json
  def update
    respond_to do |format|
      if @purchaser_list.update(purchaser_list_params)
        format.html { redirect_to @purchaser_list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchaser_list }
      else
        format.html { render :edit }
        format.json { render json: @purchaser_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchaser/lists/1
  # DELETE /purchaser/lists/1.json
  def destroy
    @purchaser_list.destroy
    respond_to do |format|
      format.html { redirect_to purchaser_lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchaser_list
      @purchaser_list = Purchaser::List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchaser_list_params
      params[:purchaser_list]
    end
end
