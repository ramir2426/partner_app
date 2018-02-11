class User < ApplicationRecord
	attr_accessor :referral_code
  has_ancestry
	before_create :ensure_referral_code
	
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable

	def generate_referral_code!
    loop do
      reff_code = Devise.friendly_token
      break reff_code unless User.where(reff_code: reff_code).first
    end
  end

  def ensure_referral_code
    if reff_code.blank?
      self.reff_code = generate_referral_code!
    end
  end
end
