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
                @record= @account.records.new(current_value: params[:record][:current_value], last_value: @account.base_amount, diffrence:"Positve", added_commision: params[:record][:added_commision], total_commision: params[:record][:added_commision], grand_total:(params[:record][:current_value].to_f -  @account.base_amount +  params[:record][:added_commision].to_f).round(2), grand_total_without_commision: (params[:record][:current_value].to_f - @account.base_amount.to_f).round(2))
                @record.save
                redirect_to account_path(@account.id)
            else
                @record= @account.records.new(current_value: params[:record][:current_value], last_value: @account.base_amount, diffrence:"Negative", added_commision: params[:record][:added_commision], total_commision: params[:record][:added_commision], grand_total:(params[:record][:current_value].to_f -  @account.base_amount +  params[:record][:added_commision].to_f).round(2), grand_total_without_commision: (params[:record][:current_value].to_f - @account.base_amount.to_f).round(2))
                @record.save
                redirect_to account_path(@account.id)
            end
        end
    end

    def new
        @account = Account.find(params[:account_id])
        if @account.records.exists?
            @last_current_value = @account.records.last.current_value.to_s + " is your last value"
            @record= @account.records.new
        else
            @record= @account.records.new
        end
    end

    def destroy
        @record=Account.find(params[:account_id]).records.find(params[:id])
        @record.destroy
        redirect_to account_path(params[:account_id])
    end

    def generate_pdf
        @account = Account.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            render pdf: "table_pdf",  # This will be the name of the PDF file
                   template: 'records/table_pdf.html.erb',  # The path to your view template
                   layout: 'pdf.html.erb'  # Optional - you can create a separate layout for the PDF if needed
          end
        end
    end
end
