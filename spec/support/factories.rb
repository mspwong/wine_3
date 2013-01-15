FactoryGirl.define do
  sequence(:wine_name) { |n| "Wine #{n}" }
  sequence(:wine_item_no) { |n| n }
  sequence(:wine_id) { |n| n }
  sequence(:tag_id) { |n| n }

  factory :wine do
    name { FactoryGirl.generate :wine_name }
    item_no { FactoryGirl.generate :wine_item_no}
  end

  factory :tag do
    wine
    name 'placeholder'
    
    trait(:red) { name 'full, red, robust' }
    trait(:white) { name 'delicate, white, dry' }
  end

end