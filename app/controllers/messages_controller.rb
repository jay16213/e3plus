class MessagesController < ApplicationController
    #find the message
    before_action :set_message, only: [ :update, :destroy ]

    def create
        @message = Message.new(message_params)

        if @message.save
            redirect_to(:back)#redirect to current page
        else
            flash[:notice] = "系統錯誤，請稍後再試！"
        end
    end

    def update
        if @message.update(message_params)
            redirect_to(:back)
        else
            flash[:notice] = "系統錯誤，請稍後再試！"
        end
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to(:back)
    end

    private

    def set_message
        @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:user_id, :announce_id, :content, :message_id)
    end
end
