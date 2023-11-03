class CommentsController < ApplicationController
  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comments = @gossip.comments
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new
    @comment.content= params[:content]
    @comment.gossip = Gossip.find(params[:gossip_id])
    @comment.user = User.find(11) 

    if @comment.save
      redirect_to gossip_path(params[:gossip_id]), notice: "Le commentaire a bien été enregistré !"
    else
      render :new
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
      redirect_to gossip_path(params[:gossip_id]), notice: "Le commentaire a bien été modifié !"
    else
      render :edit
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy!
      redirect_to gossip_path(params[:gossip_id]), notice: "Le commentaire a bien été supprimé !"
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
end
