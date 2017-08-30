class UserAdminController < ApplicationController

  def index
      @users = User.all
  end

  def edit
      @user = User.find(params[:id])
      @confirmed = @user.confirmed?
  end

  def update
    @user = User.find(params[:id])
    @user.fullname = params[:user][:fullname]
    @user.email = params[:user][:email]
    @user_state = params[:user][:confirmed]
    @user.role = params[:user][:role]

    puts "already confirmed" if @user.confirmed?
    puts "user state #{@user_state} #{@user.confirmed_at}"

    if @user_state === "1"
      @user.confirmed_at = Date.new
      @user.updated_at = Date.new
    end

    if @user.save
      flash[:notice] = "User #{@user.fullname} was updated."
      redirect_to action: "index"
    else
      flash[:alert] = "Error saving User. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.email === current_user.email
      flash[:alert] = "You can't delete yourself!!"
      redirect_to action: "index"
    elsif @user.destroy
         flash[:notice] = "\"#{@user.fullname}\" was deleted successfully."
         redirect_to action: "index"
    else
         flash[:alert] = "There was an error deleting the user."
         redirect_to action: "index"
    end
  end
end
