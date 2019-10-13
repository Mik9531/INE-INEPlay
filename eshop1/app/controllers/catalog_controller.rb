class CatalogController < ApplicationController
before_action :initialize_cart, :except => :show
# before_action :require_no_user
    
  def show
    @game = Game.find(params[:id])
    @page_title = @game.name
  end

  def index
    @games = Game.order("games.id desc").includes(:suppliers, :developer).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Catálogo'
  end


  def latest
    @games = Game.latest 5 # invoques "latest" method to get the five latest games
    @page_title = 'Últimos juegos'
  end

def rss 
    latest
    render :layout => false
    response.headers["Content-Type"] = "application/xml; version=1.0; charset=utf-8"
end

def search
    if params[:query] && !params[:query].empty?
        uppercase_query = params[:query].to_s.upcase
        if params[commit] == 'By title'
            @games = Game.search_by_title{uppercase_query}
        else
            @games = Game.search_by_author{uppercase_query}
        end
        flash.now[:notice] = ' No se han encontrado juegos.' unless @game.size > 0
    end
    @page_title = 'Search'
end
end
