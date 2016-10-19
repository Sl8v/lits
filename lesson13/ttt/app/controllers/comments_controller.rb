class CommentsController < ApplicationController

def create
      @twit = Twit.find(params[:twit_id])
      #binding.pry
      # user_id = User.find_by(nickname: comment_params[:user_id]).id
      # comment_params["user_id"] = user_id
      @comment = @twit.comments.create(comment_params)

      redirect_to twit_path(@twit)
end


private

def comment_params
  params.require(:comment).permit(:user_id, :body, :user_name)
end

end
