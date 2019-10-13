class Admin::GameController < Admin::AuthenticatedController
  def new
    load_data
    @game = Game.new
    @page_title = 'Crear nuevo juego'
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "Juego #{@game.name} creado correctamente."
      redirect_to :action => 'index'
    else
      load_data
      @page_title = 'Crear nuevo juego'
      render :action => 'new'
    end
  end

  def edit
    load_data
    @game = Game.find(params[:id])
    @page_title = 'Editar juego'
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      flash[:notice] = "Juego #{@game.name} actualizado correctamente."
      redirect_to :action => 'show', :id => @game
    else
      load_data
      @page_title = 'Editar juego'
      render :action => 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Juego #{@game.name} eliminado correctamente."
    redirect_to :action => 'index'
  end

  def show
    @game = Game.find(params[:id])
    @page_title = @game.name
  end

  def index
    sort_by = params[:sort_by]
    @games = Game.order(sort_by).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Listado de juegos'
  end

  private

    def load_data
      @suppliers = Supplier.all
      @developers = Developer.all
    end

    def game_params
      params.require(:game).permit(:name, :developer_id, :developed_at, { :supplier_ids => [] },
                                    :blurb, :pegi, :price, :cover_image)
    end
end
