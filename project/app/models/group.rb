class Group < ActiveRecord::Base

	def self.members(group)
		@members = User.where(groupid: group.id)
		puts @members
		return @members
	end
end
