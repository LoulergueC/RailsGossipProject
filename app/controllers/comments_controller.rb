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
      redirect_to gossip_path(params[:gossip_id]), notice: "Comment was successfully created."
    else
      render :new
    end
  end

  def edit

  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy!
      redirect_to gossip_path(params[:gossip_id]), notice: "Comment was successfully destroyed."
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
