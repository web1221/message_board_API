class GroupsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  def index
    name = params[:name]
    @groups = Group.search(name)
    json_response(@groups)
  end

  def show
    @group = Group.find(params[:id])
    json_response(@group)
  end

  def create
    @group = Group.create!(group_params)
    json_response(@group, 201)
  end

  def update
    @group = Group.find(params[:id])
    if @group.update!(group_params)
      render status: 200, json: {
        message: "This group has been updated successfully."
      }
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      render status: 200, json: {
        message: "This group has been deleted successfully."
      }
    end
  end

  private

  def group_params
    params.permit(:name)
  end
end
