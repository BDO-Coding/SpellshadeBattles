require "images"
require "graphics"
require "background"
require "menu"

function love.load()

	images.load()
	graphics.configureScreen()
	menu.load()
	background.load()

end

function love.update()

	gameState = menu.getGameState()
	updateGameStates(gameState)

end

function updateGameStates(gameState)

	background.updateGameState(gameState)

end

end

