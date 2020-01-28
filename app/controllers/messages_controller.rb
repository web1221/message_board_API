class MessagesController < ApplicationController

  def index
    if (params[:startDate] && params[:endDate])
      @messages = Message.created_between(params[:startDate], params[:endDate])
    else
      @messages = Message.all
    end
    json_response(@messages)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.create(message_params)
    json_response(@message, 201)
  end

  def update
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    if @message.update(message_params)
      json_response(@message)
    else
      json_response(@message, 400)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.permit(:body)
  end
end
