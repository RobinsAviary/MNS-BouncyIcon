pos = Vec2.Zero
spd = 100;
dir = Vec2.New(1,1)
texSize = Vec2.Zero
winSize = Vec2.Zero
randSpot = false

function Init()
	Texture.Load("logo", "icon.png")
	Audio.Load("blip", "blip.wav")
	Sound.Create("blip", "blip")
	Sound.SetVolume("blip", .1)
	texSize = Texture.Size("logo")
	SetAntialiasingLevel(16)
end

function Update()
	local winSize = Window.Size()

	if (not randSpot) then
		pos = Vec2.New(math.random(0, winSize.x - texSize.x), math.random(0, winSize.y - texSize.y))
		randSpot = true
	end

	Draw.Clear(Color.Black)
	
	pos = pos + (dir * Vec2.NewS(spd) * Vec2.NewS(Delta()))

	

	local lowerBound = winSize.y - texSize.y
	local rightBound = winSize.x - texSize.x

	function playBlip()
		Sound.Play("blip")
	end

	if pos.x < 0 then
		pos.x = 0
		dir.x = dir.x * -1
		playBlip()
	end

	if pos.y < 0 then
		pos.y = 0
		dir.y = dir.y * -1
		playBlip()
	end

	if pos.x > rightBound then
		pos.x = rightBound
		dir.x = dir.x * -1
		playBlip()
	end

	if pos.y > lowerBound then
		pos.y = lowerBound
		dir.y = dir.y * -1
		playBlip()
	end

	Draw.Texture("logo", pos)
end