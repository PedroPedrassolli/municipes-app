class MunicipeDecorator < Draper::Decorator
  delegate_all

  def cpf
    CPF.new(object.cpf).formatted
  end

  def birthdate
    object.birthdate.strftime("%d/%m/%Y")
  end

  def status
    if object.status
      I18n.t('activerecord.attributes.municipe.status.active')
    else
      I18n.t('activerecord.attributes.municipe.status.inactive')
    end
  end

  def phone
    Phonelib.parse(object.phone).national
  end
end
