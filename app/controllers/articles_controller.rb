class ArticlesController < ApplicationController
    before_action :require_admin, only: [:new,:create,:update,:destroy,:edit]
    before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        if @article.portrait == "" or @article.portrait == nil
            @article.portrait = String(params['article']['portrait_cache'])
        end
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
            
    end
    
    def show
        @article = Article.find(params[:id])
    end
 
    def index
        @articles = Article.order(id: :desc)
    end
    
    def update
        @article = Article.find(params[:id])
         
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:success] = "Post completamente deletado!"
 
        redirect_to root_path
    end
 
    private
    def article_params
        params.require(:article).permit(:title, :text, :portrait, :status)
    end
    
end
