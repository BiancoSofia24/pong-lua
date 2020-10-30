-- Archivo 2
Barra = Entidad:extend()

function Barra:new()
	Barra.super.new(self, 50, 100, 10, 80)
	self.keyUp = "up"
	self.keyDown = "down"
end

function Barra:update(dt)
	local up = love.keyboard.isDown(self.keyUp)
	local down = love.keyboard.isDown(self.keyDown)
	if up then 
		-- mover hacia arriba
		self.ySpeed = -400
	elseif down then
		-- mover hacia abajo
		self.ySpeed = 400
	else
		-- mientras no presiono ninguna tecla
		self.ySpeed = 0
	end

	Barra.super.update(self, dt)
end

-- no es necesario draw dado que esta dentro de entidad.lua