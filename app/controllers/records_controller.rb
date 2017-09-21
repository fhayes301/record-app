class RecordsController < ApplicationController

  def index
    @records = Record.all
    if params[:search]
      @records = Record.search(params[:search]).order("created_at DESC")
    else
      @records = Record.all.order('created_at DESC')
    end
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to records_path
    else
      render 'new'
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path
    else
      render :edit
    end

  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:user_id, :genre, :artist, :album, :year, :quantity)
  end

end
