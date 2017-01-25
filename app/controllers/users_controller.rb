class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end 

	def create
    @user = User.new(user_params)

    if @user.save
      session_login
      redirect_to users_path, :notice => "New User was saved"
    else 
      render "new"
    end 
	end

	def edit
    @user = User.find(params[:id])
  end 

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    	redirect_to user_path(@user.id), :notice => "User has been updated"
    else
      render "edit"
    end 
  end

  def destroy

    user = User.find(params[:id])
    Post.delete_all(user_id: user.id)
    user.destroy
    redirect_to root_path
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end