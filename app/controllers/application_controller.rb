class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def getNextConvID
    @documents = Document.all
    nextConvID = 0
    if @documents.count
      @documents.each do |document|
        if document.conversationId > nextConvID
          nextConvID = document.conversationId
        end
      end
      nextConvID = nextConvID + 1
      return nextConvID
    else
      return 1
    end
  end

  helper_method :getNextConvID
end
