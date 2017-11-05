# Create company
blizzard = Company.new
blizzard.name = 'Blizzard'
blizzard.save

# Create game
game = Game.new
game.name = 'Starcraft'
game.description = 'A futuristic RTS game.'
game.save

# Create platform
pc = Platform.new
pc.name = 'PC'
pc.save

# Save asociations
GamesDeveloper.create(game: game, company: blizzard, platform: pc)
GamesPublisher.create(game: game, company: blizzard, platform: pc)

# Other one
# Create company
activision = Company.new
activision.name = 'Activision'
activision.save

# Create game
game = Game.new
game.name = 'Destiny 2'
game.description = 'An intense Shooter game.'
game.save

# Create platform
ps4 = Platform.new
ps4.name = 'PS4'
ps4.save

# Save asociations
GamesDeveloper.create(game: game, company: activision, platform: ps4)
GamesDeveloper.create(game: game, company: activision, platform: pc)
GamesPublisher.create(game: game, company: blizzard, platform: pc)
GamesPublisher.create(game: game, company: activision, platform: ps4)
