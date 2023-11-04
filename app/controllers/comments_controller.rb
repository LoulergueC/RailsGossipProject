class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comments = @gossip.comments
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new
    @comment.content= params[:content]
    @comment.gossip = Gossip.find(params[:gossip_id])
    @comment.user = User.find(session[:user_id]) 

    if @comment.save
      flash_message :success, "Le commentaire a bien été enregistré !"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash_errors(@comment)
      @gossip = Gossip.find(params[:gossip_id])
      @comments = @gossip.comments
      render :new, locals: { gossip: @gossip, comment: @comment, comments: @comments }
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment_to_edit = @gossip.comments.find(params[:id])
    @comments = @gossip.comments.where.not(id: params[:id])
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:comment][:content]
    if @comment.save
      flash_message :success, "Le commentaire a bien été modifié !"
      redirect_to gossip_path(params[:gossip_id])
    else
      flash_errors(@comment)
      @gossip = Gossip.find(params[:gossip_id])
      @comments = @gossip.comments
      render :edit, locals: { gossip: @gossip, comment: @comment, comments: @comments }
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy!
      flash_message :success, "Le commentaire a bien été supprimé !"
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :content)
    end

  def authenticate_user
    unless current_user
      flash_message :warning, "Veuillez vous connecter !"
      redirect_to new_session_path
    end
  end
end
