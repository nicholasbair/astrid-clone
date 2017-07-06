class Task < ActiveRecord::Base
  belongs_to :list
  has_one :user, :through => :list

  enum status: [:incomplete, :complete]

  validates :content, :presence => true
  validates :content, :uniqueness => { :scope => :list }

  after_save :call_list_status

  private

    def call_list_status
      # list_id is not set on first save
      self&.list&.check_status
    end

end
