# DevConnect
### A Project to Help Make Team Finding Less Horrible
## Team Members
* Cassidy Haas ( @cassidyhhaas )
* Ryan Turner ( @ryan-turner )
* Dante Pasionek ( @Dpasi314 )
* Pierce Doogan ( @pierce-doogan )
* Jeffrey Lipnick ( @jeffreylipnick )


## What does it do?
We are creating a web application to match students in a course for group projects, based on parameters like skills (and level of proficiency in that skill), availability, interests, and previous courses taken.
## How to Run
Visit the final web application at https://cscidevconnect.herokuapp.com/ <br>
To run the auto documentation: bundle exec rake doc:rails <br>
To run the test suite: rake test
## Our Vision
Make finding groups, just a little less terrible.

## Motivation
We recognise the need for a group making facilitator for computer science class projects, because it is often challenging to build a group when you do not already personally know people in the course. As a result, many groups end up randomly joining together, leading to uneven distribution of skills across the group, which makes group cohesion difficult, thus justifying the need for this kind of web application.
## Our Presentation (DevConnect_Part5)
https://prezi.com/view/RD3r2mP0PYLmqwtZdn2c/
## Risks
* Lack of experience in web application development
* Many of the team members do not know each other previous to starting this project
* Integration of multiple programming languages
* Lack of shared language skills across the group

## Mitigation Strategy
* Breaking up the project into pieces and distributing them to members due to strength and experience
* Keeping the pieces of the assignment small
* Pair programming on pieces of the assignments when necessary to ensure complicated pieces are implemented effectively
* Meeting regularly to stay connected on the pieces of the project, and to collaborate on solving problems a member may encounter

## Requirements
### User Stories - (6 is hardest, 1 is easiest)

ID (Binary) | Description | Rating
------------|-------------|--------
00000001 | As a creator, I want to be able to define the parameters students can search with when determining their groups. | 4
00000010 | As a student, I want to be able to filter groups by project type, so I can work with someone who has similar interest. | 3
00000011 | As a student, I want to be able to find groups that are familiar with the same languages I am, so that we can work fluidly and effectively. | 3
00000100 | As a creator, I want to be able to set how large groups can be within the class, so as to control group sizes per assignments given. | 1
00000101 | As a student, I want to be notified when someone would like to be in a group with me, so I can respond to them in a timely manner. | 5
00000110 | As a student, I want to be able to filter by availability to work with people in person on a more consistent basis. | 6

## Methodology
We plan to use the Agile methodology to keep in line with Part 2 of the project and to accommodate for the scope of the project.

## Other Relevant Information
#### GitHub Info
GitHub  Repository Link: https://github.com/Dpasi314/DevConnect
#### Current Projects
Trello Project: https://trello.com/b/Ac1Rkcqh/team-product-sprint-1
![Projects](http://i.imgur.com/19TRYdy.png)

## Auto Documentation
Auto documentation can be found at https://github.com/Dpasi314/DevConnect/tree/master/project/doc/api <br>
To run the auto documentation: bundle exec rake doc:rails

## Matching Algorithm
Here is the pseudocode used in our matching algorithm to make group recommendations for users. This is the algorithm that runs when a user first signs up for group finding.
```
// Get project information from projects table
group_max_size

// Get the following values from the users table and store in array
// user_languages is an array of the programming languages user knows
// user_skills is an array of the skills user has: 
// (Front-end dev, Back-end dev, design, ect...). Max size of 2 skills
// user_availability is an array of days/times user is available.  Max of 3 day/times.
// The max size of the skills/availability arrays keeps our match_score cap at 100.
U = [user_interest, user_languages, user_skills, user_availability] 

// Get list of all groups from groups table
Matches = [] // empty list of matches
for each group in list_of_groups:
	if group_size < group_max_size:
		// Get group information and store in array
		// group_skills is an array of skills members in the group already posses
		G = [group_name, group_interest, group_language_preference, group_skills, group_availability]
		(group_name, match_score, match_data) = run_match(U, G) // run_match is defined below
		M.append((group_name, match_score, match_data))
	end
end
// Return array of matches and their data for display
return Matches

// Generate matching score out of 100. group_interest and group_language_preference 
// add the largest values.  We assume 3 day/time options for the user and 2 user skills.
function run_match(U, G):
	match_score = 0
	match_data = []
	// While many of the values have been passed in as arrays to simplify data passing, 
	// they'll be referred to as their end variable value below for clarity's sake.
	if user_interest == group_interest:
		match_score += 30
		append to match_data
	end
	for language in user_languages:
		// there is only one group_language_preference so this value can only be added once
		if language == group_language_preference: 
			match_score += 20
			append to match_data
			break
		end
	end
	// Assumes 3 day/time options per user
	for uday,utime in user_availability:
		for gday,gtime in group_availability:
			if uday == gday and utime == gtime:
				match_score += 10
				append to match_data
			end
		end
	end
	// Assumes 2 skills in user_skills
	for skill in user_skills:
		if skill not in group_skills:
			match_score += 10
		end
	end

	return group_name, match_score, match_data

```






