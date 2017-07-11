class Task < ActiveRecord::Base
  belongs_to :list
  has_one :user, :through => :list

  enum status: [:incomplete, :in_progress, :complete]

  validates :content, :presence => true

  after_save :call_list_status

  private

    def call_list_status
      # list_id is not set on first save
      self&.list&.check_status
    end

end
