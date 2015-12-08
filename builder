os.loadAPI("builder/turtle_manager")
os.loadAPI("builder/canvas")

block= "minecraft:cobblestone"

tm= turtle_manager.TurtleManager.new()
c = canvas.Canvas.new(2, 2, 10)
c.writeFormFile(1,1,"builder/base")
c.set_layer(5)
c.writeFormFile(1,1,"builder/base")

tm.moveTo(0,0,0)

offzet_x= c.layer().w/2
offzet_y= -10

for k=1, c.limit_z() do

c.set_layer(k) 

	go= true
	l =c.layer()
	for i=1, l.w do
		if go then
			for j=1, l.h do
				if tonumber(l[l.h-j+1][i]) ~= 0 then
					tm.moveTo(i-offzet_x,j,k+offzet_y-1)
					tm.putBlock(block)
				end
			end
			go= false
		else
			for j=l.h, 1, -1  do
				if tonumber(l[l.h-j+1][i]) ~= 0 then
					tm.moveTo(i-offzet_x,j,k+offzet_y-1)
					tm.putBlock(block)
				end
			end
			go= true
		end
	end

end


tm.returnToOutpost()



