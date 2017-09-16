class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to @record
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
    #for when we add user auth
    # @user = @record.user_id

    if @record.update(record_params)
      # redirect_to controller: :users
    else
      render :edit
    end
  end

  private

  def record_params
    params.require(:record).permit(:genre, :artist, )
  end
end
