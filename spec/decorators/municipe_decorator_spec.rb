# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipeDecorator do
  let(:municipe) { build(:municipe) }

  it { expect(municipe.decorate.birthdate).to eq I18n.l(municipe.birthdate) }
  it { expect(municipe.decorate.cpf).to eq CPF.new(municipe.cpf).formatted }
  it { expect(municipe.decorate.phone).to eq Phonelib.parse(municipe.phone).national }
  it { expect(municipe.decorate.status).to eq I18n.t('activerecord.attributes.municipe.status.active') }
end
