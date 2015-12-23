class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    if @track.save
        flash[:success] = 'Track was successfully created.'
        redirect_to admin_tracks_path(@track.music_id)
    else
        flash[:error] = @track.errors
        render :new
    end
  end

  def update
    if @track.update(track_params)
        flash[:success] = "Track updated"
        redirect_to admin_tracks_path(@track.music.id), notice: 'Track was successfully updated.'
	else
	    flash[:error] = @track.errors
		render :edit
	end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
        params.require(:track).permit(:title, :length, :artist, :number, :isrc, :music_id, :ccli, :authors, :price)
    end
end
