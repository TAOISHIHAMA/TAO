class TaosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @taos = Tao.all
        if params[:search] == nil
          @taos= Tao.all
        elsif params[:search] == ''
          @taos= Tao.all
        else
          #部分検索
          @taos = Tao.where("goods LIKE ? ",'%' + params[:search] + '%')
        end
    end
    def show
        @tao = Tao.find(params[:id])
        @comments = @tao.comments
        @comment = Comment.new
    end

    def new
        @tao = Tao.new
      end
    
      def create
        tao = Tao.new(tao_params)
        tao.user_id = current_user.id
        if tao.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def edit
        @tao = Tao.find(params[:id])
      end
      def update
        tao = Tao.find(params[:id])
        if tao.update(tao_params)
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
        def destroy
            tao = Tao.find(params[:id])
            tao.destroy
            redirect_to action: :index
      end
    
      private
      def tao_params
        params.require(:tao).permit(:goods, :goodscoment, :image)
      end
end
