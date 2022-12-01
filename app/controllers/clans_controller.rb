class ClansController < ApplicationController
  def index
    @clans = CardClan.all.page(params[:page])
    @clan_header = true
  end

  def show
    @clan = CardClan.find(params[:id])
  end
end
