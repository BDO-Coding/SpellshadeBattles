graphics = {}

require "menu"
require "background"

function love.draw()

	graphics.drawClasses()

end

function graphics.configureScreen()

	love.window.setFullscreen(true, "desktop")
	screenWidth, screenHeight = love.graphics.getDimensions()
	screenXOffset, screenYOffset = screenWidth/1920, screenHeight/1080

end

function graphics.drawClasses()

	menu.draw(screenWidth/1920, screenHeight/1080)
	background.draw(screenWidth/1920, screenHeight/1080)

end

