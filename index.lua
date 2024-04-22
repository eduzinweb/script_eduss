-- Função para calcular a distância entre duas pessoas
function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

-- Função ESP
function ESP(person1, person2, lineColor)
    -- Desenhar linha entre as pessoas
    love.graphics.setColor(lineColor)
    love.graphics.line(person1.x, person1.y, person2.x, person2.y)

    -- Calcular distância entre as pessoas
    local dist = distance(person1.x, person1.y, person2.x, person2.y)

    -- Exibir a distância
    love.graphics.setColor(255, 255, 255) -- Branco
    love.graphics.print("Distância: " .. dist, 10, 10)
end

-- Mensagem no Roblox
function enviarMensagemRoblox(mensagem)
    -- Código para enviar mensagem no Roblox
    print("Mensagem enviada no Roblox: " .. mensagem)
end

function love.load()
    -- Posições das pessoas
    person1 = { x = 100, y = 100 }
    person2 = { x = 300, y = 200 }

    -- Cor da linha
    lineColor = {255, 255, 0} -- Amarelo

    -- Executar função ESP
    ESP(person1, person2, lineColor)

    -- Enviar mensagem no Roblox
    enviarMensagemRoblox("Executando...")
end

function love.draw()
    -- Desenhar linha entre as pessoas
    ESP(person1, person2, lineColor)
end
