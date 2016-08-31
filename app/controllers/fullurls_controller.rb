class FullurlsController < ApplicationController
  before_action :set_fullurl, only: [:show, :edit, :update, :destroy]

  # GET /fullurls
  # GET /fullurls.json
  def index
    @fullurls = Fullurl.all
  end

  # GET /fullurls/1
  # GET /fullurls/1.json
  def show
  end

  # GET /fullurls/new
  def new
    @fullurl = Fullurl.new
  end

  # GET /fullurls/1/edit
  def edit
  end

  # POST /fullurls
  # POST /fullurls.json
  def create
    @fullurl = Fullurl.new(fullurl_params)

    respond_to do |format|
      if @fullurl.save
        format.html { redirect_to @fullurl, notice: 'Fullurl was successfully created.' }
        format.json { render :show, status: :created, location: @fullurl }
      else
        format.html { render :new }
        format.json { render json: @fullurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fullurls/1
  # PATCH/PUT /fullurls/1.json
  def update
    respond_to do |format|
      if @fullurl.update(fullurl_params)
        format.html { redirect_to @fullurl, notice: 'Fullurl was successfully updated.' }
        format.json { render :show, status: :ok, location: @fullurl }
      else
        format.html { render :edit }
        format.json { render json: @fullurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fullurls/1
  # DELETE /fullurls/1.json
  def destroy
    @fullurl.destroy
    respond_to do |format|
      format.html { redirect_to fullurls_url, notice: 'Fullurl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fullurl
      @fullurl = Fullurl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fullurl_params
      params.require(:fullurl).permit(:url_string)
    end
end
