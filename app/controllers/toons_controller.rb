class ToonsController < ApplicationController
  # GET /toons
  # GET /toons.xml
  def index
    @toons = Toon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @toons }
    end
  end

  # GET /toons/1
  # GET /toons/1.xml
  def show
    @toon = Toon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @toon }
    end
  end

  # GET /toons/new
  # GET /toons/new.xml
  def new
    @toon = Toon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @toon }
    end
  end

  # GET /toons/1/edit
  def edit
    @toon = Toon.find(params[:id])
  end

  # POST /toons
  # POST /toons.xml
  def create
    @toon = Toon.new(params[:toon])

    respond_to do |format|
      if @toon.save
        format.html { redirect_to(@toon, :notice => 'Toon was successfully created.') }
        format.xml  { render :xml => @toon, :status => :created, :location => @toon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @toon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /toons/1
  # PUT /toons/1.xml
  def update
    @toon = Toon.find(params[:id])

    respond_to do |format|
      if @toon.update_attributes(params[:toon])
        format.html { redirect_to(@toon, :notice => 'Toon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @toon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toons/1
  # DELETE /toons/1.xml
  def destroy
    @toon = Toon.find(params[:id])
    @toon.destroy

    respond_to do |format|
      format.html { redirect_to(toons_url) }
      format.xml  { head :ok }
    end
  end
end
