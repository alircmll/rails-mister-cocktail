require 'json'
require 'open-uri'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

# def coktails(letter)
#   url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}"
#   drinks_serialized = open(url).read
#   drinks = JSON.parse(drinks_serialized)
#   if !drinks['drinks'].nil?
#     drinks['drinks'].each do |drink|
#       c = Cocktail.create(name: drink['strDrink'])
#       i = Ingredient.create(name: drink['strIngredient1'])
#       Dose.create({description: drink['strMeasure1'], ingredient_id: i.id, cocktail_id: c.id} )
#     end
#   end
# end


def fetch_cocktail(letter)
 cocktails_serialized = open("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=" + letter).read
 cocktails = JSON.parse(cocktails_serialized)
 if !cocktails["drinks"].nil?
   cocktails["drinks"].each do |cocktail|
     c = Cocktail.new({name: cocktail["strDrink"]}) # retire image
     if c.valid?
       c.save
       (1..15).to_a.each do |number|
         i = Ingredient.new({name: cocktail["strIngredient#{number.to_s}"]})
         if i.valid? && !cocktail["strIngredient#{number.to_s}"].nil?
           i.save
           d = Dose.new({description: cocktail["strMeasure#{number.to_s}"]})
           d[:cocktail_id] = c.id
           d[:ingredient_id] = i.id
           d.save
         elsif i.errors.messages[:name] == ["has already been taken"]
           i = Ingredient.find_by(name: cocktail["strIngredient#{number.to_s}"])
           d = Dose.new({description: cocktail["strMeasure#{number.to_s}"]})
           d[:cocktail_id] = c.id
           d[:ingredient_id] = i.id
           d.save
         end
       end
     end
   end
 end
end

('a'..'z').to_a.each do |letter|
  fetch_cocktail(letter)
end
