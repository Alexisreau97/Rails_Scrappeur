class HomeController < ApplicationController
  def index

  end

  def new
  	@crypto = Crypto.new
  end
end
