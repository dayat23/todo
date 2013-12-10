class Admin::PersonalsController < AdminAppController
  before_action :set_personal, only: [:show, :edit, :update, :destroy]

  # GET /admin/personals
  # GET /admin/personals.json
  def index
    @personals = Personal.all
  end

  # GET /admin/personals/1
  # GET /admin/personals/1.json
  def show
  end

  # GET /admin/personals/new
  def new
    @personal = Personal.new
  end

  # GET /admin/personals/1/edit
  def edit
  end

  # POST /admin/personals
  # POST /admin/personals.json
  def create
    @personal = Personal.new(personal_params)

    respond_to do |format|
      if @personal.save
        format.html { redirect_to [:admin, @personal], notice: 'Personal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @personal }
      else
        format.html { render action: 'new' }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/personals/1
  # PATCH/PUT /admin/personals/1.json
  def update
    respond_to do |format|
      if @personal.update(personal_params)
        format.html { redirect_to [:admin, @personal], notice: 'Personal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/personals/1
  # DELETE /admin/personals/1.json
  def destroy
    @personal.destroy
    respond_to do |format|
      format.html { redirect_to admin_personals_url, notice: 'Personal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal
      @personal = Personal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_params
      params.require(:personal).permit(:first_name, :last_name, :photo)
    end
end
