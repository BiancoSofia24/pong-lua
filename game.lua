-- Archivo 3
Game = Object:extend()

function Game:new()
	self.barraIzq = Barra()
	self.barraIzq.keyUp = "w"
	self.barraIzq.keyDown = "s"

	self.barraDer = Barra()
	self.barraDer.x = 740

	self.pelota = Pelota()

	self.puntuacionIzq = 0
	self.puntuacionDer = 0
end

function Game:update(dt)
	self.barraIzq:update(dt)
	self.barraDer:update(dt)
	self.pelota:update(dt)
	self.pelota:limites(self.barraDer)
	self.pelota:limites(self.barraIzq)

	local estadoPelota = self.pelota:fueraDeLimites()
	if estadoPelota == "izq" then 
		self.puntuacionDer = self.puntuacionDer + 1
		self.pelota = Pelota()
	elseif estadoPelota == "der" then 
		self.puntuacionIzq = self.puntuacionIzq +1
		self.pelota = Pelota()
	end
end

function Game:draw()
	--línea divisora
	for i=1,10 do
		love.graphics.rectangle("fill", 390, 80 * i, 10, 40)
	end

	self.barraIzq:draw()
	self.barraDer:draw()
	self.pelota:draw()

	-- puntuaciones
	love.graphics.print(self.puntuacionDer .. " - " .. self.puntuacionIzq, 350, 20, 0, 3, 3)
end	
