class User < ActiveRecord::Base
  validates :first_name, :last_name, :user_name, :ref_id, :email, presence: true

end
