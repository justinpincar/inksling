class CommentsController < ApplicationController
  before_filter :authenticate_author!

  def create
    ink = Ink.find(params[:ink_id])

    @comment = Comment.new(params[:comment])
    @comment.author = current_author
    @comment.ink = ink
    @comment.save!

    redirect_to(ink, :notice => 'Comment added.')
  end

  def destroy
    comment = Comment.find(params[:id])

    ink = comment.ink

    comment.destroy

    redirect_to(ink, :notice => 'Comment removed.')
  end
end
