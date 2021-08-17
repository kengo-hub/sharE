class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if  @user.update(user_params)
        redirect_to user_path, notice: "会員情報を更新しました"
    else
      render "edit", notice: "会員情報を更新できませんでした"
    end
  end

  def confirm
    
  end

  def hide
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction, :age)
  end
end

