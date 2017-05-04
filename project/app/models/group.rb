class Group < ActiveRecord::Base

	def self.members(group)
		@members = User.where(groupid: group.id)
		return @members
	end
end
