class CommentsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @comment = Comment.find(params[:id])

    unless @comment.can_be_updated_or_deleted_by(current_user)
      flash[:danger] = 'You do not have the right to delete this comment !'
      redirect_to @comment.post
      return
    end

    post = @comment.post
    @comment.destroy
    redirect_to [post]
  end

  def get_comment_params
    return :content, :post_id
  end

  def create
    @comment = Comment.new
    @comment.user = current_user
    @comment.date = Date.today
    @comment.update_attributes params[:comment].permit(get_comment_params)
    if @comment.save
      redirect_to [@comment.post]
    else
      puts 'ERROR'
      render @comment.post
    end
  end

end
