class AttendeesController < ApplicationController
  before_filter :require_superuser!

  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  # GET /attendees
  # GET /attendees.json
  def index
    @attendees = Attendee.all
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to :back, success: 'RSVP was successfully added.' }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { redirect_to :back, error: "There was a problem. #{@attendee.errors.full_messages.join('. ')}" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendees/1
  # PATCH/PUT /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to :back, success: 'RSVP was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendee }
      else
        format.html { redirect_to :back, error: "There was a problem. #{@attendee.errors.full_messages.join('. ')}" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee.destroy
    respond_to do |format|
        format.html { redirect_to :back, success: 'RSVP was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:volunteer_id, :status, :event_id, :event_type, :rsvp)
    end
end
