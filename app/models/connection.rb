class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :support_group
end
