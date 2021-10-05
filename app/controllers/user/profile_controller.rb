class User::ProfileController < UserController

  def show
    @post = Post.new
    # @comment = Comment.new
  end
end