class Profile < ActiveRecord::Base
   validates_presence_of :name
   validates_presence_of :base_url
   validates_presence_of :auth_type
   validates_presence_of :default_user_name
   validates_presence_of :default_password
end

