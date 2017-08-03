# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Reset the 'chefs' table
Chef.delete_all

chef = Chef.create name: 'Mark Twain', email: 'marktwain@gmail.com',
                    photo_url: 'http://media.safebee.com/assets/images/2015/4/chef%20tips.jpg.838x0_q67_crop-smart.jpg',
                   address: '2222 East 51rd Street, Chicago, IL 60615', cuisine: 'American',
                   phone: '8582222222', password: 'dandan94', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna'

chef = Chef.create name: 'Sylvia Plath', email: 'sylplath@gmail.com',
                   photo_url: 'http://i.huffpost.com/gen/1282658/images/h-FEMALE-CHEF-628x314.jpg',
                   address: '2222 East 51rd Street, Chicago, IL 60615', cuisine: 'Chinese',
                   phone: '8582222222', password: 'dandan94', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna'

chef = Chef.create name: 'Clark Kent', email: 'clarkkent@gmail.com',
                   photo_url: 'http://www.getfitgofigure.com/wp-content/uploads/2015/08/chef.png',
                   address: '2222 East 51rd Street, Chicago, IL 60615', cuisine: 'Chinese',
                   phone: '8582222222', password: 'dandan94', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna'


# Reset the 'reviews' table
Review.delete_all

Chef.all.each do |chef|
  4.times do
    review = Review.create chef_id: chef.id,
                  rating: [1,2,3,4,5].sample,
                  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end
end

puts "#{Chef.count} chefs."
puts "#{Review.count} reviews."