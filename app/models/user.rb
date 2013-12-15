class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :personal, dependent: :destroy
  belongs_to :role

  accepts_nested_attributes_for :personal

  # def send_confirmation_instructions(send=false)
  #   generate_confirmation_token! if self.confirmation_token.nil?
  #   ::Devise.mailer.confirmation_instructions(self).deliver if send
  # end
  def send_confirmation_instructions
    unless @raw_confirmation_token
      generate_confirmation_token!
    end
    opts = pending_reconfirmation? ? { :to => unconfirmed_email } : { }
    send_devise_notification(:confirmation_instructions, @raw_confirmation_token, opts)
  end
end
