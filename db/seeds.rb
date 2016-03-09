# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed user
User.destroy_all
user1 = User.create!(email:"admin@admin.com", password: "124567890", photo: "http://t0.gstatic.com/images?q=tbn:ANd9GcQ4fto24q0e4zt_rsUjcIFmZ3SsnWEbeizSl0f4u69vjqP3dd8dksN8kWA", admin: true)
user2 = User.create!(email:"exemple@admin.com", password: "12345678", photo: "http://t0.gstatic.com/images?q=tbn:ANd9GcQ4fto24q0e4zt_rsUjcIFmZ3SsnWEbeizSl0f4u69vjqP3dd8dksN8kWA")



# Seed agency
Agency.destroy_all
agency1 = Agency.create!(name:"Fullsix", user: user1, photo:"http://unslpash.it/300/300", description: "trop cool" )
agency1 = Agency.create!(name:"Le Wagon", user: user1, photo:"http://unslpash.it/300/300", description: "trop cool" )
agency1 = Agency.create!(name:"BFR", user: user1, photo:"http://unslpash.it/300/300", description: "trop cool" )


Review.destroy_all
review1 = Review.create!(description: "Très satisfait de la prestation ! Une équipe sympa, dynamique et efficace. Très bénéfique pour mon entreprise.", agency: agency1, user: user2, star: 3)
review2 = Review.create!(description: "Entreprise jeune et dynamique, à l’écoute du client. Également disponible pour le suivi ou les modifications à apporter sur le site.", agency: agency1, user: user2, star: 5)
review3 = Review.create!(description: "Entreprise jeune et dynamique, à l’écoute du client. Également disponible pour le suivi ou les modifications à apporter sur le site.", agency: agency1, user: user2, star: 1)





