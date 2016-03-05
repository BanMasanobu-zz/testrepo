class PockerController < ApplicationController
  def index
  end

  def show
   poker = Poker.new
   @hand = poker.poker_hand(params[:cards])
  end
end
