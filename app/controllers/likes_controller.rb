class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
    @activity = @like.activity
    render turbo_stream:
    turbo_stream.replace("likecounter#{@activity.id}",
      partial: "/activities/likecounter",
      locals: {activity: @like.activity }
      )
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @activity = @like.activity

    @like.destroy

    render turbo_stream:
    turbo_stream.replace("likecounter#{@activity.id}",
      partial: "/activities/likecounter",
      locals: {activity: @like.activity }
    )
  end

  private

  def like_params
    params.require(:like).permit(:activity_id)
  end

end
