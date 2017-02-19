menu = {}

require "images"


function menu.load()

	buttonArray = {}
	--	buttonArray[buttonNum] = {text, x, y, width, height, r, b, g, isHoveredOver, isPressed)

	buttonNum = 0
	buttonOffsetX, buttonOffsetY = 4, 30

end

function menu.draw(screenXOffset, screenYOffset)

	menu.drawButtons(screenXOffset, screenYOffset)

end

function love.update()

	

end

function menu.newButton(text, x, y, width, height, r, b, g)

	buttonArray[buttonNum+1] = {text, x, y, width, height, r, b, g, false, false}
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