class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.all.paginate(page: params[:page], per_page: 5).order(id: :desc)
  end
  def show
    @comment = Comment.find(params[:id])
    @comment.notifications.update(status: true)
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comment_path
  end
  def publish
    @comments = Comment.where(status:true).order(id: :desc)
  end
  def pending
    @comments = Comment.where(status:false).order(id: :desc)
  end

  def approve
		@approve=Comment.find(params[:id])
    @approve.update(status: true)
    redirect_to admin_comments_path
	end
	def disapprove
		@disapprove=Comment.find(params[:id])
    @disapprove.update(status:false)
    redirect_to admin_comments_path
	end
end
