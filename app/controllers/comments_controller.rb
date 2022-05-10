class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = post
    comment.profile = current_user.profile
    if comment.save
      redirect_to posts_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :profile_id, :content_id)
  end
end
