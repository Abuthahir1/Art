class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  
    layout 'application', :except => [:index]
  # GET /arts
  # GET /arts.json
  def index
      @arts = Art.order('created_at DESC')
  end


  # GET /arts/1
  # GET /arts/1.json
  def show
    @reviews = Review.where(art_id: @art.id).order("created_at DESC")
    
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end

    respond_to do |format|
      format.html 
       format.pdf do
       Thread.new do
        html = render_to_string template: "arts/show.pdf"
        folder = "Arts"
        file_name = "art"
        art = @art
        file_name = "#{file_name}"
        PdfsGenerateJob.perform_later(html, folder, file_name, art)
      end
          redirect_back fallback_location: art_path, notice:"A pdf url is #{url_for(@art.pdf)}"
        end
    end
  end

  # GET /arts/new
  def new
    @art = current_user.arts.build
  end

  # GET /arts/1/edit
  def edit
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = current_user.arts.build(art_params)
    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, notice: 'Art was successfully created.' }
        format.json { render :show, status: :created, location: @art }
      else
        format.html { render :new }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to @art, notice: 'Art was successfully updated.' }
        format.json { render :show, status: :ok, location: @art }
      else
        format.html { render :edit }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, notice: 'Art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def art_params
      params.require(:art).permit(:title, :description, :price, :rating, :owner_by, :image, :pdf)
    end
end
