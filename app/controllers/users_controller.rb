class UsersController < ApplicationController


#     Prefix Verb   URI Pattern               Controller#Action
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy

    before_action :find_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params_user)

        @user.save
        
        redirect_to users_path
    end

    def show
    end

    def edit
    end

    def update
        @user.update(params_user)
        redirect_to users_path
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def params_user
        params.require(:user).permit(:email,:password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
