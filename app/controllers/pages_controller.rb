class PagesController < ApplicationController
  def index
    @articles = Article.all
  end
  def config_panel
    
  end
  def partial
    render partial: "layouts/painelMenus"
  end
end
