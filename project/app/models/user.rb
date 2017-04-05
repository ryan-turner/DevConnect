class User < ActiveRecord::Base
	belongs_to :group

	def self.matches(user)
		@groups= Group.all
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
			m = OpenStruct.new
			m.name = g.name
			m.score = @match_score
			m.language = g.language_preference.strip
			m.interest = g.interest.strip
			m.availability = g.availability.strip
			m.groupid = g.id
			@matches.push(m)
		end
		@matches.sort! { |a,b| b.score <=> a.score }
		return @matches
	end

end

# Commands to configure database
# rails g migration add_references_to_users group:references 
# rake db:migrate
