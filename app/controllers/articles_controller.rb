class ArticlesController < ApplicationController

    def index
	
    end
	def create
	@magazine = Magazine.find(params[:magazine_id])
	@artical = @magazine.articles.create(article_params)
	@artical.save
    redirect_to magazine_path(params[:magazine_id])
	end
	def destroy
	@article=Article.find(params[:id])
	@article.destroy
	redirect_to magazine_path(params[:magazine_id])
    end
		 

end
private
def article_params
	params.require(:article).permit(:title,:content)
end