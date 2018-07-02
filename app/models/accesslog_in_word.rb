class AccesslogInWord < ActiveRecord::Base
  belongs_to :accesslog
  belongs_to :word
end
