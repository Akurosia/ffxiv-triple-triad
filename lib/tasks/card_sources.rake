namespace :card_sources do
  desc 'Sets the sources for various cards, including buy price'
  task set: :environment do
    puts 'Setting various card sources'

    # Initial
    Card.where(name_en: %w(Dodo Sabotender Bomb Mandragora Coeurl)).each do |card|
      card.sources.find_or_create_by!(origin: 'Other', name: 'Quest: Triple Triad Trial')
    end

    # Dungeon
    Card.find_by(name_en: 'Gaius van Baelsar').sources.find_or_create_by(origin: 'Dungeon', name: 'The Praetorium')
    Card.find_by(name_en: 'Zenos yae Galvus').sources.find_or_create_by(origin: 'Dungeon', name: 'Ala Mhigo')
    Card.find_by(name_en: 'Grynewaht').sources.find_or_create_by(origin: 'Dungeon', name: 'Doma Castle')
    Card.find_by(name_en: 'Ferdiad').sources.find_or_create_by(origin: 'Dungeon', name: 'Amdapor Keep (Hard)')
    Card.find_by(name_en: 'Demon Wall').sources.find_or_create_by(origin: 'Dungeon', name: 'Amdapor Keep')
    Card.find_by(name_en: 'Demon Wall').sources.find_or_create_by(origin: 'Dungeon', name: 'Amdapor Keep (Hard)')
    Card.find_by(name_en: 'Morbol').sources.find_or_create_by(origin: 'Dungeon', name: 'The Aurum Vale')
    Card.find_by(name_en: 'The Griffin').sources.find_or_create_by(origin: 'Dungeon', name: "Baelsar's Wall")
    Card.find_by(name_en: 'Livia sas Junius').sources.find_or_create_by(origin: 'Dungeon', name: 'Castrum Meridianum')
    Card.find_by(name_en: 'Chimera').sources.find_or_create_by(origin: 'Dungeon', name: "Cutter's Cry")
    Card.find_by(name_en: 'Ahriman').sources.find_or_create_by(origin: 'Dungeon', name: 'Dzemael Darkhold')
    Card.find_by(name_en: 'Succubus').sources.find_or_create_by(origin: 'Dungeon', name: 'Haukke Manor')
    Card.find_by(name_en: 'Succubus').sources.find_or_create_by(origin: 'Dungeon', name: 'Haukke Manor (Hard)')
    Card.find_by(name_en: 'Mistbeard').sources.find_or_create_by(origin: 'Dungeon', name: 'Hullbreaker Isle (Hard)')
    Card.find_by(name_en: 'Waukkeon').sources.find_or_create_by(origin: 'Dungeon', name: 'Neverreap')
    Card.find_by(name_en: 'Siren').sources.find_or_create_by(origin: 'Dungeon', name: 'Pharos Sirius')
    Card.find_by(name_en: 'Progenitrix').sources.find_or_create_by(origin: 'Dungeon', name: 'Pharos Sirius (Hard)')
    Card.find_by(name_en: 'Belladonna').sources.find_or_create_by(origin: 'Dungeon', name: "Saint Mocianne's Arboretum")
    Card.find_by(name_en: 'Tokkapchi').sources.find_or_create_by(origin: 'Dungeon', name: "Saint Mocianne's Arboretum (Hard)")
    Card.find_by(name_en: 'Sahagin').sources.find_or_create_by(origin: 'Dungeon', name: 'Sastasha')
    Card.find_by(name_en: 'Sahagin').sources.find_or_create_by(origin: 'Dungeon', name: 'Sastasha (Hard)')
    Card.find_by(name_en: 'Kraken').sources.find_or_create_by(origin: 'Dungeon', name: 'Sastasha (Hard)')
    Card.find_by(name_en: 'Lava Scorpion').sources.find_or_create_by(origin: 'Dungeon', name: 'Sohm Al (Hard)')
    Card.find_by(name_en: 'Hraesvelgr').sources.find_or_create_by(origin: 'Dungeon', name: 'Sohr Khai')
    Card.find_by(name_en: 'Calcabrina').sources.find_or_create_by(origin: 'Dungeon', name: 'The Antitower')
    Card.find_by(name_en: 'Mist Dragon').sources.find_or_create_by(origin: 'Dungeon', name: 'The Burn')
    Card.find_by(name_en: 'Tioman').sources.find_or_create_by(origin: 'Dungeon', name: 'Sohm Al')
    Card.find_by(name_en: 'Nidhogg').sources.find_or_create_by(origin: 'Dungeon', name: 'The Aery')
    Card.find_by(name_en: 'Griffin').sources.find_or_create_by(origin: 'Dungeon', name: 'The Dusk Vigil')
    Card.find_by(name_en: 'Byblos').sources.find_or_create_by(origin: 'Dungeon', name: 'The Great Gubal Library')
    Card.find_by(name_en: 'Strix').sources.find_or_create_by(origin: 'Dungeon', name: 'The Great Gubal Library (Hard)')
    Card.find_by(name_en: 'Curator').sources.find_or_create_by(origin: 'Dungeon', name: 'The Fractal Continuum')
    Card.find_by(name_en: 'Kuribu').sources.find_or_create_by(origin: 'Dungeon', name: 'The Lost City of Amdapor (Hard)')
    Card.find_by(name_en: 'Blue Dragon').sources.find_or_create_by(origin: 'Dungeon', name: 'The Stone Vigil')
    Card.find_by(name_en: 'Blue Dragon').sources.find_or_create_by(origin: 'Dungeon', name: 'The Stone Vigil (Hard)')
    Card.find_by(name_en: 'Vicegerent to the Warden').sources
      .find_or_create_by(origin: 'Dungeon', name: 'The Sunken Temple of Qarn (Hard)')
    Card.find_by(name_en: 'Charibert').sources.find_or_create_by(origin: 'Dungeon', name: 'The Vault')
    Card.find_by(name_en: 'Manxome Molaa Ja Ja').sources.find_or_create_by(origin: 'Dungeon', name: "The Wanderer's Palace (Hard)")
    Card.find_by(name_en: 'Tonberry').sources.find_or_create_by(origin: 'Dungeon', name: "The Wanderer's Palace")
    Card.find_by(name_en: 'Tonberry').sources.find_or_create_by(origin: 'Dungeon', name: "The Wanderer's Palace (Hard)")
    Card.find_by(name_en: 'Tozol Huatotl').sources.find_or_create_by(origin: 'Dungeon', name: 'Xelphatol')
    Card.find_by(name_en: 'Genbu').sources.find_or_create_by(origin: 'Dungeon', name: "Hells' Lid")
    Card.find_by(name_en: 'Guidance Node').sources.find_or_create_by(origin: 'Dungeon', name: 'The Fractal Continuum (Hard)')
    Card.find_by(name_en: 'Qitian Dasheng').sources.find_or_create_by(origin: 'Dungeon', name: "The Swallow's Compass")
    Card.find_by(name_en: 'Fenrir').sources.find_or_create_by(origin: 'Dungeon', name: 'Snowcloak')
    Card.find_by(name_en: 'Hrodric Poisontongue').sources.find_or_create_by(origin: 'Dungeon', name: 'The Drowned City of Skalla')

    # Trials
    Card.find_by(name_en: 'Zurvan').sources.find_or_create_by(origin: 'Trial', name: 'Containment Bay Z1T9')
    Card.find_by(name_en: 'Zurvan').sources.find_or_create_by(origin: 'Trial', name: 'Containment Bay Z1T9 (Extreme)')
    Card.find_by(name_en: 'Shiva').sources.find_or_create_by(origin: 'Trial', name: 'Akh Afah Amphitheatre (Hard)')
    Card.find_by(name_en: 'Shiva').sources.find_or_create_by(origin: 'Trial', name: 'Akh Afah Amphitheatre (Extreme)')
    Card.find_by(name_en: 'Rhitahtyn sas Arvina').sources.find_or_create_by(origin: 'Trial', name: 'Cape Westwind')
    Card.find_by(name_en: 'Bartz Klauser').sources.find_or_create_by(origin: 'Trial', name: 'Battle in the Big Keep')
    Card.find_by(name_en: 'Gilgamesh & Enkidu').sources.find_or_create_by(origin: 'Trial', name: 'Battle on the Big Bridge')
    Card.find_by(name_en: 'Suzaku').sources.find_or_create_by(origin: 'Trial', name: "Hells' Kier")
    Card.find_by(name_en: 'Suzaku').sources.find_or_create_by(origin: 'Trial', name: "Hells' Kier (Extreme)")
    Card.find_by(name_en: 'Sophia').sources.find_or_create_by(origin: 'Trial', name: 'Containment Bay P1T6')
    Card.find_by(name_en: 'Sophia').sources.find_or_create_by(origin: 'Trial', name: 'Containment Bay P1T6 (Extreme)')
    Card.find_by(name_en: 'Ifrit').sources.find_or_create_by(origin: 'Trial', name: 'The Bowl of Embers (Hard)')
    Card.find_by(name_en: 'Ifrit').sources.find_or_create_by(origin: 'Trial', name: 'The Bowl of Embers (Extreme)')
    Card.find_by(name_en: 'Ultros & Typhon').sources.find_or_create_by(origin: 'Trial', name: "The Dragon's Neck")
    Card.find_by(name_en: 'Terra Branford').sources.find_or_create_by(origin: 'Trial', name: "The Dragon's Neck")
    Card.find_by(name_en: 'Garuda').sources.find_or_create_by(origin: 'Trial', name: 'The Howling Eye (Hard)')
    Card.find_by(name_en: 'Garuda').sources.find_or_create_by(origin: 'Trial', name: 'The Howling Eye (Extreme)')
    Card.find_by(name_en: 'Bismarck').sources.find_or_create_by(origin: 'Trial', name: 'The Limitless Blue (Hard)')
    Card.find_by(name_en: 'Bismarck').sources.find_or_create_by(origin: 'Trial', name: 'The Limitless Blue (Extreme)')
    Card.find_by(name_en: 'Archbishop Thordan VII').sources
      .find_or_create_by(origin: 'Trial', name: "The Minstrel's Ballad: Thordan's Reign")
    Card.find_by(name_en: 'Ultima Weapon').sources.find_or_create_by(origin: 'Trial', name: "The Minstrel's Ballad: Ultima's Bane")
    Card.find_by(name_en: 'Titan').sources.find_or_create_by(origin: 'Trial', name: 'The Navel (Hard)')
    Card.find_by(name_en: 'Titan').sources.find_or_create_by(origin: 'Trial', name: 'The Navel (Extreme)')
    Card.find_by(name_en: 'Ramuh').sources.find_or_create_by(origin: 'Trial', name: 'The Striking Tree (Hard)')
    Card.find_by(name_en: 'Ramuh').sources.find_or_create_by(origin: 'Trial', name: 'The Striking Tree (Extreme)')
    Card.find_by(name_en: 'Leviathan').sources.find_or_create_by(origin: 'Trial', name: 'The Whorleater (Hard)')
    Card.find_by(name_en: 'Leviathan').sources.find_or_create_by(origin: 'Trial', name: 'The Whorleater (Extreme)')
    Card.find_by(name_en: 'Ravana').sources.find_or_create_by(origin: 'Trial', name: 'Thok ast Thok (Hard)')
    Card.find_by(name_en: 'Ravana').sources.find_or_create_by(origin: 'Trial', name: 'Thok ast Thok (Extreme)')
    Card.find_by(name_en: 'Good King Moggle Mog XII').sources.find_or_create_by(origin: 'Trial', name: 'Thornmarch (Hard)')
    Card.find_by(name_en: 'Good King Moggle Mog XII').sources.find_or_create_by(origin: 'Trial', name: 'Thornmarch (Extreme)')
    Card.find_by(name_en: 'Odin').sources.find_or_create_by(origin: 'Trial', name: "Urth's Fount")
    Card.find_by(name_en: 'Tsukuyomi').sources.find_or_create_by(origin: 'Trial', name: "Castrum Fluminis")
    Card.find_by(name_en: 'Tsukuyomi').sources.find_or_create_by(origin: 'Trial', name: "The Minstrel's Ballad: Tsukuyomi's Pain")
    Card.find_by(name_en: 'Byakko').sources.find_or_create_by(origin: 'Trial', name: 'The Jade Stoa')
    Card.find_by(name_en: 'Byakko').sources.find_or_create_by(origin: 'Trial', name: 'The Jade Stoa (Extreme)')
    Card.find_by(name_en: 'Lakshmi').sources.find_or_create_by(origin: 'Trial', name: 'Emanation')
    Card.find_by(name_en: 'Lakshmi').sources.find_or_create_by(origin: 'Trial', name: 'Emanation (Extreme)')
    Card.find_by(name_en: 'Susano').sources.find_or_create_by(origin: 'Trial', name: 'The Pool of Tribute')
    Card.find_by(name_en: 'Susano').sources.find_or_create_by(origin: 'Trial', name: 'The Pool of Tribute (Extreme)')
    Card.find_by(name_en: 'Shinryu').sources.find_or_create_by(origin: 'Trial', name: "The Royal Menagerie")
    Card.find_by(name_en: 'Shinryu').sources.find_or_create_by(origin: 'Trial', name: "The Minstrel's Ballad: Shinryu's Domain")
    Card.find_by(name_en: 'Sephirot').sources.find_or_create_by(origin: 'Trial', name: 'Containment Bay S1T7')
    Card.find_by(name_en: 'Sephirot').sources.find_or_create_by(origin: 'Trial', name: 'Containment Bay S1T7 (Extreme)')

    # Raids
    Card.find_by(name_en: 'Phlegethon').sources.find_or_create_by(origin: 'Raid', name: 'The Labyrinth of the Ancients')
    Card.find_by(name_en: 'Diabolos Hollow').sources.find_or_create_by(origin: 'Raid', name: 'Dun Scaith')
    Card.find_by(name_en: 'Brute Justice').sources.find_or_create_by(origin: 'Raid', name: 'Alexander - The Burden of the Son')
    Card.find_by(name_en: 'Alexander Prime').sources.find_or_create_by(origin: 'Raid', name: 'Alexander - The Soul of the Creator')
    Card.find_by(name_en: 'Omega').sources.find_or_create_by(origin: 'Raid', name: 'Alphascape V3.0')
    Card.find_by(name_en: 'Omega').sources.find_or_create_by(origin: 'Raid', name: 'Alphascape V4.0')
    Card.find_by(name_en: 'Xande').sources.find_or_create_by(origin: 'Raid', name: 'Syrcus Tower')
    Card.find_by(name_en: 'Echidna').sources.find_or_create_by(origin: 'Raid', name: 'The Void Ark')
    Card.find_by(name_en: 'Calofisteri').sources.find_or_create_by(origin: 'Raid', name: 'The Weeping City of Mhach')
    Card.find_by(name_en: 'Cloud of Darkness').sources.find_or_create_by(origin: 'Raid', name: 'The World of Darkness')
    Card.find_by(name_en: 'Onion Knight').sources.find_or_create_by(origin: 'Raid', name: 'The World of Darkness')
    Card.find_by(name_en: 'Yiazmat').sources.find_or_create_by(origin: 'Raid', name: 'The Ridorana Lighthouse')
    Card.find_by(name_en: 'Rofocale').sources.find_or_create_by(origin: 'Raid', name: 'The Royal City of Rabanastre')
    Card.find_by(name_en: 'Argath Thadalfus').sources.find_or_create_by(origin: 'Raid', name: 'The Royal City of Rabanastre')

    # FATEs
    Card.find_by(name_en: 'Darkscale').sources
      .find_or_create_by(origin: 'FATE', name: 'FATE: Mogicide / Rastaban Vibration (Churning Mists)')
    Card.find_by(name_en: 'Fat Chocobo').sources
      .find_or_create_by(origin: 'FATE', name: 'FATE: Special Tarasque Force (Dravanian Forelands)')
    Card.find_by(name_en: 'Phoebad').sources.find_or_create_by(origin: 'FATE', name: 'FATE: Tall Tale (The Lochs)')
    Card.find_by(name_en: 'Mammoth').sources.find_or_create_by(origin: 'FATE', name: 'FATE: Wham Bam Thank You Mammoth (Azim Steppe)')

    # Tournaments
    Card.find_by(name_en: 'Firion').sources.find_or_create_by(origin: 'Tournament', name: 'Triple Triad Tournament')
    Card.find_by(name_en: 'Cecil Harvey').sources.find_or_create_by(origin: 'Tournament', name: 'Triple Triad Tournament')
    Card.find_by(name_en: 'Tidus').sources.find_or_create_by(origin: 'Tournament', name: 'Triple Triad Tournament')
    Card.find_by(name_en: 'Lightning').sources.find_or_create_by(origin: 'Tournament', name: 'Triple Triad Tournament')

    # Eureka
    Card.find_by(name_en: 'Happy Bunny').sources.find_or_create_by(origin: 'Eureka', name: 'Eureka Pagos: Silver Coffer')
    Card.find_by(name_en: 'Yukinko').sources.find_or_create_by(origin: 'Eureka', name: 'Eureka Pagos: Eternity FATE')
    Card.find_by(name_en: 'Pazuzu').sources.find_or_create_by(origin: 'Eureka', name: 'Eureka Anemos: Wail in the Willows FATE')
    Card.find_by(name_en: 'Louhi').sources.find_or_create_by(origin: 'Eureka', name: 'Eureka Pagos: Louhi on Ice FATE')
    Card.find_by(name_en: 'Penthesilea').sources.find_or_create_by(origin: 'Eureka', name: 'Eureka Pyros: Lost Epic FATE')

    # Heaven on High
    Card.find_by(name_en: 'Wanyudo & Katasharin').sources.find_or_create_by(origin: 'Other', name: 'Heaven on High: Silver/Gold Sack')
    Card.find_by(name_en: 'Hatamoto').sources.find_or_create_by(origin: 'Other', name: 'Heaven on High: Silver/Gold Sack')
    Card.find_by(name_en: 'Hiruko').sources.find_or_create_by(origin: 'Other', name: 'Heaven on High: Gold Sack')

    # Events
    Card.find_by(name_en: 'Gold Saucer Attendant').sources.find_or_create_by(origin: 'Other', name: 'Event: Make It Rain (500 MGP)')
    Card.find_by(name_en: 'Roland').sources.find_or_create_by(origin: 'Other', name: 'Event: Make It Rain (1,000 MGP)')
    Card.find_by(name_en: 'Gigi').sources.find_or_create_by(origin: 'Other', name: 'Event: Make It Rain (18,000 MGP)')

    # Shop prices
    Card.find_by(name_en: 'Chocobo').update(buy_price: 600)
    Card.find_by(name_en: 'Opo-opo').update(buy_price: 600)
    Card.find_by(name_en: 'Moogle').update(buy_price: 840)
    Card.find_by(name_en: 'Mossling').update(buy_price: 840)
    Card.find_by(name_en: 'Adamantoise').update(buy_price: 840)
    Card.find_by(name_en: 'Chapuli').update(buy_price: 1200)
    Card.find_by(name_en: 'Muud Suud').update(buy_price: 1500)
    Card.find_by(name_en: 'Raya-O-Senna & A-Ruhn-Senna').update(buy_price: 4800)
    Card.find_by(name_en: 'Godbert Manderville').update(buy_price: 9600)
    Card.find_by(name_en: 'Julyan Manderville').update(buy_price: 14_400)
    Card.find_by(name_en: "F'lhaminn").update(buy_price: 20_000)
    Card.find_by(name_en: 'Senor Sabotender').update(buy_price: 200_000)
    Card.find_by(name_en: 'Nanamo Ul Namo').update(buy_price: 400_000)
    Card.find_by(name_en: 'Raubahn & Pipin').update(buy_price: 400_000)
    Card.find_by(name_en: 'Cloud Strife').update(buy_price: 1_000_000)
  end
end
