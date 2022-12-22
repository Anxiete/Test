class ClansController < ApplicationController
  def index
    @clans = CardClan.all.page(params[:page])
    @clan_header = true
  end

  def show
    @clan = CardClan.find(params[:id])
    @clan_cards = @clan.cards.page(params[:page]).per(12)
  end
end
