local player = game.Players.LocalPlayer
local ui = Instance.new("ScreenGui")
ui.Parent = player.PlayerGui

-- Estilo da GUI
local style = {
    backgroundColor = Color3.fromRGB(30, 30, 30), -- Fundo escuro
    titleColor = Color3.fromRGB(255, 255, 255), -- Branco
    textColor = Color3.fromRGB(200, 200, 200), -- Cinza claro
    buttonColor = Color3.fromRGB(0, 0, 255), -- Azul
    buttonTextColor = Color3.fromRGB(255, 255, 255), -- Branco
}

-- Função para criar um estilo de botão
local function createButton(text, yPos, onClick)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 50)
    button.Position = UDim2.new(0.5, -75, 0, yPos)
    button.BackgroundColor3 = style.buttonColor
    button.TextColor3 = style.buttonTextColor
    button.TextSize = 20
    button.Text = text
    button.Parent = ui
    button.MouseButton1Click:Connect(onClick)
    return button
end

-- Função para criar uma linha entre dois pontos
local function drawLine(point1, point2, color)
    local distance = (point1 - point2).magnitude
    local midpoint = (point1 + point2) / 2

    local line = Instance.new("Part")
    line.Anchored = true
    line.Position = midpoint
    line.Size = Vector3.new(distance, 0.1, 0.1)
    line.BrickColor = color
    line.Parent = game.Workspace
end

-- Função para criar uma caixa de seleção em volta de um objeto
local function createSelectionBox(object)
    local box = Instance.new("SelectionBox")
    box.Adornee = object
    box.Color3 = Color3.new(1, 0, 0) -- Vermelho
    box.Parent = object
    return box
end

-- Função ESP atualizada
local function ESP()
    for _, player1 in ipairs(game.Players:GetPlayers()) do
        for _, player2 in ipairs(game.Players:GetPlayers()) do
            if player1 ~= player2 then
                local distance = (player1.Character.HumanoidRootPart.Position - player2.Character.HumanoidRootPart.Position).magnitude
                if distance <= 100 then -- Apenas desenha linhas e caixas se os jogadores estiverem dentro de 100 studs
                    drawLine(player1.Character.HumanoidRootPart.Position, player2.Character.HumanoidRootPart.Position, BrickColor.new("Bright red"))
                    createSelectionBox(player1.Character.HumanoidRootPart)
                    createSelectionBox(player2.Character.HumanoidRootPart)
                    print(player1.Name .. " e " .. player2.Name .. " estão a " .. distance .. " studs de distância.")
                end
            end
        end
    end
end

-- Função principal para atualizar o ESP
local function updateESP()
    ESP()
    wait(1) -- Atualiza a cada segundo
end

-- Opções de menu
local espEnabled = false
local flyEnabled = false

-- Funções para ativar/desativar ESP e voar
local function toggleESP()
    espEnabled = not espEnabled
    print("ESP ativado: " .. tostring(espEnabled))
end

local function toggleFly()
    flyEnabled = not flyEnabled
    print("Voar ativado: " .. tostring(flyEnabled))
end

-- Criar botões de menu
local espButton = createButton("ESP", 0, toggleESP)
local flyButton = createButton("Voar", 60, toggleFly)

-- Loop principal
while true do
    if espEnabled then
        updateESP()
    end
    wait(1)
end
