# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Reset the 'chefs' table
User.delete_all
i = 0
15.times do
  fileName = i.to_s + '.jpg'
  chef = User.create name: ['Mark Twain','Sylvia Plath','Clark Kent', 'Guy Fieri', 'Ronald Mcdonald'].sample,
                     email: 'marktwain@gmail.com',
                     :avatar => File.open("app/assets/images/ChefImages/#{fileName}", 'rb'),
                     role: 'Chef', address: '2222 East 51rd Street, Chicago, IL 60615',
                     cuisine: ['Chinese', 'American', 'Israeli', 'Mexican', 'Ethiopian'].sample,
                     phone: '8888888888', password: 'password', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna'
  i = i + 1
end

# Create Menus for Chefs
Menu.delete_all

range = (1..120).to_a
User.all.each do |chef|
  4.times do
    fileName = range.sample.to_s + '.jpg'
    menu =  Menu.create(:menuimage => File.open("app/assets/images/MenuImages/#{fileName}", 'rb'),
                        :user => User.find_by(id: chef.id),
                        :title => ['All-Star Meal','Lions’ Lunch','Peoples’ Choice','The Chefs Feast','Popeye’s Pick'].sample,
                        :cuisine => ['Chinese', 'American', 'Israeli', 'Mexican', 'Ethiopian'].sample,
                        :price => range.sample)
  end
end

# Reset the 'reviews' table
Review.delete_all
User.all.each do |chef|
  4.times do
    review = Review.create user_id: chef.id,
                  rating: [1,2,3,4,5].sample,
                  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end
end

range = (1..90).to_a
Menu.all.each do |menu|
  4.times do
    review = Review.create menu_id: menu.id,
                           user_id: menu.user.id,
                           rating: [1,2,3,4,5].sample,
                           content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    fileName = range.sample.to_s + '.jpg'
    food = Food.create menu_id: menu.id, user_id: menu.user.id,
                       :foodimage => File.open("app/assets/images/FoodImages/#{fileName}", 'rb'),
                       title: "Food Title",
                       description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end
end

puts "#{User.count} chefs."
puts "#{Review.count} reviews."
puts "#{Menu.count} menus."
puts "#{Food.count} foods."