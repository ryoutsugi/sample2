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
    @entry = Entry.find(params[:id])
  end

  def update
    entry = params.require(:entry).permit(:name, :entrybody)
    entry = Entry.new(entry)
    if entry.save
       redirect_to entry
     else
       render :edit
     end
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy

    redirect_to root_path, notice: '削除されました'


  end

  def create
    entry = params.require(:entry).permit(:name, :entrybody, :category_id)
    entry = Entry.new(entry)
    if entry.save
      redirect_to entry
    else
      render :new
    end
  end
end
