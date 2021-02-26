class DosesController < ApplicationController
  
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      flash[:success] = 'Dose successfully created'
      redirect_to cocktail_path(@cocktail)
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      flash[:success] = 'Dose was successfully deleted.'
      # redirect_to :root
    else
      flash[:error] = 'Something went wrong'
      # redirect_to :root
    end
  end
  

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
