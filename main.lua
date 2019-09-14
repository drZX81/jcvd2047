require('loadfilter')
require('coll')
require ('game')
require('ply')
require('shaders')
--trabiboy was here
msg='welcome'

drawfunc=nil

updatefunc=nil


function love.load()
	love.window.setMode(640,480)
	-- ship = love.graphics.newImage('ship.png')
	-- ply={x=100,y=100}

	-- gos={}
	-- e1={x=200,y=0}
	-- table.insert(gos,e1)
	-- e2={x=400,y=0}
	-- table.insert(gos,e2)
--	modification 
	initgame()

end


function love.update(dt)

	updatefunc()
	
	-- if love.keyboard.isDown('left') then
		-- ply.x=ply.x-1
	-- end
	-- if love.keyboard.isDown('right') then
		-- ply.x=ply.x+1
	-- end



end


function love.draw()
	-- love.graphics.setShader(halve)

	drawgame()
	
	-- love.graphics.setShader()
	
	-- love.graphics.print('test greg')
	
	-- for i,e in ipairs (gos)
	-- do
		-- love.graphics.draw(ship,e.x,e.y)
	
	-- end
	
	
	-- love.graphics.draw(ship,ply.x,ply.y)
end
