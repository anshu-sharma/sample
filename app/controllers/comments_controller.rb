class CommentsController < ApplicationController

	def index
		
	end

	def create
	# @magazine = Magazine.find(params[:magazine_id])
    @article = Article.find(params[:article_id])
	@comment = @article.comments.create(comment_params)
	@comment.save
    redirect_to magazine_path(params[:magazine_id])
	end
	def destroy
    # @article = Article.find(params[:article_id])
    # @comments=@article.comments
    # @comment=@comments.find(params[:id])
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to magazine_path(params[:magazine_id])
    end

end

private

def comment_params
	params.require(:comment).permit(:content)
end