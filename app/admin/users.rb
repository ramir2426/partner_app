ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :email, :password, :password_confirmation, :partner_percentage, :is_admin, :reff_code
#
# or
#
controller do
  # This code is evaluated within the controller class
  before_action :find_user_by_referral, only: [:create]
	def create
    if @referral_user.nil?
      @user_registration = User.new(permitted_params[:user])
      if @user_registration.save
      	redirect_to admin_users_path, :notice => "User Created successfully."
      else
      	redirect_to new_admin_user_path, notice: @user_registration.errors.full_messages
      end

    else
     	@user_registration = @referral_user.children.new(permitted_params[:user]) 
      if @user_registration.save
      	redirect_to admin_users_path, :notice => "User Created successfully."
      else
      	redirect_to new_admin_user_path, notice: @user_registration.errors.full_messages
      end 
    end
	end

	def update
      @user = User.unscoped.find(params[:id])
      if params[:user][:password].blank?
        @user.update_without_password(permitted_params[:user])
      else
        @user.update_attributes(permitted_params[:user])
      end
      if @user.errors.blank?
        redirect_to admin_users_path, :notice => "User updated successfully."
      else
        render :edit
      end
    end


	private
    def find_user_by_referral
      if params[:user][:referral_code].present?
        @referral_user = User.find_by_reff_code(params[:user][:referral_code])

      end
      @referral_user 
    end
end
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
		f.inputs "Admin Details" do
			f.input :first_name
      f.input :last_name
			f.input :email
			f.input :password
			f.input :password_confirmation
			f.input :partner_percentage
			f.input :is_admin, label: 'Company Admin'
			f.input :referral_code, label: 'Refferal of'
		end
		f.actions
	end

end
