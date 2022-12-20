class CardController < ApplicationController
  def index
    @cards = Card.includes(:card_clan).all.order(created_at: :desc).page(params[:page])
  end

  def show
    @card = Card.find(params[:id])
  end

  def search
    @search_header = true
    search = params[:search].to_s
    clan = params[:clans].to_s
    grade = params[:grades].to_s

    @cards_search = if params[:grades].present? && params[:clans].present?
                      Card.where("name LIKE ? AND card_clan_id = ? AND grade = ?", "%#{search}%", clan.to_s,
                                 grade.to_s).order(:name).includes(:card_clan).all.page(params[:page]).per(12)
                    elsif params[:grades].present?
                      Card.where("name LIKE ? AND grade = ?", "%#{search}%",
                                 grade.to_s).order(:name).includes(:card_clan).all.page(params[:page]).per(12)
                    elsif params[:clans].present?
                      Card.where("name LIKE ? AND card_clan_id = ?", "%#{search}%",
                                 clan.to_s).order(:name).includes(:card_clan).all.page(params[:page]).per(12)
                    else
                      Card.where("name LIKE ?",
                                 "%#{search}%").order(:name).includes(:card_clan).all.page(params[:page]).per(12)
                    end
  end
end
