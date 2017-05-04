#This is the groups controller class
#This parse users requests and then calls the appropraite actions
#to the group database based on those requests
class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  #Returns the index of the items in the group table
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  #Shows the members that make up the group
  def show
    @members = Group.members(@group)
  end

  # GET /groups/new
  #Creates a new group
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  #Allows you to edit a group
  def edit
  end

  # Create a new group with the given information
  #
  # * Display that Groups were create
  # * Add the group table in the database
  # * Redirect user
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update the group with new information
  #
  # * Display that Groups were updated
  # * Update the group table in the database
  # * Redirect user
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # Remove the group
  #
  # * Display that Groups was destroyed
  # * Remove the group table in the database
  # * Redirect user
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :interest, :language_preference, :availability)
    end
end
