class MessagesController < ApplicationController

    def create 
        @message = Message.create(message_params)
        @room = Room.find(@message[:room_id])

        RoomsChannel.broadcast_to(@room,@message)
        render json: @message

    end

end
