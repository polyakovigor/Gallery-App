namespace :upload do
  task :picture => :environment do
    categories_name = Dir[Rails.root.to_s+'/public/pictures/*'].map{ |f| File.basename(f) }
    categories_name.each do |c_name|
      puts c_name
      category = Category.find_by_name(c_name)
      if category.blank?
        category = Category.create(name: c_name, user_id: User.first.id)
      end
      image_names = Dir[Rails.root.to_s+"/public/pictures/#{c_name}/*.jpg"].map{ |f| File.basename(f) }
      image_names.each do |i_name|
        puts i_name
        if Image.find_by_title(i_name).blank?
          Image.create(:title => i_name, :picture => File.open(Rails.root.to_s+"/public/pictures/#{c_name}/#{i_name}"), :category_id => category.id)
        end
      end
    end
  end
end