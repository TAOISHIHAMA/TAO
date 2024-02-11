class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      tao = Tao.find(params[:tao_id])
      comment = tao.comments.build(comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "送信しました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "送信に失敗しました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end
  
    private
  
      def comment_params
        params.require(:comment).permit(:content)
      end 
end
