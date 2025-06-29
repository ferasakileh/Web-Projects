class UsersController < ApplicationController
  #include SessionsHelper
  before_action  :require_login, only: [:show, :edit, :update]

  def new
    @user=User.new
  end

  def index
    @user= User.all
  end
  
  def show
    @user=User.find_by_id(params['id'])

    #debugger
    if @user.nil?
      #flash[:alert] = 'User not found.'
      redirect_to users_path
    end
  end

  def create
    #User.create(name:'Test',email:'test.2@osu.edu', password:'123456')
    @user=User.new(user_params)

    if @user.save
      #session[:user_id] = @user.id # automatically log in user
      log_in @user
      flash[:success]= 'Hello and Welcome!'
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
        render 'new', status: :unprocessable_entity
    end
  end
  
  def edit
    @user= User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated'
    else
      render 'edit', status: :unprocessable_entity
    end

  end

  def destroy
    @user= User.find(params[:id])   #find user by ID
    @user.destroy     #delete user
    #redirect to users lsit with a success message
    redirect_to users_path, notice: 'User was successfully deleted'
  end

    private 
     #strong parameters in the control layer
     #securiry practice known as strong parameters
     #this allows us to specify whihc parameters are required and whihc are permitted
      def user_params
        params.require(:user).permit(:name,:email,:role,:password,:password_confirmation)
      end
    
  
end
