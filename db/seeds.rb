user = User.new(first_name: 'User',
                second_name: 'Example',
                email: 'user@example.com',
                password: 'password',
                password_confirmation: 'password')
user.skip_confirmation!
user.save!
