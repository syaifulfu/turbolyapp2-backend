class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    user = User.new(user_params)
        
    user.email.downcase!
    
    if user.save
        render json: {
          success: true,
          message: 'Successfuly register',
          data: user
        }
    else
      if user.errors
        errors = '';
        if user.errors.full_messages_for(:name).length != 0
          errors += "#{user.errors.full_messages_for(:name)[0]}, "
        end
        if user.errors.full_messages_for(:email).length != 0
          errors += "#{user.errors.full_messages_for(:email)[0]}, "
        end
        if user.errors.full_messages_for(:password).length != 0
          errors += "#{user.errors.full_messages_for(:password)[0]}, "
        end

        render json: {
          success: false,
          message: errors
        }
      else
        render json: {
          success: false,
          message: 'Failed register'
        }
      end
    end

    # @user = User.new(user_params)

    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
  end

  def login
    user = User.find_by(email: params[:email].downcase)
        
    if user && user.authenticate(params[:password]) 
        render json: {
          success: true,
          message: 'Successfuly login',
          data: user
        }
    else
        render json: {
          success: false,
          message: 'Failed login'
        }
    end
  end
  

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      user = params.fetch(:user, {})

      user_params = {
        'name': params[:name],
        'email': params[:email],
        'password': params[:password],
      }
    end
end
