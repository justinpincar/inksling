class InksController < ApplicationController
  before_filter :authenticate_author!, :only => [:create, :edit, :update, :destroy]

  def index
    @inks = Ink.where("text IS NOT NULL").all
    @authors = Author.all

    ink_tags = InkTag.select("count(*) as occurences, tag_id").group("tag_id").having("count(*) > 0")
    @tags = Tag.where(:id => ink_tags.collect(&:tag_id))
  end

  def random
    offset = rand(Ink.where("text IS NOT NULL").count)
    @ink = Ink.where("text IS NOT NULL").first(:offset => offset)

    redirect_to @ink
  end

  def show
    load_ink
  end

  def edit
    load_ink
  end

  def create
    @ink = current_author.inks.build
    @ink.save!

    redirect_to(@ink, :notice => 'Ink was successfully created.')
  end

  def update
    load_ink

    respond_to do |format|
      if @ink.update_attributes(params[:ink])
        format.html { redirect_to(@ink, :notice => 'Ink was successfully updated.') }
        format.json { render :json => @ink }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ink.errors, :status => :unprocessable_entity }
      end
    end
  end

  def tagged
    @authors = Author.all

    ink_tags = InkTag.select("count(*) as occurences, tag_id").group("tag_id").having("count(*) > 0")
    @tags = Tag.where(:id => ink_tags.collect(&:tag_id))

    text = params[:text].try(:strip)
    if text.nil? or text.empty?
      redirect_to index
      return
    end

    @tag = Tag.find_by_text(text)

    @inks = []
    if @tag.present?
      @inks |= @tag.inks
    end
  end

  def tag
    load_ink

    text = params[:text].try(:strip)
    tag = Tag.find_by_text(text) || Tag.create(:text => text)

    @ink.tags |= [tag]

    if @ink.save
      render :json => tag
    else
      render :json => tag.errors
    end
  end

  def untag
    load_ink

    text = params[:text].try(:strip)
    tag = Tag.find_by_text(text)

    @ink.tags.delete(tag)

    if @ink.save
      render :json => tag
    else
      render :json => tag.errors
    end
  end

  def destroy
    @ink = Ink.find(params[:id])
    @ink.destroy

    redirect_to(dashboard_index_path, :notice => 'Ink was successfully erased.')
  end

  private

  def load_ink
    @ink = Ink.find(params[:id])
  end
end
