-- Archivo 1
Entidad = Object:extend()

function Entidad:new(x, y, width, height)
	-- posicion
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.xSpeed = 0
	self.ySpeed = 0
end

function Entidad:update(dt)
	-- moviemiento 
	self.x = self.x + self.xSpeed * dt 
	self.y = self.y + self.ySpeed * dt

	if self.y <= 0 then
		self.y = 0
		self.ySpeed = -self.ySpeed
	elseif self.y + self.height >= 600 then
		self.y = 600 -self.height
		self.ySpeed = -self.ySpeed
	end
end

function Entidad:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end