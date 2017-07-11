class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  has_many :lists
  has_many :deadlines, :through => :lists
  has_many :tasks, :through => :lists

  validates :phone_number, :uniqueness => true
  validate :phone_number_must_be_valid, unless: Proc.new { |a| a.phone_number.blank? }

  def phone_number_must_be_valid
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).lookups
    begin
      response = client.v1.phone_numbers(phone_number).fetch(type: 'carrier')
      if response.carrier['type'] != 'mobile'
        errors.add(:phone_number, "must be able to recieve text messages")
      end
    rescue => e
      if e.code == 20404
        errors.add(:phone_number, "must be valid")
      else
        raise e
      end
    end
  end

  def self.most_completed_tasks
    results = self.joins(:lists).where(lists: { status: "complete" }).limit(5).group("lists.user_id").count
    self.parse_results(results)
  end

  def self.parse_results(results_hash)
    results_hash.collect do |item|
      { :user => User.find(item[0]), :quantity => item[1] }
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
