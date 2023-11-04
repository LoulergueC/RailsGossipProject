class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  def index
    redirect_to "/"
  end
  
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip_id: params[:id])

    if flash[:notice]
      @notice = flash[:notice]
    end
  end

  def new
    @tags = Tag.all
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)
    
    if @gossip.save
      params[:tags].each do |tag|
        @gossip.tags << Tag.find(tag)
      end
      redirect_to root_path, notice: "Le potin a été enregistré !"  
    else
      flash_errors(@gossip)
      @tags = Tag.all
      render :new, locals: { gossip: @gossip, tags: @tags }
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

      flash_message :success, "Le potin a bien été modifié !"
      redirect_to gossip_path(@gossip)
    else
      flash_errors(@gossip)
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      redirect_to '/'
    end
  end

  def authenticate_user
    unless current_user
      flash_message :warning, "Veuillez vous connecter !"
      redirect_to new_session_path
    end
  end
end
