class Admin::DeveloperController < Admin::AuthenticatedController
   def new
    @developer = Developer.new
    @page_title = 'Crear nuevo desarrollador'
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:notice] = "Desarrollador #{@developer.name} creado correctamente."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear nuevo desarrollador'
      render :action => 'new'
    end
  end

  def edit
    @developer = Developer.find(params[:id])
    @page_title = 'Editar desarrollador'
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update_attributes(developer_params)
      flash[:notice] = "Desarrollador #{@developer.name} actualizada correctamente."
      redirect_to :action => 'show', :id => @developer
    else
      @page_title = 'Editar desarrollador'
      render :action => 'edit'
    end
  end

  def show
    @developer = Developer.find(params[:id])
    @page_title = @developer.name
  end
  
  def index
    @developers = Developer.all
    @page_title = 'Listado de desarrolladores'
  end
  
  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy
    flash[:notice] = "Desarrollador #{@developer.name} eliminado correctamente."
    redirect_to :action => 'index'
end

private
    def developer_params
      params.require(:developer).permit(:name)
    end
end

