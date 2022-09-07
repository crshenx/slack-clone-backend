class RoomsController < ApplicationController

  def index
    @current_user = current_user
    redirect_to '/login' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    render :json 
  end

end
