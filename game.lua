

function tickanimstep()
	 animclk=animclk+1

	 if animclk>animchge then 
		animclk=0
		animstep=animstep+1
		if animstep>3 then
		 animstep=1
		end
		a4step=a4step+1
		if a4step>4 then
		 a4step=1
		end
		a5step=a5step+1
		if a5step>5 then
		 a5step=1
		end

	 end 
end


function initgame()
	
	animstep=1
	a5step=1
	a4step=1
	animclk=0
	animchge=10

	
	
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

	tickanimstep()


	ply.bfunc(ply)


end