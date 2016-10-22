# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ticket_ranges = ["Free", "$10-30", "$30", "$5 Suggested Donation"]
5.times do
    c = Company.create(
        name: Faker::Company.name,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        url: Faker::Internet.url,
        short_description: Faker::Hipster.sentence,
        description: Faker::Hipster.paragraph
    )

    3.times do
        c.productions.create(
            title: Faker::Superhero.name,
            short_description: Faker::Hipster.sentence,
            description: Faker::Hipster.paragraph,
            price_range: ticket_ranges.sample,
            ticket_url: Faker::Internet.url
        )
    end

end


