class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
  end

  def create
    @municipe = Municipe.new(municipe_params)
    if @municipe.save
      redirect_to municipe_path(@municipe)
    else
      render :new
    end
  end

  def update
    if @municipe.update(municipe_params)
      redirect_to edit_municipe_path(@municipe)
    else
      render :edit
    end
  end

  def show; end

  def edit; end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birthdate, :phone, :photo, :status)
  end
end
