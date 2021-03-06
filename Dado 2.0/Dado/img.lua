require('gd')
function loadPhoto(name,t)
	local phto = {}
	local ce = {}
	local n = 0
	local gde
	if not t then
		gde= gd.createFromGif(name)
	else
		gde= gd.createFromPng(name)
	end
	for x=1,gde:sizeX()+1 do
		for y=1,gde:sizeY()+1 do
			if not phto[(y-1)] then phto[(y-1)] = {} end
			if not phto[(y-1)][(x-1)] then phto[(y-1)][(x-1)] = {} end
			local p = gde:getPixel(x-2, y-2)
			if  (gde:red(p) == 255 and gde:blue(p) ==255 and gde:green(p) == 255) then
				phto[(y-1)][(x-1)] = 0
			else
				local r, b, g = gde:red(p), gde:blue(p), gde:green(p)
				local clr  = r..' '..b..' '..g
				local go = true
				for i,b in pairs(ce) do
					if b == clr then
						go = false
						phto[(y-1)][(x-1)] = i
						break
					end
				end
				if go then
					n = n+1
					ce[n] = clr
					phto[(y-1)][(x-1)] = n
				end
			end
		end
	end
	cs = nil
	return iup.image{colors = ce,hotspot = "1:1",unpack(phto)}
end
lbl = iup.label{title = "",image =loadPhoto('rpg.gif')}

img_cursor =loadPhoto('cursor.gif')

lbl = iup.label{title = "",image =loadPhoto('rpg.gif')}

buytut1 =loadPhoto('presshealth.png',true)
buytut2 =loadPhoto('presshealth2.png',true)

buytut21 =loadPhoto('presslvl.png',true)
buytut22 =loadPhoto('presslvl2.png',true)

buytut31 =loadPhoto('pressmana.png',true)
buytut32 =loadPhoto('pressmana2.png',true)
diced =loadPhoto('dice.png',true)
diced2 =loadPhoto('dice2.png',true)
diced3 =loadPhoto('dice3.png',true)
--,
