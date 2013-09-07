collection @messages, root: "messages"
attributes :text, :user_id, :created_at



child :user do
	attributes :first_name, :last_name
	node(:url) { |user| user_url(user) }
end

