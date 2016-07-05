class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:id])
    @comments = @issue.comments
  end
  def destroy
    issue = Issue.find(params[:id])
    issue.delete
    redirect_to :root
  end
  def new
    if not current_user
      flash[:notice] = "没有执行权限,请先登陆"
      redirect_to :root
      return
    else
      @issue = Issue.new
    end
  end
  def create
    # 调试语句
    # render plain: params[:issue].inspect
    Issue.create(issue_params)
    redirect_to :root
  end
  def edit
    @issue = Issue.find(params[:id])
  end
  def update
    i = Issue.find(params[:id])
    i.update_attributes(issue_params)
    redirect_to :root
  end
  private
    def issue_params
      params.require(:issue).permit(:title,:content,:user_id)
    end
end
