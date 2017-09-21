class SongsController < ApplicationController
  def index
    @record = Record.find(params[:record_id])
    @song = @record.songs
  end

  def show
  end

  def new
    @record = Record.find(params[:record_id])
    @song = Song.new
  end

  def create
    @record = Record.find(params[:record_id])
    @song = @record.songs.new(song_params)

    if @song.save
      redirect_to record_songs_path(@record)
    else
      render 'new'
    end
  end

  def edit
    @record = Record.find(params[:record_id])
    @song = Song.find(params[:id])
  end

  def update
    @record = Record.find(params[:record_id])
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to record_songs_path(@record)
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:record_id])
    @record.destroy
    redirect_to record_songs_path(@record)
  end

  private

  def song_params
    params.require(:song).permit(:title, :record_id)
  end

end
