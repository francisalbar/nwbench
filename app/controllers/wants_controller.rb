class WantsController < ApplicationController



  # GET /wants
  # GET /wants.xml
  def index
    if params[:itemsPerPage] then session[:itemsPerPage] = params[:itemsPerPage] end
    if params[:page] then @page = params[:page].to_i else @page = 1 end
    if session[:itemsPerPage] then @per = session[:itemsPerPage].to_i else @per = 15 end

    @wants = Want.find(:all, :order => 'boss_id')
    @lastpage = @wants.length/(@per) + 1

    if @wants.length%(@per) == 0
      @lastpage = @lastpage - 1
    end

    @wants = @wants[((@page-1)*@per),@per]
    #@wants = Want.all
    #@wants = paginate(:wants, :order => 'boss_id ASC', :per_page => 2)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wants }
    end
  end

  # GET /wants/1
  # GET /wants/1.xml
  def show
    @want = Want.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @want }
    end
  end

  # GET /wants/new
  # GET /wants/new.xml
  def new
    @want = Want.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @want }
    end
  end

  # GET /wants/1/edit
  def edit
    @want = Want.find(params[:id])
  end

  # POST /wants
  # POST /wants.xml
  def create
    @want = Want.new(params[:want])

    respond_to do |format|
      if @want.save
        format.html { redirect_to(@want, :notice => 'Want was successfully created.') }
        format.xml  { render :xml => @want, :status => :created, :location => @want }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @want.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wants/1
  # PUT /wants/1.xml
  def update
    @want = Want.find(params[:id])

    respond_to do |format|
      if @want.update_attributes(params[:want])
        format.html { redirect_to(@want, :notice => 'Want was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @want.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wants/1
  # DELETE /wants/1.xml
  def destroy
    @want = Want.find(params[:id])
    @want.destroy

    respond_to do |format|
      format.html { redirect_to(wants_url) }
      format.xml  { head :ok }
    end
  end

  def wowhead
    require 'net/http'

    proxy_addr = 'www-west.sony.com'
    proxy_port = 80

    url = URI.parse('http://www.wowhead.com/item=' + params[:item_id] + '&xml')
    # req = Net::HTTP::Get.new(url.path)

    res = Net::HTTP.start(url.host, url.port) {|http|
    # res = Net::HTTP::Proxy(proxy_addr, proxy_port).start(url.host, url.port) {|http|
      http.get(url.path)

      #http.request(req)
    }
    # res.body

    send_data res.body, :type => 'text/xml', :disposition => 'inline'

    #respond_to do |format|
    #  format.xml  { render res.body }
    #end
  end
end
