class User < ActiveRecord::Base

	def self.matches(user)
		@groups= Group.all
		@users = User.all
		@matches = []
		@groups.each do |g|
			@match_score = 0
			if g.language_preference.strip == user.language1.strip
				@match_score += 20
			elsif g.language_preference.strip == user.language2.strip
				@match_score += 20
			end
			if g.interest.strip == user.interest.strip
				@match_score += 30
			end
			if g.availability.strip == user.time1.strip
				@match_score += 10
			elsif g.availability.strip == user.time2.strip
				@match_score += 10
			end
			
			@uniqueSkill = true
			@users.each do |u|
				if u.groupid == g.id and u.id != user.id
					if u.skill == user.skill
						@uniqueSkill = false
						break
					end
				end
			end
			
			m = OpenStruct.new
			if @uniqueSkill == true
				@match_score += 10
				m.unique_skill_bonus = true
			else
				m.unique_skill_bonus = false
			end

			m.name = g.name
			m.score = @match_score
			m.language = g.language_preference.strip
			m.interest = g.interest.strip
			m.availability = g.availability.strip
			m.id = g.id
			@matches.push(m)
		end
		@matches.sort! { |a,b| b.score <=> a.score }
		return @matches
	end

	def self.add_to_group(id, group_id)
		@user = User.find(id)
		@user.groupid = group_id
		@user.save
	end
	
	#Allows for storing of bcrypt passwords.
	has_secure_password

end
