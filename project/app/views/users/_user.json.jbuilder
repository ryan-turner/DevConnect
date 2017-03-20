json.extract! user, :id, :name, :email, :interest, :language1, :language2, :time1, :time2, :skill, :password, :groupid, :created_at, :updated_at
json.url user_url(user, format: :json)
