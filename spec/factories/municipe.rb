# frozen_string_literal: true

FactoryBot.define do
  factory :municipe do
    name { FFaker::Name.name }
    email       { FFaker::Internet.safe_email }
    cpf         { FFaker::IdentificationBR.cpf }
    cns         { 172_845_036_010_007 }
    birthdate   { 50.years.ago }
    phone       { FFaker::PhoneNumberBR.mobile_phone_number.delete('^0-9') }
    photo       { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/app/assets/images/user_pfp.jpeg")) }
    status      { true }
  end
end
