# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def default_url_options
    { host: request.host_with_port }
  end
end
