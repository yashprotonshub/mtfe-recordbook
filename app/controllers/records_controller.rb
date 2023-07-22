class RecordsController < ApplicationController
    def create
        debugger
        @account = Account.find(params[:account_id])
        if(params[:record]["current_value"].to_i>params[:record]["last_value"].to_i)
            @record= @account.records.new(current_value:params[:record]["current_value"], last_value:params[:record]["last_value"], diffrence:"Positive", added_commision: params[:record]["added_commision"], total_commision: params[:record]["total_commision"],)
        end
    end

    def new
        @account = Account.find(params[:account_id])
        @record= @account.records.new
    end

    def destroy
        @record=Account.find(params[:account_id]).records.find(params[:id])
        @record.destroy
        redirect_to account_path(params[:account_id])
    end
end
