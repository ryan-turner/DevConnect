# Group model - very skinny class.
class Group < ActiveRecord::Base
	# Defines members by viewing a group ID for a user, and returning the members of that group ID.
	def self.members(group)
		@members = User.where(groupid: group.id)
		return @members
	end
end
