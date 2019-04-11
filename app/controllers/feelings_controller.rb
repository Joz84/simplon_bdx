class FeelingsController < ApplicationController
  def create
    @feeling = Feeling.new(feeling_params)
    if @feeling.save
      redirect_to root_path
    else
      @partner = current_user.partner
      @animal_url = AnimalPictureService.new(animal: current_user.animal).call
      render "pages/home"
    end
  end

  private

  def feeling_params
    parameters = params.require(:feeling).permit(:rating)
    { rating: (parameters[:rating].empty? ? nil : parameters[:rating].to_i),
      date: Date.today,
      user: current_user
    }
  end
end
