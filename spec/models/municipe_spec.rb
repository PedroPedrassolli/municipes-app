# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipe, type: :model do
  context 'presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:photo) }
  end

  context 'uniqueness validations' do
    it { should validate_uniqueness_of(:cpf) }
    it { should validate_uniqueness_of(:cns) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:phone) }
  end

  context 'wrong value validations' do
    it { should_not allow_value('test.com').for(:email) }
    it { should_not allow_value(11_111_111_111).for(:phone) }
    it { should_not allow_value(11_111_111_111).for(:cpf) }
    it { should_not allow_value(121.years.ago).for(:birthdate) }
  end

  context 'numericality validations' do
    it { should validate_numericality_of(:cpf) }
    it { should validate_numericality_of(:cns) }
  end
end
