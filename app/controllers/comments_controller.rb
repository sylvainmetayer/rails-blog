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
      flash[:warning] = 'You cannot post an empty comment !'
      redirect_to url_for(:controller => :posts, :action => :show, :id => @comment.post.id)
    end
  end

end
