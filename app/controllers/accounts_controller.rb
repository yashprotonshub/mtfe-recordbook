class AccountsController < ApplicationController
    def new
    end

    def create
        @new_account=Account.new(account_params)
        if @new_account.save
            redirect_to root_path
        end
    end

    def edit
        @account= Account.find(params[:id])
    end

    def edit_account_name
        @account = Account.find(params[:id])
    end

    def updating_account_name
        @account= Account.find(params[:id])
        @account.update(name:params[:account][:name])
        redirect_to root_path
    end

    def update
        @account= Account.find(params[:id])
        @account.update(base_amount:params[:account][:base_amount].to_i)
        redirect_to root_path
    end

    def destroy
        @account= Account.find(params[:id]).destroy
        redirect_to root_path
    end

    private
        def account_params
            params.require(:account).permit(:name, :base_amount)
        end
end
