
local punch={
	x=32,
	y=0,
	w=64,
	h=64
}

function initplayer()

	ply={x=100,y=groundy-128,w=64,h=128}
	towalkstate(ply)

end

function towalkstate(ply)
	msg='walk'
	ply.bfunc=plywalk
	ply.dfunc=dwalk
end

function plywalk()

	if love.keyboard.isDown('left') then
		ply.x=ply.x-1
	end
	if love.keyboard.isDown('right') then
		ply.x=ply.x+1
	end

	if love.keyboard.isDown('space') then
		topunchstate(ply)
	end


end


function dwalk()
	love.graphics.setColor(0.0,1.0,0.0,1.0)
	love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)


end



-- we just wait before going back to walk

function dpunch()
	love.graphics.setColor(0.0,1.0,0.0,1.0)
	love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)
	love.graphics.setColor(1.0,0.0,0.0,1.0)
	love.graphics.rectangle('fill',ply.x+ply.w/2+punch.x,ply.y+punch.y,punch.w,punch.h)

end

function topunchstate()
	msg=' punch state '
	ply.bfunc=plypunch
	ply.dfunc=dpunch
	ply.timer=60
end

function plypunch()
	ply.timer=ply.timer-1
	if ply.timer<1 then
		towalkstate(ply)
	end

--see if any ennemy is hit
	for i,e in ipairs (gos)
	do
		if coll(ply.x+ply.w/2+punch.x,ply.y+punch.y,punch.w,punch.h,e.x,e.y,e.w,e.h) then
			msg='hit'
		end
		-- love.graphics.setColor(0.0,1.0,0.0,1.0)
		-- love.graphics.rectangle('fill',e.x,e.y,e.w,e.h)
		-- love.graphics.draw(ship,e.x,e.y)
	
	end
	


end