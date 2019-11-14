puts 'Cleaning database...'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts 'Creating ingredients...'

lemon = Ingredient.create(name: "lemon")
ice = Ingredient.create(name: "ice")
mint = Ingredient.create(name: "mint leaves")

puts 'Creating Cocktails...'

bloody = Cocktail.create(name: 'Bloody Mary')
pina = Cocktail.create(name: 'Piña Colada')
mojito = Cocktail.create(name: 'Mojito')

puts 'Creating Doses...'
Dose.create(description: "5cl", cocktail_id: bloody, ingredient_id: lemon)
Dose.create(description: "4cl", cocktail_id: bloody, ingredient_id: ice)
Dose.create(description: "6cl", cocktail_id: pina, ingredient_id: ice)
Dose.create(description: "1cl", cocktail_id: pina, ingredient_id: lemon)
Dose.create(description: "8cl", cocktail_id: mojito, ingredient_id: mint)
Dose.create(description: "5cl", cocktail_id: mojito, ingredient_id: ice)
Dose.create(description: "3cl", cocktail_id: mojito, ingredient_id: lemon)

puts 'Creating Finish...'
