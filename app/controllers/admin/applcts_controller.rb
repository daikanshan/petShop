class Admin::ApplctsController < AdminController
  before_action :set_admin_applct, only: [:show, :edit, :update, :destroy]

  # GET /admin/applcts
  # GET /admin/applcts.json
  def index
    @admin_applcts = Admin::Applct.all
  end

  # GET /admin/applcts/1
  # GET /admin/applcts/1.json
  def show
  end

  # GET /admin/applcts/new
  def new
    @admin_applct = Admin::Applct.new
  end

  # GET /admin/applcts/1/edit
  def edit
  end

  # POST /admin/applcts
  # POST /admin/applcts.json
  def create
    @admin_applct = Admin::Applct.new(admin_applct_params)

    respond_to do |format|
      if @admin_applct.save
        format.html { redirect_to @admin_applct, notice: 'Applct was successfully created.' }
        format.json { render :show, status: :created, location: @admin_applct }
      else
        format.html { render :new }
        format.json { render json: @admin_applct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/applcts/1
  # PATCH/PUT /admin/applcts/1.json
  def update
    respond_to do |format|
      if @admin_applct.update(admin_applct_params)
        format.html { redirect_to @admin_applct, notice: 'Applct was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_applct }
      else
        format.html { render :edit }
        format.json { render json: @admin_applct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/applcts/1
  # DELETE /admin/applcts/1.json
  def destroy
    @admin_applct.destroy
    respond_to do |format|
      format.html { redirect_to admin_applcts_url, notice: 'Applct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_applct
      @admin_applct = Admin::Applct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_applct_params
      params.require(:admin_applct).permit(:identity)
    end
end
