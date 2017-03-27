class WelcomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
    	@documents = Document.all
    	@documents = Document.order('created_at DESC')
        @conversationIdsListed = []
    end

    def getAmountSent
    	count = 0
    	@documents.each do |document|
    		if document.sender_id == current_user.id
    			count = count +1
    		end
    	end
    	return count
    end

    def getAmountRecieved
    	count = 0
    	@documents.each do |document|
    		if document.receiver_id == current_user.id
    			count = count +1
    		end
    	end
    	return count
    end

    helper_method :getAmountSent
    helper_method :getAmountRecieved
    
    
end
