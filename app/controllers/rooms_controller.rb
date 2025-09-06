# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  before_action :check_room_access, only: [:show]
  
  def index
    @rooms = Room.accessible_by(current_user).includes(:users)
    @current_room = @rooms.find_by(room_type: :general) || @rooms.first
    
    if @current_room
      redirect_to room_path(@current_room)
    else
      flash[:alert] = "Brak dostępu do pokoi chatu."
      redirect_to root_path
    end
  end
  
  def show
    @room_messages = @room.room_messages.includes(:user)
                          .order(created_at: :asc).limit(50)
    @new_message = @room.room_messages.build
    
    # DODAJ Z POWROTEM @rooms żeby view nie pękł
    @rooms = Room.accessible_by(current_user)
    
    # NOWE: Podziel pokoje na publiczne i prywatne
    @public_rooms = Room.accessible_by(current_user).public_rooms
    @conversations = current_user.conversations.includes(:room, :sender, :recipient)
                                              .joins(:room)
                                              .order('rooms.updated_at DESC')
    
    # Lista userów dostępnych do rozmowy
    existing_conversation_user_ids = @conversations.map { |c| c.other_user(current_user).id }
    @available_users = User.active
                          .where.not(id: [current_user.id] + existing_conversation_user_ids)
                          .order(:username)
  end
  
  private
  
  def set_room
    @room = Room.find(params[:id])
  end
  
  def check_room_access
    unless @room.can_read?(current_user)
      redirect_to rooms_path, alert: 'Brak dostępu do tego pokoju.'
    end
  end
end

