class CommentsController < ApplicationController
    before_action :load_commentable
  def index
    @commentable = Article.find(params[:article_id])
    @comments = @commentable.comments
    @comment = Comment.all
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(allowed_params)  
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def allowed_params
    params.require(:comment).permit(:name, :content)
  end
end
