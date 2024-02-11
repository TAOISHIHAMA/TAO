class UsersController < ApplicationController
 
        def show
          @user = User.find(params[:id]) 
        end

        def create
          @tao = Tao.find(params[:tao_id])
      end

        def edit
          @tao = Tao.find(params[:id])
        end

        def destroy
          tao = Tao.find(params[:id])
          tao.destroy
          redirect_to action: :index
        end
      end