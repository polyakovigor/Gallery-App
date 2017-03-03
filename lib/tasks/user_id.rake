namespace :fill_in do
  desc 'Fill in field user_id in table categories'
  task :blank => :environment do
    Category.where(user_id: nil).each do |category|
      if User.first.blank?
        puts 'Error! Please create an user.'
      else
        category.update_attributes(user_id: User.first.id)
      end
    end
  end
end