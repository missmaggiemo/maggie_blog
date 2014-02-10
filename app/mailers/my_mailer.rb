class MyMailer < ActionMailer::Base
  default from: "messages@missmaggiemo.com"
  default to: "admin@missmaggiemo.com"
  
  def email_blog_post(blog_post)
    @title = blog_post.title
    @content = blog_post.content
    @user = User.find_by_id(blog_post.user_id).name
    @email = User.find_by_id(blog_post.user_id).email
    mail(subject: "Blog post number #{blog_post.id}!")
  end
  
  def email_update(blog_post)
    @title = blog_post.title
    @content = blog_post.content
    @user = User.find_by_id(blog_post.user_id).name
    @email = User.find_by_id(blog_post.user_id).email
    mail(subject: "Blog post number #{blog_post.id} has been updated!")
  end
  
  def email_new_user(user)
    @name = user.name
    @email = user.email
    @id = user.id
    mail(subject: "New user!")
  end
    
end