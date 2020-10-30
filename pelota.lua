-- Archivo 4
Pelota = Entidad:extend()

function Pelota:new()
	Pelota.super.new(self, 400, 300, 15, 15)
	self.ySpeed = -500
	-- movimiento aleatorio de la pelota
	if math.random(1, 2) == 1 then 
		self.xSpeed = 400
	else 
	 	self.xSpeed = -400
	end

	-- pausa antes de moverse
	self.tiempo = 1
end

function Pelota:update(dt)
	if self.tiempo > 0 then 
		self.tiempo = self.tiempo - dt 
	else
		Pelota.super.update(self, dt)
	end
end

function Pelota:limites(e)
	local izq1 = self.x
	local der1 = self.x + self.width
	local arriba1 = self.y 
	local abajo1 = self.y + self.height 

	local izq2 = e.x
	local der2 = e.x + e.width
	local arriba2 = e.y 
	local abajo2 = e.y + e.height 

	if izq1 < der2 and der1 > izq2 
				   and arriba1 < abajo2
				   and abajo1 > arriba2 then 
		self.xSpeed = - self.xSpeed
	end
end

function Pelota:fueraDeLimites()
	if self.x - self.width < 0 then
		return "izq" 
	elseif self.x > 800 then 
		return "der"
	else 
		return "falso"
	end
end
-- no es necesario draw dado que esta dentro de entidad.lua