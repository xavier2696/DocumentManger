class WelcomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
    	@documents = Document.all
    end
    
    
end
