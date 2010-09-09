class WingsController < ApplicationController
  # GET /wings
  # GET /wings.xml
  def index
    @wings = Wing.find(:all, :order => 'wing_id')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wings }
    end
  end

  # GET /wings/1
  # GET /wings/1.xml
  def show
    @wing = Wing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wing }
    end
  end

  # GET /wings/new
  # GET /wings/new.xml
  def new
    @wing = Wing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wing }
    end
  end

  # GET /wings/1/edit
  def edit
    @wing = Wing.find(params[:id])
  end

  # POST /wings
  # POST /wings.xml
  def create
    @wing = Wing.new(params[:wing])

    respond_to do |format|
      if @wing.save
        format.html { redirect_to(@wing, :notice => 'Wing was successfully created.') }
        format.xml  { render :xml => @wing, :status => :created, :location => @wing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wings/1
  # PUT /wings/1.xml
  def update
    @wing = Wing.find(params[:id])

    respond_to do |format|
      if @wing.update_attributes(params[:wing])
        format.html { redirect_to(@wing, :notice => 'Wing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wings/1
  # DELETE /wings/1.xml
  def destroy
    @wing = Wing.find(params[:id])
    @wing.destroy

    respond_to do |format|
      format.html { redirect_to(wings_url) }
      format.xml  { head :ok }
    end
  end
end
