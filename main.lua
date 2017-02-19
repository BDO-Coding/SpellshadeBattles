require "images"
require "graphics"
require "menu"

function love.load()

	images.load()
	graphics.configureScreen()
	menu.load()
	menu.newButton("It works!", 500, 10, 500, 300, 0, 0, 255)
	menu.newButton("Width: "..screenWidth.."\n Height: "..screenHeight, 500,500,200,100,20,100,0)

end



