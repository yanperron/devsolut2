class MessagesController < ApplicationController

    before_action :set_user, only: [:new, :create]





  def index
    @messages = Message.all
  end


   def new
    @message = Message.new
  end


  # POST /agencies
  def create
    @message = @user.messages.new(message_params)
    if @message.save!
      redirect_to @message.user, notice: 'Message was successfully recorded.'
    else
      render @message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
   def set_user
      @user = current_user
    end

  # GET /agencies

def message_params
  params.require(:message).permit(:content, :user_id)
end

end




