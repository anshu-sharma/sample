class MagazinesController < ApplicationController
	
	def index
		@magazines=Magazine.all

	end
	
	def new
		@magazine=Magazine.new		
		@articals = @magazine.articles.build #nested attr

	end

	def create
		@magazine = Magazine.new(user_params)
        @magazine.save
     	redirect_to magazines_path	
	end
	def edit
		@magazine=Magazine.find(params[:id])
	end
	def show
        @magazine= Magazine.find(params[:id])
        #@article=@magazine.articles.new
        @article=Article.new
        @articals= @magazine.articles 
        @comment=Comment.new 
        # @artical=Article.find(params[:id])
        # @comments=Comment.where(article_id:@artical.id)
     

    end
    
    def destroy
    Magazine.find(params[:id]).destroy
    redirect_to magazines_url
    end

    def update
    	@magazine=Magazine.find(params[:id])
    	if @magazine.update_attributes(user_params)
    	flash[:success]="profile updated"
    	redirect_to @magazine
        else
          render 'edit'
        end  
    end
end

private

def user_params
    params.require(:magazine).permit(:title, :description, :price,:articles_attributes =>[:title,:content])
end