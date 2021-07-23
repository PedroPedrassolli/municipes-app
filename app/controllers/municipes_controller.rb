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
      saved_or_updated
    else
      failed('new')
    end
  end

  def update
    if @municipe.update(municipe_params)
      saved_or_updated
    else
      failed('edit')
    end
  end

  def show; end

  def edit; end

  private

  def set_municipe
    @municipe = Municipe.find_or_initialize_by(id: params[:id])
  end

  def saved_or_updated
    flash.now[:success] = I18n.t('messages.saved')
    redirect_to municipe_path(@municipe)
  end

  def failed(action)
    flash.now[:danger] = @municipe.errors.full_messages.to_sentence
    render action
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birthdate, :phone, :photo, :status)
  end
end
