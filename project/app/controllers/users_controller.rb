class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # Method will show the currently viewing user's matches and groups.
  def show
    @matches = User.matches(@user)
    @members = User.group_members(@user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # We create a new user with this method, utilizing user_params to control the attributes of every user.
  # This is also where a user receives their Session ID if they're successfully able to sign up. This only happens if the DB saves the data.
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/users/new'
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  # Mehtod for updating information about a user.
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # Method for removing users from DB.
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Adds user to a group by adding the group id to the user's groupid field
  def add_group
    User.add_to_group(params[:id], params[:group_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # These are our parameters for a user:
    # First name, last name, email, coding interest, proficient languages (2),
    # available meeting times (2), personal skills, password hash, and the group they belong to.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :interest, :language1, :language2, :time1, :time2, :skill, :password, :groupid)
    end
end