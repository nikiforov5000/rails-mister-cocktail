class CocktailsController < ApplicationController
  before_action :set_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktails
  end

  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:success] = "Object successfully created"
      redirect_to @cocktail
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
