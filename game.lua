



function initgame()
	
	groundy=440
	
	ground={x=0,y=groundy,w=640,h=40}
	
	-- ship = love.graphics.newImage('ship.png')
	-- ply={x=100,y=groundy-128,w=64,h=128}

	initplayer()

	gos={}
	e1={x=200,y=groundy-128,w=64,h=128}
	table.insert(gos,e1)
	e2={x=400,y=groundy-128,w=64,h=128}
	table.insert(gos,e2)

	drawfunc=drawgame
	updatefunc=updategame
end



function drawgame()
	
	
	
	
	love.graphics.print(msg)
	
	--ground
	love.graphics.setColor(0.0,0.0,1.0,1.0)
	love.graphics.rectangle('fill',ground.x,ground.y,ground.w,ground.h)
	
	
	for i,e in ipairs (gos)
	do
		
		love.graphics.setColor(0.0,1.0,0.0,1.0)
		love.graphics.rectangle('fill',e.x,e.y,e.w,e.h)
		-- love.graphics.draw(ship,e.x,e.y)
	
	end
	
	-- love.graphics.setColor(0.0,1.0,0.0,1.0)
	-- love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)
	ply.dfunc(ply)
	
	-- love.graphics.draw(ship,ply.x,ply.y)

end


function updategame()

	ply.bfunc(ply)


end