class AdminController < ApplicationController
    def index
        @all_accounts= Account.all 
    end

    def show
        @account= Account.find(params[:id])
    end

end
