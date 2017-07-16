class TableLocationsController < ApplicationController
  before_filter :require_superuser!

  before_action :set_table_location, only: [:show, :edit, :update, :destroy]

  # GET /table_locations
  # GET /table_locations.json
  def index
    @table_locations = TableLocation.all
  end

  # GET /table_locations/1
  # GET /table_locations/1.json
  def show
    @upcoming_events = @table_location.table_events.where("starts_at > ?", Time.now).order(:starts_at)
    @recent_events = @table_location.table_events.where(starts_at: 1.month.ago..Time.now).order("starts_at desc")
  end

  # GET /table_locations/new
  def new
    @table_location = TableLocation.new
  end

  # GET /table_locations/1/edit
  def edit
  end

  # POST /table_locations
  # POST /table_locations.json
  def create
    @table_location = TableLocation.new(table_location_params)

    respond_to do |format|
      if @table_location.save
        format.html { redirect_to @table_location, notice: 'Table location was successfully created.' }
        format.json { render :show, status: :created, location: @table_location }
      else
        format.html { render :new }
        format.json { render json: @table_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_locations/1
  # PATCH/PUT /table_locations/1.json
  def update
    respond_to do |format|
      if @table_location.update(table_location_params)
        format.html { redirect_to @table_location, notice: 'Table location was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_location }
      else
        format.html { render :edit }
        format.json { render json: @table_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_locations/1
  # DELETE /table_locations/1.json
  def destroy
    @table_location.destroy
    respond_to do |format|
      format.html { redirect_to table_locations_url, notice: 'Table location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_location
      @table_location = TableLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_location_params
      params.require(:table_location).permit(:name, :status, :latitude, :longitude, :starts_at, :ends_at, :ward)
    end
end
