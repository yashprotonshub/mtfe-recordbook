class AdminController < ApplicationController
    def index
        @all_accounts= Account.all 
    end

    

end
