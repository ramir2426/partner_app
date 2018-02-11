ActiveAdmin.register TransactionLog do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :amount, :type, :status, :user_id
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	controller do
		def new 
			@transaction_log = TransactionLog.new(user_id: params[:user_id])
		end
	end

	form do |f|
		f.inputs "TransactionLog Details" do
			f.input :amount
      f.input :type
			f.input :status
		end
		f.actions
	end

end
