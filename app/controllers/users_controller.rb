class Userscontroller < ApplicationController
    before_action :require_logged_in, only: [:index, :show]
    

    def index
        @users = User.all 
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messeges, status: 422
            redirect_to users_url
        end
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def updated
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messeges, status: 422
            render :edit
        end

    end
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end