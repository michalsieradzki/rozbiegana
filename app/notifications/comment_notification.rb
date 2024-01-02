# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  include ActionView::Helpers::DateHelper
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @activity = Activity.find(params[:comment][:activity_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.username.split(" ").first } skomentował Twój bieg #{time_ago_in_words(@comment.created_at)} temu." 
  end
  #
  def url
    activity_path(Activity.find(params[:comment][:activity_id]))
  end
end
