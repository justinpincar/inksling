class AuthorsController < ApplicationController
  def show
    load_author
  end

  def edit
    load_author
  end

  def update
    load_author

    if @author.update_attributes(params[:author])
      redirect_to(@author, :notice => 'Author was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def follow
    load_author

    @author.followers |= [current_author]
    @author.save

    redirect_to request.referer, :notice => "You are now following #{@author.alias}."
  end

  def unfollow
    load_author

    @author.followers.delete(current_author)
    @author.save

    redirect_to request.referer, :notice => "You are no longer following #{@author.alias}."
  end

  private

  def load_author
    @author = Author.find(params[:id])
  end
end
