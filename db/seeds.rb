admin_role = Role.create(name: 'admin')
client_role = Role.create(name: 'client')
user1 = User.create(username: 'Nicole',
								    email: 'admin@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234',
                                    role_id: admin_role.id)

user2 = User.create(username: 'Bruce',
								    email: 'client@gmail.com',
								    password: 'password1234',
								    password_confirmation: 'password1234',
                                    role_id: client_role.id)
1.upto(40) do |count|
	TaskTodo.create(task: "task to do for admin #{count}",
								 user_id: 1)
end

1.upto(40) do |count|
	TaskTodo.create(task: "task to do for client  #{count}",
								 user_id: 2)
end