class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def author
    @user = User.find(params[:id])
  end

  def city
    @city = City.find(params[:id])
    @gossips = City.find(params[:id]).gossips
  end
end
