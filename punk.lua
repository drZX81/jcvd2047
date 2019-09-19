punkframes={
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

	punk={x=100,y=groundy-128,w=64,h=128}
	towalkstate(punk)

end

function towalkstate(punk)
	msg='walk'
	punk.bfunc=punkwalk
	punk.dfunc=dwalk
end

function punkwalk()

	if love.keyboard.isDown('left') then
		punk.x=punk.x-1
	end
	if love.keyboard.isDown('right') then
		punk.x=punk.x+1
	end

	if love.keyboard.isDown('space') then
		topunchstate(punk)
	end

	if love.keyboard.isDown('up') then
		totrans('u')
	end

	if love.keyboard.isDown('down') then
		totrans('d')
	end


end


function dwalk()
	love.graphics.draw(punkframes.right[a4step].pic,punk.x,punk.y)
	love.graphics.setColor(0.0,1.0,0.0,0.5)
	love.graphics.rectangle('fill',punk.x,punk.y,punk.w,punk.h)


end



-- we just wait before going back to walk

function dpunch()
	love.graphics.setColor(0.0,1.0,0.0,.5)
	love.graphics.rectangle('fill',punk.x,punk.y,punk.w,punk.h)
	love.graphics.setColor(1.0,0.0,0.0,.5)
	love.graphics.rectangle('fill',punk.x+punk.w/2+punch.x,punk.y+punch.y,punch.w,punch.h)
	love.graphics.draw(punkframes.pright[1].pic,punk.x,punk.y)
end

function topunchstate()
	msg=' punch state '
	punk.bfunc=punkpunch
	punk.dfunc=dpunch
	punk.timer=60
end

function punkpunch()
	punk.timer=punk.timer-1
	if punk.timer<1 then
		towalkstate(punk)
	end

--see if any ennemy is hit
	-- for i,e in ipairs (gos)
	-- do
		-- if coll(ply.x+ply.w/2+punch.x,ply.y+punch.y,punch.w,punch.h,e.x,e.y,e.w,e.h) then
			-- msg='hit'
		-- end
		-- -- love.graphics.setColor(0.0,1.0,0.0,1.0)
		-- -- love.graphics.rectangle('fill',e.x,e.y,e.w,e.h)
		-- -- love.graphics.draw(ship,e.x,e.y)
	
	-- end
end

-- transition to upper or inferior level
local tdir=nil
function totrans(lvl)
	tdir=lvl
	punk.bfunc=updtrans
	punk.dfunc=dtrans
	
end

function dtrans()
	love.graphics.draw(punkframes.left[1].pic,punk.x,punk.y)
end

function updtrans()
	if tdir=='u' then 
		punk.y=punk.y-3
		if punk.y+128<=upperlevel.y then
			punk.y=upperlevel.y-128
			towalkstate(punk)
		end
	elseif tdir=='d' then 
		punk.y=punk.y+3
		if punk.y+128>=ground.y then
			punk.y=ground.y-128
			towalkstate(punk)
		end
		
	end
end	


