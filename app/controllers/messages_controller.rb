class MessagesController < ApplicationController
  def index
    @message = Message.all

    #Retrives all messages and divides into two groups todays messages and other messages
    @grouped_messages = @message.group_by{ |t| t.created_at.to_date == DateTime.now.to_date }

    if @grouped_messages[false].present?
      #Create month wise groups of messages      
      @month_wise_sorted_alerts  = @grouped_messages[false].group_by{ |t| t.created_at.month}
    end    
  end
end
