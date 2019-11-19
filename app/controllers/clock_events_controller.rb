class ClockEventsController < ApplicationController
  before_action :set_teacher
  before_action :set_clock_event, only: [:show, :edit, :update, :destroy]

  # GET /clock_events
  # GET /clock_events.json
  def index
    @clock_events = ClockEvent.all
  end

  # GET /clock_events/1
  # GET /clock_events/1.json
  def show
  end

  # GET /clock_events/new
  def new
    # @clock_event = ClockEvent.new
    @clock_event = @teacher.clock_events.build
  end

  # GET /clock_events/1/edit
  def edit
  end

  # POST /clock_events
  # POST /clock_events.json
  def create
    @clock_event = @teacher.clock_events.build(clock_event_params)

    if @clock_event.save
      flash[:success] = "You have successfully clocked in"
      redirect_to [@teacher, @clock_event]
    else
      render 'new'
    end
  end

  # PATCH/PUT /clock_events/1
  # PATCH/PUT /clock_events/1.json
  def update
    respond_to do |format|
      if @clock_event.update(clock_event_params)
        format.html { redirect_to teacher_clock_event_path(@teacher), notice: 'Clock event was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock_event }
      else
        format.html { render :edit }
        format.json { render json: @clock_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clock_events/1
  # DELETE /clock_events/1.json
  def destroy
    @clock_event.destroy
    flash[:danger] = 'Clock event was successfully destroyed.'
    redirect_to teacher_clock_events_path(@teacher)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_event
      @clock_event = ClockEvent.find(params[:id])
    end

    def set_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clock_event_params
      params.require(:clock_event).permit(:clock_in, :clock_out, :teacher_id)
    end
end
