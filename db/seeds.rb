# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
primus = Wine.find_by_name("Veramonte Primus") || Wine.new(:name=>"Veramonte Primus")
primus.varietal = "Other Red Wine"
primus.vintage = "2007"
primus.region = "Chile, South America"
primus.item_no = 99604
primus.save!

tilia = Wine.find_by_name("Tilia") || Wine.new(:name=>"Tilia")
tilia.varietal = "Cabernet Sauvignon"
tilia.vintage = "2009"
tilia.region = "Argentina, South America"
tilia.item_no = 105748
tilia.tags = [Tag.new(:name=>"big, bold, showy", :wine=>tilia)]
tilia.save!

beringer = Wine.find_by_name("Beringer Private Reserve") || Wine.new(:name=>"Beringer Private Reserve")
beringer.varietal = "Cabernet Sauvignon"
beringer.vintage = 2005
beringer.region = "Napa Valley"
beringer.item_no = 676787
beringer.tags = [Tag.new(:name=>"food friendly", :wine=>beringer)]
beringer.save!
