class MessagesController < ApplicationController
  def create
    @support_group = SupportGroup.find(params[:support_group_id])
    @message = @support_group.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to user_path(current_user), notice: 'Message sent successfully.'
    else
      redirect_to user_path(current_user), alert: 'Failed to send the message.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
