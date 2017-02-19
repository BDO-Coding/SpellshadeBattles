menu = {}

require "images"


function menu.load()

	buttonArray = {}
	--	buttonArray[buttonNum] = {text, x, y, width, height, r, b, g, isHoveredOver, isPressed, hoverMethod, pressMethod)

	buttonNum = 0
	buttonOffsetX, buttonOffsetY = 4, 30

	menu.setupMainMenu()
end

function menu.draw(screenXOffset, screenYOffset)

	menu.drawButtons(screenXOffset, screenYOffset)
	love.graphics.setColor(255,255,255)
	love.graphics.print(buttonArray[1][6],1,1)

end

function love.update()

	mouseX, mouseY = love.mouse.getX(), love.mouse.getY()
	menu.testForButtonPresses()
	menu.callPressMethods()

end

function menu.newButton(text, x, y, width, height, r, b, g, hoverMethod, clickMethod)

	buttonArray[buttonNum+1] = {text, x, y, width, height, r, b, g, false, false, hoverMethod, clickMethod}
	buttonNum = buttonNum + 1
end

function menu.drawButtons()

	if buttonNum > 0 then

		for i = 1, buttonNum do
			love.graphics.setColor(buttonArray[i][6], buttonArray[i][7], buttonArray[i][8])
        	love.graphics.rectangle("fill", buttonArray[i][2]*screenXOffset, buttonArray[i][3]*screenYOffset, buttonArray[i][4]*screenXOffset, buttonArray[i][5]*screenYOffset)
        	love.graphics.setColor(255-buttonArray[i][6], 255-buttonArray[i][7], 255-buttonArray[i][8])
        	love.graphics.print(buttonArray[i][1], (buttonArray[i][2]+(buttonArray[i][4]/2)-(buttonArray[i][4]/buttonOffsetX))*screenXOffset, (buttonArray[i][3]+(buttonArray[i][5]/2)-(buttonArray[i][4]/buttonOffsetY))*screenYOffset, 0, 1, 1)

		end
	end
end

function menu.testForButtonPresses()

	if buttonNum > 0 then

		for i = 1, buttonNum do

			if mouseX>(buttonArray[i][2]*screenXOffset) and mouseY > (buttonArray[i][3]*screenYOffset) and mouseX < ((buttonArray[i][2]+buttonArray[i][4])*screenXOffset) and mouseY < ((buttonArray[i][3]+buttonArray[i][5])*screenYOffset) then
				buttonArray[i][9] = true
					if love.mouse.isDown(1) == true then
						buttonArray[i][10] = true
					else buttonArray[i][10] = false end

			else buttonArray[i][9] = false end
		end
	end
end

function menu.callPressMethods()
	if buttonNum > 0 then

			for i = 1, buttonNum do

				if buttonArray[i][9] == true then

					_G[buttonArray[i][11]](i)

				else menu.restoreButtonState(i) end
				if buttonArray[i][10] == true then

					_G[buttonArray[i][12]]()

				end
			end
		end

end

function menu.setupMainMenu()

	menu.newButton("Exit Fullscreen", 1700, 0, 200, 50, 255, 0, 0, "standardButtonHover", "exitFullscreen")

end

function standardButtonHover(buttonID)


	--buttonArray[buttonID][6] = 0
	--buttonArray[buttonID][7] = 0
	--buttonArray[buttonID][8] = 0
end

function exitFullscreen()

	love.window.setFullscreen(false, "desktop")

end

function menu.restoreButtonState(buttonID)

	--buttonArray

end
