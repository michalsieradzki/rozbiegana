# app/controllers/room_messages_controller.rb  
class RoomMessagesController < ApplicationController
  before_action :set_room
  before_action :check_write_access
  
  def create
    @message = @room.room_messages.build(message_params)
    @message.user = current_user
    
    respond_to do |format|
      if @message.save
        format.turbo_stream { head :ok }
        format.html { redirect_to room_path(@room) }
      else
        format.turbo_stream { 
          render turbo_stream: turbo_stream.replace(
            "room_message_form", 
            partial: "room_messages/form", 
            locals: { room: @room, message: @message }
          )
        }
        format.html { redirect_to room_path(@room), alert: "Błąd wysyłania wiadomości." }
      end
    end
  end
  
  private
  
  def set_room
    @room = Room.find(params[:room_id])
  end
  
  def check_write_access
    unless @room.can_write?(current_user)
      respond_to do |format|
        format.turbo_stream { head :forbidden }
        format.html { 
          redirect_to room_path(@room), alert: 'Brak uprawnień do pisania w tym pokoju' 
        }
      end
    end
  end
  
  def message_params
    params.require(:room_message).permit(:content)
  end
end


