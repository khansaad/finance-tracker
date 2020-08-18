class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    puts "*****TEST: #{ENV['TEST']}"
  end
end
