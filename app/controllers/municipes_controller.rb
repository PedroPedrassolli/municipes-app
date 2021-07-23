class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  def index
    @municipes = Municipe.all.decorate
  end

  def new
    @municipe = Municipe.new
  end

  def create
    @municipe = Municipe.new(municipe_params)
    if @municipe.save
      flash[:success] = I18n.t('messages.saved')
      redirect_to municipe_path(@municipe)
    else
      flash[:danger] = @municipe.errors.full_messages.to_sentence
      redirect_to new_municipe_path(@municipe)
    end
  end

  def update
    if @municipe.update(municipe_params)
      flash[:success] = I18n.t('messages.saved')
      redirect_to municipe_path(@municipe)
    else
      flash[:danger] = @municipe.errors.full_messages.to_sentence
      redirect_to edit_municipe_path(@municipe)
    end
  end

  def show; end

  def edit; end

  private

  def set_municipe
    @municipe = Municipe.find_or_initialize_by(id: params[:id]).decorate
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birthdate, :phone, :photo, :status)
  end
end
