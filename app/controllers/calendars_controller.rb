class CalendarsController < ApplicationController
  def index
    @calendars = current_user.calendars
    @calendar = Calendar.new
    @rooms = current_user.rooms
  end
  
  def new
    @calendar = Calendar.new
    @room = Room.find(params[:room_id])
    @rooms = current_user.rooms
  end

  def show
    @rooms = current_user.rooms
    @calendar = Calendar.find_by(id: params[:id])
    if @calendar.blank?
      redirect_to calendars_path
    end
  end

  def create
    @calendar = Calendar.create(calendar_params)
    @room = Room.find(params[:room_id])
    @rooms = current_user.rooms
    if @calendar.save
      redirect_to calendars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path
  end

  def edit
    @calendar = Calendar.find(params[:id])
    @rooms = current_user.rooms
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      redirect_to calendars_path
    else
      render :edit
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end
