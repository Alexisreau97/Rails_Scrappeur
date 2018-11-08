class HomeController < ApplicationController


  def index
    @crypto = Cryptodb.new
      StartScrap.new.perform
  end

  def show
	   @crypto_id = Cryptodb.find(params[:cryptodb][:id].to_f)
  end

end
