class BlogPostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :edit, :update, :create, :destroy]
  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @blog_posts = BlogPost.paginate(page: params[:page])
  end
  
  def new
    @blog_post = BlogPost.new
  end
  
  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)
    if @blog_post.save
      MyMailer.email_blog_post(@blog_post).deliver
      flash[:success] = "Posted!"
      redirect_to root_url
    else
      render 'blog_post/index'
    end
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
  end
  
  def edit
    @blog_post = BlogPost.find(params[:id])
  end
  
  def update
    if @blog_post.update_attributes(blog_post_params)
      MyMailer.email_update(@blog_post).deliver
      flash[:success] = "Blog post updated"
      redirect_to blog_post_path(@blog_post.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog_post.destroy
    redirect_to root_url
  end
  
  
  private
  
  def blog_post_params
    params.require("blog_post").permit(:category, :author, :title, :content, :image)
  end
  
  def correct_user
    @blog_post = current_user.blog_posts.find_by(id: params[:id])
    redirect_to root_path if @blog_post.nil?
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
