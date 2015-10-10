class Admin::BenzodiazepinesController < Admin::AdminController

  def new
    @benzo = Benzodiazepine.new
    @receptor_list = Benzodiazepine.receptor_list
  end

  def create
    @benzo = Benzodiazepine.new(benzo_attributes)
    if @benzo.save
      redirect_to admin_benzodiazepines_index_path
    else
      render :new
      return
    end
  end

  def edit
    @benzo = Benzodiazepine.where(:primary_name => params[:id]).first
    @receptor_list = Benzodiazepine.receptor_list
  end

  def save
  end

  def update
    @benzo = Benzodiazepine.update(benzo_attributes[:id], benzo_attributes)
    @receptor_list = Benzodiazepine.receptor_list
    if @benzo
      redirect_to admin_benzodiazepines_path
    else
      flash[:error] = @benzo.errors
      render :edit
      return
    end
  end

  def index
    @benzos = Benzodiazepine.all
  end

  def benzo_attributes
    params.require(:benzodiazepine).permit(:id, :primary_name, :valium_equiv, :description, :half_life, :full_name, :paper_feed, :onset, affinity: Benzodiazepine.stored_attributes[:affinity], trade_names: [], other_names: [], classes: [])
  end

end
