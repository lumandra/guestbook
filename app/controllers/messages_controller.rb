class MessagesController < ApplicationController
  before_action :set_message, only: [:show]
  before_action :set_messages, only: [:index, :create]

  def index
  end

  def show
  end

  def create
    @message.assign_attributes(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :index }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def set_messages
      @messages = Message.accepted_messages
      @message = Message.new
    end

    def message_params
      params.require(:message).permit(:name, :email, :message, :state)
    end
end
