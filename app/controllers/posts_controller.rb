class PostsController < ApplicationController
  before_action :authenticate_user!, except: %w(index show)

  def index
    @posts = Post.all
  end

  def show
    id = params[:id]
    @post = Post.find(id)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

    unless @post.can_be_updated_or_deleted_by(current_user)
      flash[:danger] = 'You do not have the right to delete this post !'
      redirect_to [@post]
      return
    end

    @post.destroy
    redirect_to [Post]
  end

  def get_post_params
    return :title, :publish_date, :resume, :content, :user
  end

  def update
    @post = Post.find(params[:id])

    unless @post.can_be_updated_or_deleted_by(current_user)
      flash[:danger] = 'You do not have the right to update this post !'
      redirect_to [@post]
      return
    end

    @post.update_attributes params[:post].permit(get_post_params)
    @post.user = current_user
    if @post.save
      redirect_to [@post]
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new
    @post.update_attributes params[:post].permit(get_post_params)
    if @post.save
      redirect_to [@post]
    else
      render 'new'
    end
  end

end
