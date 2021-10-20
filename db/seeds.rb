Heros.delete_all
5.times do 
    Heros.create name: Faker::Superhero.name
end
