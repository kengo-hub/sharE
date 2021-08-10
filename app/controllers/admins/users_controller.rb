class Admins::UsersController < ApplicationController
  before_action :if_not_admin

    def index
        @users = User.page(params[:page])
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if  @user.update(customer_params)
            redirect_to admin_customer_path(@user), notice: "会員情報を更新しました"
        else
            render "edit", notice: "会員情報を更新できませんでした"
        end
    end

    private
    def customer_params
    params.require(:user).permit(:nickname, :profile_image, :introduction, :age)
    end

    def if_not_admin
    redirect_to root_path unless admin_signed_in?
    end
end
