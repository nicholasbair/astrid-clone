class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :omniauthable, :omniauth_providers => [:github]
  devise :database_authenticatable, :registerable, #:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :tasks, :through => :lists

  validates :username, :presence => true

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
      user.username = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
