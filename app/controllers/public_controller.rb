class PublicController < ApplicationController

  def index
    @posts = Post.all
    render 'index'
  end

  def show
    id = params[:id]
    @post = Post.find(id)
  end

end
