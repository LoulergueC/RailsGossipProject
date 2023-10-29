class GossipsController < ApplicationController
  def index
    redirect_to "/"
  end
  
  def show
    @gossip = Gossip.find(params[:id])

    if flash[:notice]
      @notice = flash[:notice]
    end
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

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.title = params[:gossip][:title]
    @gossip.content = params[:gossip][:content]
    
    if @gossip.save
      @gossip.tags = []
      params[:tags].each do |tag|
        @gossip.tags << Tag.find(tag)
      end

      redirect_to gossip_path(@gossip), notice: "Le potin a bien été modifié !"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      redirect_to '/'
    end
  end
end
