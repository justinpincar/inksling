class InksController < ApplicationController
  before_filter :authenticate_author!, :only => [:create, :edit, :update, :destroy]

  def index
    @inks = Ink.all
  end

  def show
    @ink = Ink.find(params[:id])
  end

  def edit
    @ink = Ink.find(params[:id])
  end

  def create
    @ink = current_author.inks.build
    @ink.save!

    redirect_to(@ink, :notice => 'Ink was successfully created.')
  end

  def update
    @ink = Ink.find(params[:id])

    if @ink.update_attributes(params[:ink])
      redirect_to(@ink, :notice => 'Ink was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @ink = Ink.find(params[:id])
    @ink.destroy

    redirect_to(dashboard_index_path, :notice => 'Ink was successfully erased.')
  end
end
