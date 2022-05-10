class PostsController < ApplicationController
  def index
    @post = Post.new
    @comment = Comment.new(profile: current_user.profile)
    @posts = []
    current_user.profile.friends.each do |friend|
      @posts << friend.posts
    end
    @posts = @posts.flatten.sort_by(&:created_at).reverse!
  end

  def create
    post = Post.new(post_params)
    post.profile = current_user.profile
    if post.save
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
