class Message < ApplicationRecord
  belongs_to :group
  scope :created_between, lambda {|startDate, endDate| where("created_at >= ? AND created_at <= ?", startDate, endDate )}
end
