class Municipe < ApplicationRecord
  has_one_attached :photo

  validates :name, :cpf, :cns, :email, :birthdate, :phone, :photo, :status, presence: true
  validates :cpf, length: { is: 11 }
  validate :valid_cpf, if: :cpf
  validate :birthdate_data_range, if: :birthdate
  validates :cns, length: { is: 15 }
  validates :cpf, :cns, numericality: { only_integer: true }
  validates :phone, length: { is: 11 }
  validates :phone, phone: true
  validates_format_of :email, with: Devise.email_regexp

  validates :cpf, :email, :phone, :cns, uniqueness: true

  private

    def valid_cpf
      errors.add(:cpf, I18n.t('errors.messages.invalid')) unless CPF.valid?(self.cpf)
    end

    def birthdate_data_range
      errors.add(:birthdate, I18n.t('errors.messages.invalid')) unless ((100.years.ago)..(1.day.ago)).include?(self.birthdate)
    end
end
