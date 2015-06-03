# Problem 1

def generate_username1 (name)
	name[0].downcase
end

# Problem 2
def generate_username2 (first_name, last_name) 
	return nil if first_name.empty? || last_name.empty?
	first_name.strip.gsub(/[^A-Za-z]/, '')[0].downcase + last_name.gsub(/[^A-Za-z]/, '').downcase
end

# Problem 3
def generate_username3 (first_name, last_name, birth_year)
	return nil if birth_year.to_s.length != 4
	generate_username2(first_name, last_name) + birth_year.to_s[-2, 2]
end

# Problem 4
def check_privilege (privilege = 0)
	return "user" if privilege == 0
	return "seller" if privilege == 1
	return "manager" if privilege == 2
	return "admin" if privilege == 3
end

def generate_username4 (first_name, last_name, birth_year, privilege = 0)
	username = generate_username3(first_name, last_name, birth_year)
	return username if privilege == 0
	return "seller-" + username if privilege == 1
	return "manager-" + username if privilege == 2
	return "admin-" + username if privilege == 3
end

# Problem 5
require 'set'
$usernames = Set.new

def generate_username5 (first_name, last_name, birth_year, privilege = 0)
	username = generate_username4(first_name, last_name, birth_year, privilege)
	
	# Doesn't work right. Only increments to "_1".
	# Needs to check username + "_i" and increment i 
	unique_num = 0;
	for i in $usernames do
		unique_num = unique_num + 1 if username == i	
		p unique_num
	end

	username = username + "_" + unique_num.to_s if unique_num > 0
	p unique_num
	$usernames.add(username)
	username
end
