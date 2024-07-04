class OrganisersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_organiser, only: %i[show edit update destroy]
  def index
    @organisers = Organiser.all
  end

  def new
    @organiser = Organiser.new
  end

  def create
    @organiser = Organiser.new(organiser_params)
    if @organiser.save
      redirect_to organiser_path(@organiser)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @organiser.update(organiser_params)
    redirect_to organiser_path(@organiser)
  end

  def destroy
    @organiser.destroy
    redirect_to organisers_path, status: :see_other
  end

  private

  def organiser_params
    params.require(:organiser).permit(:name, :url, :facebook, :instagram, :soundcloud)
  end

  def set_organiser
    @organiser = Organiser.find(params[:id])
  end
end
