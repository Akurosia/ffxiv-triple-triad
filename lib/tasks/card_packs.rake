namespace :card_packs do
  BRONZE_CARDS = ['Spriggan', 'Pudding', 'Coblyn', 'Goobbue', 'Scarface Bugaal Ja', 'Behemoth',
                  'Magitek Death Claw', 'Liquid Flame', 'Delivery Moogle'].freeze
  SILVER_CARDS = ["Amalj'aa", 'Sylph', 'Kobold', 'Tataru Taru', 'Ixal', 'Lahabrea', 'Urianger', 'Minfilia'].freeze
  GOLD_CARDS = ['Mother Miounne', 'Momodi Modi', 'Baderon Tenfingers', 'Hoary Boulder & Coultenet', 'Gerolt',
                'Ultima Weapon', 'Cid Garlond', 'Warrior of Light', 'Zidane Tribal'].freeze
  MYTHRIL_CARDS = ['Vedrfolnir', 'Pipin Tarupin', 'Gilgamesh & Enkidu', 'Odin', 'Coeurlregina', 'Brachiosaur',
                   'Terra Branford', 'Bartz Klauser', 'Onion Knight'].freeze
  PLATINUM_CARDS = ['Tidus', 'Firion', 'Cecil Harvey', 'Lightning', 'Nanamo Ul Namo', 'Shiva', 'Lahabrea', 'Ultima Weapon'].freeze
  IMPERIAL_CARDS = ['Magitek Gunship', 'Magitek Sky Armor', 'Magitek Vanguard', 'Regula van Hydrus',
                    'Magitek Predator', 'Armored Weapon'].freeze

desc 'Create the card packs'
  task create: :environment do
    puts 'Creating card packs'
    count = Pack.count

    bronze = Pack.find_or_create_by!(id: 1, name_en: 'Bronze Triad Card', name_de: 'Boosterkarte (Bronze)',
                                     name_fr: 'Pochette Triple Triade Bronze', name_ja: 'トライアドパック・ブロンズ', cost: 520)
    bronze.cards = Card.where(name_en: BRONZE_CARDS)
    bronze.save

    silver = Pack.find_or_create_by!(id: 2, name_en: 'Silver Triad Card', name_de: 'Boosterkarte (Silber)',
                                     name_fr: 'Pochette Triple Triade Argent', name_ja: 'トライアドパック・シルバー', cost: 1150)
    silver.cards = Card.where(name_en: SILVER_CARDS)
    silver.save

    gold = Pack.find_or_create_by!(id: 3, name_en: 'Gold Triad Card', name_de: 'Boosterkarte (Gold)',
                                   name_fr: 'Pochette Triple Triade Or', name_ja: 'トライアドパック・ゴールド', cost: 2160)
    gold.cards = Card.where(name_en: GOLD_CARDS)
    gold.save

    mythril = Pack.find_or_create_by!(id: 4, name_en: 'Mythril Triad Card', name_de: 'Boosterkarte (Mithril)',
                                      name_fr: 'Pochette Triple Triade Mithrite', name_ja: 'トライアドパック・ミスライト', cost: 8000)
    mythril.cards = Card.where(name_en: MYTHRIL_CARDS)
    mythril.save

    platinum = Pack.find_or_create_by!(id: 5, name_en: 'Platinum Triad Card', name_de: 'Boosterkarte (Platin)',
                                       name_fr: 'Pochette Triple Triade Platine', name_ja: 'トライアドパック・プラチナ', cost: 0)
    platinum.cards = Card.where(name_en: PLATINUM_CARDS)
    platinum.save

    imperial = Pack.find_or_create_by!(id: 6, name_en: 'Imperial Triad Card', name_de: 'Garleische Triple Triad-Karte',
                                       name_fr: 'Pochette Triple Triade Impériale', name_ja: 'インペリアルトライアドパック', cost: 2160)
    imperial.cards = Card.where(name_en: IMPERIAL_CARDS)
    imperial.save

    puts "Created #{Pack.count - count} new card packs"
  end
end
