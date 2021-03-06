class TableEventsController < ApplicationController
  before_filter :require_superuser!

  before_action :set_table_event, only: [:show, :edit, :update, :destroy, :send_contact_details]

  # GET /table_events
  # GET /table_events.json
  def index
    @table_events = TableEvent.all
  end

  # GET /table_events/1
  # GET /table_events/1.json
  def show
  end

  # GET /table_events/new
  def new
    table_location = TableLocation.find_by_id(params[:table_location_id])

    # start on saturday noon to three
    reference_starts_at = 0.days.ago.beginning_of_week + 5.days + 12.hours
    reference_ends_at = reference_starts_at + 3.hours

    @table_event = TableEvent.new(
      table_location: table_location,
      starts_at: reference_starts_at,
      ends_at: reference_ends_at
    )
  end

  # GET /table_events/1/edit
  def edit
  end

  # POST /table_events
  # POST /table_events.json
  def create
    @table_event = TableEvent.new(table_event_params)

    respond_to do |format|
      if @table_event.save
        format.html { redirect_to @table_event, notice: 'Table event was successfully created.' }
        format.json { render :show, status: :created, location: @table_event }
      else
        format.html { render :new }
        format.json { render json: @table_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_events/1
  # PATCH/PUT /table_events/1.json
  def update
    respond_to do |format|
      if @table_event.update(table_event_params)
        format.html { redirect_to @table_event, notice: 'Table event was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_event }
      else
        format.html { render :edit }
        format.json { render json: @table_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_events/1
  # DELETE /table_events/1.json
  def destroy
    @table_event.destroy
    respond_to do |format|
      format.html { redirect_to table_events_url, notice: 'Table event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_contact_details
    TableEventMailer.contact_details(@table_event, current_user).deliver

    redirect_to :back, success: "Email sent!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_event
      @table_event = TableEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_event_params
      params.require(:table_event).permit(:starts_at, :ends_at, :postcards_collected, :volunteers_collected, :status, :table_location_id)
    end
end
