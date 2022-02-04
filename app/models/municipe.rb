# frozen_string_literal: true

class Municipe < ApplicationRecord
  has_one_attached :photo
  has_one :endereco
  accepts_nested_attributes_for :endereco, allow_destroy: true

  validates :name, :cpf, :cns, :email, :birthdate, :phone, :photo, presence: true
  validates :status, inclusion: { in: [true, false] }
  validates :name, format: { with: /([\w\-']{2,})(\s+)([\w\-']{2,})/ }, if: :name
  validates :cpf, length: { is: 11 }
  validate :valid_cpf, if: :cpf
  validate :birthdate_data_range, if: :birthdate
  validates :cns, length: { is: 15 }
  validates :cpf, :cns, numericality: { only_integer: true }
  validates :phone, length: { is: 11 }
  validates :phone, phone: true, if: :phone
  validates_format_of :email, with: Devise.email_regexp, if: :email

  validates :cpf, :email, :phone, :cns, uniqueness: true

  private

  def valid_cpf
    errors.add(:cpf, I18n.t('errors.messages.invalid')) unless CPF.valid?(cpf)
  end

  def birthdate_data_range
    unless ((120.years.ago)..(1.day.ago)).cover?(birthdate)
      errors.add(:birthdate,
                 I18n.t('errors.messages.invalid'))
    end
  end
end
