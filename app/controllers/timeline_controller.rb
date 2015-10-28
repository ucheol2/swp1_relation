class TimelineController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def wall
    user = User.find(params[:id].to_i)
    @blogs = user.blogs
  end
  
  def write
    Blog.create(content: params[:content], user: current_user)
    redirect_to :back
  end
  
  def comment
    blog = Blog.find(params[:blog_id].to_i)
    Comment.create(blog: blog, msg: params[:content], user: current_user)
    redirect_to :back
  end
  
  def comment_delete
    comment = Comment.find(params[:id].to_i)
    comment.destroy
    redirect_to :back
  end
  
  def comment_modify
    comment = Comment.find(params[:id].to_i)
    comment.update(msg: params[:content])
    redirect_to :back
  end
end
