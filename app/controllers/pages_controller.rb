class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: []

  def home
    @partner = current_user.partner
    @animal_url = AnimalPictureService.new(animal: current_user.animal).call
  end
end




