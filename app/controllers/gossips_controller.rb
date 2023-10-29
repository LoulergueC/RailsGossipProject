class GossipsController < ApplicationController
  def index
    redirect_to "/"
  end
  
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @tags = Tag.all
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 11)
    
    if @gossip.save
      params[:tags].each do |tag|
        @gossip.tags << Tag.find(tag)
      end
      redirect_to root_path, notice: "Le potin a été enregistré !"  
    else
      render :new
    end
  end
end
