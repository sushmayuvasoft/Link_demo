class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	  	flash[:success] = "The file was added!"
	    redirect_to user_path(@user)
	  else
	   redirect_to new_user_path
	  end
	end

	# def create
 #    @user = User.new(params[:user])
	#     respond_to do |format|
	#       if @user.save
	#         UserMailer.welcome_email(@user).deliver_now
	 
	#         format.html { redirect_to(@user, notice: 'User was successfully created.') }
	#         format.json { render json: @user, status: :created, location: @user }
	#       else
	#         format.html { render action: 'new' }
	#         format.json { render json: @user.errors, status: :unprocessable_entity }
	#       end
	#     end
 #  	end
	
	def show
   	@user = User.find(params[:id])
  end

	private
  def user_params
    params.require(:user).permit(:avatar, :name, :email)
  end
end
