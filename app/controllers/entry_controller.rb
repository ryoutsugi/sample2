class EntryController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def edit
    @entry =  Entry.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def create
    entry = params.require(:entry).permit(:name, :entrybody)
    entry = Entry.new(entry)
    if entry.save
      redirect_to entry
    else
      render :new
    end
  end
end
