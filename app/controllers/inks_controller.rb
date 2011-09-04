class InksController < ApplicationController
  # GET /inks
  # GET /inks.xml
  def index
    @inks = Ink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inks }
    end
  end

  # GET /inks/1
  # GET /inks/1.xml
  def show
    @ink = Ink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ink }
    end
  end

  # GET /inks/new
  # GET /inks/new.xml
  def new
    @ink = Ink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ink }
    end
  end

  # GET /inks/1/edit
  def edit
    @ink = Ink.find(params[:id])
  end

  # POST /inks
  # POST /inks.xml
  def create
    @ink = Ink.new(params[:ink])

    respond_to do |format|
      if @ink.save
        format.html { redirect_to(@ink, :notice => 'Ink was successfully created.') }
        format.xml  { render :xml => @ink, :status => :created, :location => @ink }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inks/1
  # PUT /inks/1.xml
  def update
    @ink = Ink.find(params[:id])

    respond_to do |format|
      if @ink.update_attributes(params[:ink])
        format.html { redirect_to(@ink, :notice => 'Ink was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inks/1
  # DELETE /inks/1.xml
  def destroy
    @ink = Ink.find(params[:id])
    @ink.destroy

    respond_to do |format|
      format.html { redirect_to(inks_url) }
      format.xml  { head :ok }
    end
  end
end
