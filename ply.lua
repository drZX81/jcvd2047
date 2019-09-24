local plyframes={
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



local plypunch={
	x=32,
	y=0,
	w=64,
	h=64
}





local function plywalk()

	if love.keyboard.isDown('left') then
		ply.x=ply.x-1
	end
	if love.keyboard.isDown('right') then
		ply.x=ply.x+1
	end

	if love.keyboard.isDown('space') then
		plytopunchstate(ply)
	end

	if love.keyboard.isDown('up') then
		plytotrans('u')
	end

	if love.keyboard.isDown('down') then
		plytotrans('d')
	end


end


local function dplywalk()
	love.graphics.draw(plyframes.right[a4step].pic,ply.x,ply.y)
	love.graphics.setColor(0.0,1.0,0.0,0.5)
	love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)


end

local function plytowalkstate(ply)
	msg='walk'
	ply.bfunc=plywalk
	ply.dfunc=dplywalk
end


--extern interface
function initplayer()

	ply={x=100,y=groundy-128,w=64,h=128}
	plytowalkstate(ply)

end

-- we just wait before going back to walk

local function dplypunch()
	love.graphics.setColor(0.0,1.0,0.0,.5)
	love.graphics.rectangle('fill',ply.x,ply.y,ply.w,ply.h)
	love.graphics.setColor(1.0,0.0,0.0,.5)
	love.graphics.rectangle('fill',ply.x+ply.w/2+plypunch.x,ply.y+plypunch.y,plypunch.w,plypunch.h)
	love.graphics.draw(plyframes.pright[1].pic,ply.x,ply.y)
end

local function updplypunch()
	ply.timer=ply.timer-1
	if ply.timer<1 then
		plytowalkstate(ply)
	end

--see if any ennemy is hit
	for i,e in ipairs (gos)
	do
		if coll(ply.x+ply.w/2+plypunch.x,ply.y+plypunch.y,plypunch.w,plypunch.h,e.x,e.y,e.w,e.h) then
			msg='hit'
		end
		-- love.graphics.setColor(0.0,1.0,0.0,1.0)
		-- love.graphics.rectangle('fill',e.x,e.y,e.w,e.h)
		-- love.graphics.draw(ship,e.x,e.y)
	
	end
end


 function plytopunchstate()
	msg=' punch state '
	ply.bfunc=updplypunch
	ply.dfunc=dplypunch
	ply.timer=60
end


-- transition to upper or inferior level
local tdir=nil
function plytotrans(lvl)
	tdir=lvl
	ply.bfunc=plyupdtrans
	ply.dfunc=dplytrans
	
end

function dplytrans()
	love.graphics.draw(plyframes.left[1].pic,ply.x,ply.y)
end

function plyupdtrans()
	if tdir=='u' then 
		ply.y=ply.y-3
		if ply.y+128<=upperlevel.y then
			ply.y=upperlevel.y-128
			plytowalkstate(ply)
		end
	elseif tdir=='d' then 
		ply.y=ply.y+3
		if ply.y+128>=ground.y then
			ply.y=ground.y-128
			plytowalkstate(ply)
		end
		
	end
end	


