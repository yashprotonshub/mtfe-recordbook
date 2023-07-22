class RecordsController < ApplicationController
    def create
        @account = Account.find(params[:account_id])
        if @account.records.exists?
            if params[:record][:current_value].to_f > @account.records.last.current_value
                @record = @account.records.new( current_value: params[:record][:current_value].to_f, last_value: @account.records.last.current_value, diffrence: "Positive", added_commision: params[:record][:added_commision].to_f, total_commision: @account.records.last.total_commision + params[:record][:added_commision].to_f, grand_total_without_commision: (params[:record][:current_value].to_f - @account.base_amount).round(2), grand_total: (params[:record][:current_value].to_f - @account.base_amount + @account.records.last.total_commision + params[:record][:added_commision].to_f).round(2) )
                @record.save
                redirect_to account_path(@account.id)
            else
                @record= @account.records.new( current_value: params[:record][:current_value].to_f, last_value: @account.records.last.current_value, diffrence: "Negative", added_commision: params[:record][:added_commision].to_f, total_commision: @account.records.last.total_commision + params[:record][:added_commision].to_f, grand_total_without_commision: (params[:record][:current_value].to_f - @account.base_amount).round(2), grand_total: (params[:record][:current_value].to_f - @account.base_amount + @account.records.last.total_commision + params[:record][:added_commision].to_f).round(2) )
                @record.save
                redirect_to account_path(@account.id)
            end

        else
            if params[:record][:current_value].to_f > @account.base_amount
                @record= @account.records.new(current_value: params[:record][:current_value], last_value: @account.base_amount, diffrence:"Positve", added_commision: params[:record][:added_commision], total_commision: params[:record][:added_commision], grand_total:params[:record][:current_value].to_f -  @account.base_amount +  params[:record][:added_commision].to_f, grand_total_without_commision: params[:record][:current_value].to_f - @account.base_amount.to_f)
                @record.save
                redirect_to account_path(@account.id)
            else
                @record= @account.records.new(current_value: params[:record][:current_value], last_value: @account.base_amount, diffrence:"Negative", added_commision: params[:record][:added_commision], total_commision: params[:record][:added_commision], grand_total:params[:record][:current_value].to_f -  @account.base_amount +  params[:record][:added_commision].to_f, grand_total_without_commision: params[:record][:current_value].to_f - @account.base_amount.to_f)
                @record.save
                redirect_to account_path(@account.id)
            end
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
