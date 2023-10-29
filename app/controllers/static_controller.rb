class StaticController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
    @first_name = params[:first_name]
  end

  def index
    @gossips = Gossip.all
    if flash[:notice]
      @notice = flash[:notice]
    end
  end
end
