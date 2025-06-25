class RoomsController < ApplicationController
   
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice] = "新規施設を登録しました"
      redirect_to root_path
    else
      flash[:notice] = "施設の登録に失敗しました"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit  
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "登録施設の情報を更新しました"
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] ="登録施設を削除しました"
    redirect_to rooms_path
  end

  private
    def room_params
      params.require(:room).permit(:user_id, :image, :name, :introduction, :rate, :located)
    end
end
