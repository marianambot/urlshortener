class ShorturlsController < ApplicationController
  before_action :set_shorturl, only: [:show, :edit, :update, :destroy]

  # GET /shorturls
  # GET /shorturls.json
  def index
    @shorturls = Shorturl.all
  end

  # GET /shorturls/1
  # GET /shorturls/1.json
  def show
  end

  # GET /shorturls/new
  def new
    @shorturl = Shorturl.new
  end

  # GET /shorturls/1/edit
  def edit
  end

  # POST /shorturls
  # POST /shorturls.json
  def create
    @shorturl = Shorturl.new(shorturl_params)

    respond_to do |format|
      if @shorturl.save
        format.html { redirect_to @shorturl, notice: 'Shorturl was successfully created.' }
        format.json { render :show, status: :created, location: @shorturl }
      else
        format.html { render :new }
        format.json { render json: @shorturl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorturls/1
  # PATCH/PUT /shorturls/1.json
  def update
    respond_to do |format|
      if @shorturl.update(shorturl_params)
        format.html { redirect_to @shorturl, notice: 'Shorturl was successfully updated.' }
        format.json { render :show, status: :ok, location: @shorturl }
      else
        format.html { render :edit }
        format.json { render json: @shorturl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorturls/1
  # DELETE /shorturls/1.json
  def destroy
    @shorturl.destroy
    respond_to do |format|
      format.html { redirect_to shorturls_url, notice: 'Shorturl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorturl
      @shorturl = Shorturl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorturl_params
      params.require(:shorturl).permit(:url_full_id, :url_string, :url_num_accesses, :url_ip_access)
    end
end
