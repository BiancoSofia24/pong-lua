function love.load()
	-- llamamos a las librerías y objetos(clases)
	Object = require "classic"
	require "game"
	require "entidad"
	require "barra"
	require "pelota"

	game = Game()

end

function love.update(dt)
	game:update(dt)
end

function love.draw()
	game:draw()
end

-- boton de reinicio
function love.keypressed(k)
	if k == "r" then
		love.load()
	end
end