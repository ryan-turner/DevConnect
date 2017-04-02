class User < ActiveRecord::Base

	def self.matches
		@matches = Group.all
		@matches = @matches.to_json
	end

end
