# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?



puts "Tworzenie pokoi chatu..."

general = Room.find_or_create_by!(name: "Ogólny") do |room|
  room.description = "Główny kanał rozmów wszystkich członków"
  room.room_type = :general
end

announce = Room.find_or_create_by!(name: "Ogłoszenia") do |room|
  room.description = "Oficjalne ogłoszenia od administratorów"  
  room.room_type = :admin_announce
end

admin_room = Room.find_or_create_by!(name: "Administracja") do |room|
  room.description = "Prywatny kanał administratorów"
  room.room_type = :admin_only
end

# Dodaj wszystkich userów do odpowiednich pokoi
User.active.find_each do |user|
  # Wszyscy do kanału ogólnego i ogłoszeń
  general.room_memberships.find_or_create_by(user: user)
  announce.room_memberships.find_or_create_by(user: user)
  
  # Admini dodatkowo do kanału admin
  if user.admin?
    admin_room.room_memberships.find_or_create_by(user: user, role: :room_admin)
  end
end

puts "Pokoje utworzone!"