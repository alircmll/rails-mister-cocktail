class DosesController < ApplicationController
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = @cocktail.doses
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    dose = Dose.find(params[:id])
    cocktail = dose.cocktail
    dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :dose_id)
  end
end
