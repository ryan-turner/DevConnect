json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :Class_Year, :Courses_Taken, :Days_Available, :Preffered_Programming_Languages, :Project_Interests, :Groupid
  json.url user_url(user, format: :json)
end
