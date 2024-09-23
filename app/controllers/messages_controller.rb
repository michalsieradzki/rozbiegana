class MessagesController < ApplicationController
  def index
    @messages = Message.order(created_at: :desc).limit(50)
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.turbo_stream
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
