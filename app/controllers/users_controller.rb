class UsersController < ApplicationController
  def index
	@q = User.search(params[:q])
	@users = @q.result(:distinct => true).order(:name).page params[:page]
  end

  def show
	@user = User.find(params[:id])
  end

  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
		redirect_to user_path(@user)
	else
		render :action => "new"
	end
  end
  

end
