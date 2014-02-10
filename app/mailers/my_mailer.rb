class MyMailer < ActionMailer::Base
  default from: "messages@missmaggiemo.com"
  default to: "admin@missmaggiemo.com"
  
  def email_blog_post(blog_post)
    @blog_post = blog_post
    @user = User.find_by_id(blog_post.user_id)
    mail(subject: "Blog post number #{blog_post.id}!")
  end
  
  def email_update(blog_post)
    @blog_post = blog_post
    @user = User.find_by_id(blog_post.user_id)
    mail(subject: "Blog post number #{blog_post.id} has been updated!")
  end
  
  def email_destroy(blog_post)
    @blog_post = blog_post
    @user = User.find_by_id(blog_post.user_id)
    mail(subject: "Blog post number #{blog_post.id} has been deleted!")
  end
  
  def email_new_user(user)
    @user = user
    mail(subject: "New user!")
  end
    
end