plyframes={
	-- up={
		-- loadfilter("ply/up1.png"),
		-- loadfilter("ply/up2.png"),
		-- loadfilter("ply/up3.png")
	-- },
	-- down={
		-- loadfilter("ply/down1.png"),
		-- loadfilter("ply/down2.png"),
		-- loadfilter("ply/down3.png")	
	-- },
	left={
		loadfilter("ply/left1.png"),
		loadfilter("ply/left2.png"),
		loadfilter("ply/left3.png"),
		loadfilter("ply/left2.png"),
		
	},
	right={
		loadfilter("ply/right1.png"),
		loadfilter("ply/right2.png"),
		loadfilter("ply/right3.png"),
		loadfilter("ply/right2.png"),
	}	,
	pright={
		loadfilter("ply/pright1.png"),
		-- -- loadfilter("ply/right2.png"),
		-- -- loadfilter("ply/right3.png")
	}	,
	-- pleft={
		-- loadfilter("ply/pleft1.png"),
		-- -- loadfilter("ply/left2.png"),
		-- -- loadfilter("ply/left3.png")
		
	-- },
	-- sright={
		-- loadfilter("ply/sright1.png"),
		-- -- loadfilter("ply/right2.png"),
		-- -- loadfilter("ply/right3.png")
	-- }	,
	-- sleft={
		-- loadfilter("ply/sleft1.png"),
		-- -- loadfilter("ply/left2.png"),
		-- -- loadfilter("ply/left3.png")
		
	-- },
	-- dright={
		-- loadfilter("ply/dright1.png"),
		-- -- loadfilter("ply/right2.png"),
		-- -- loadfilter("ply/right3.png")
	-- }	,
	-- dleft={
		-- loadfilter("ply/dleft1.png"),
		-- -- loadfilter("ply/left2.png"),
		-- -- loadfilter("ply/left3.png")
		
	-- },
	
}



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

	if love.keyboard.isDown('up') then
		totrans('u')
	end

	if love.keyboard.isDown('down') then
		totrans('d')
	end


end


function dwalk()
	love.graphics.draw(plyframes.right[a4step].pic,ply.x,ply.y)
	love.graphics.setColor(0.0,1.0,0.0,0.5)
	love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)


end



-- we just wait before going back to walk

function dpunch()
	love.graphics.setColor(0.0,1.0,0.0,.5)
	love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)
	love.graphics.setColor(1.0,0.0,0.0,.5)
	love.graphics.rectangle('fill',ply.x+ply.w/2+punch.x,ply.y+punch.y,punch.w,punch.h)
	love.graphics.draw(plyframes.pright[1].pic,ply.x,ply.y)
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

-- transition to upper or inferior level
local tdir=nil
function totrans(lvl)
	tdir=lvl
	ply.bfunc=updtrans
	ply.dfunc=dtrans
	
end

function dtrans()
	love.graphics.draw(plyframes.left[1].pic,ply.x,ply.y)
end

function updtrans()
	if tdir=='u' then 
		ply.y=ply.y-3
		if ply.y+128<=upperlevel.y then
			ply.y=upperlevel.y-128
			towalkstate(ply)
		end
	elseif tdir=='d' then 
		ply.y=ply.y+3
		if ply.y+128>=ground.y then
			ply.y=ground.y-128
			towalkstate(ply)
		end
		
	end
end	


