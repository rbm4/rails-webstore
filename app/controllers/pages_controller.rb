class PagesController < ApplicationController
  def index
    @articles = Article.all
  end
  def config_panel
    
  end
end
