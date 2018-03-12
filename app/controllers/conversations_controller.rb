class ConversationsController < ApplicationController
  def index
  	@conversations = current_user.mailbox.conversations
  end

  def show
  	@conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
  	@recepients = User.all - [current_user]
  end

  def create
  	recepient = User.find(params[:user_id])
  	receipt = current_user.send_message(recepient,params[:body],params[:subject])
  	redirect_to conversation_path(receipt.conversation)
  end
end
