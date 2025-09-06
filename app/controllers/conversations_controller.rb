# app/controllers/conversations_controller.rb
class ConversationsController < ApplicationController
  def create
    @other_user = User.find(params[:user_id])
    
    # Sprawdź czy konwersacja już istnieje
    existing_conversation = current_user.conversation_with(@other_user)
    
    if existing_conversation
      redirect_to room_path(existing_conversation.room)
    else
      @conversation = Conversation.find_or_create_between(current_user, @other_user)
      redirect_to room_path(@conversation.room), notice: "Rozpoczęto rozmowę z #{@other_user.username}"
    end
    
  rescue ActiveRecord::RecordNotFound
    redirect_to rooms_path, alert: 'Użytkownik nie został znaleziony.'
  rescue StandardError => e
    redirect_to rooms_path, alert: 'Błąd podczas tworzenia rozmowy.'
  end
end
