local player = game.Players.LocalPlayer
local ui = Instance.new("ScreenGui")
ui.Parent = player.PlayerGui

-- Botão de menu
local menuButton = Instance.new("TextButton")
menuButton.Size = UDim2.new(0, 50, 0, 50)
menuButton.Position = UDim2.new(0.9, 0, 0, 0)
menuButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Azul
menuButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Branco
menuButton.TextSize = 20
menuButton.Text = "☰"
menuButton.Parent = ui

-- Frame principal do menu
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 200)
mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
mainFrame.BorderSizePixel = 2
mainFrame.Visible = false
mainFrame.Parent = ui

-- Título do menu
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Preto
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Branco
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Text = "Script By eduzinweb"
title.Parent = mainFrame

-- Função para alternar entre o menu maximizado e minimizado
local function toggleMenu()
    mainFrame.Visible = not mainFrame.Visible
end

menuButton.MouseButton1Click:Connect(toggleMenu)

-- Função para criar uma opção de menu
local function createMenuOption(name, yPos, func)
    local optionFrame = Instance.new("Frame")
    optionFrame.Size = UDim2.new(1, 0, 0, 40)
    optionFrame.Position = UDim2.new(0, 0, 0, yPos)
    optionFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Cinza
    optionFrame.Parent = mainFrame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.Position = UDim2.new(0, 5, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Branco
    nameLabel.TextSize = 18
    nameLabel.Text = name
    nameLabel.Parent = optionFrame

    local switch = Instance.new("TextButton")
    switch.Size = UDim2.new(0, 60, 0, 30)
    switch.Position = UDim2.new(1, -70, 0.5, -15)
    switch.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
    switch.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
    switch.TextSize = 18
    switch.Text = "Off"
    switch.Parent = optionFrame

    switch.MouseButton1Click:Connect(function()
        if switch.Text == "Off" then
            switch.Text = "On"
            func(true)
        else
            switch.Text = "Off"
            func(false)
        end
    end)
end

-- Função ESP
local function ESP(player1, player2)
    local distance = (player1.Position - player2.Position).magnitude
    local midpoint = (player1.Position + player2.Position) / 2
    
    -- Desenhar linha vermelha
    local line = Instance.new("Part")
    line.Anchored = true
    line.Position = midpoint
    line.Size = Vector3.new(distance, 0.1, 0.1)
    line.BrickColor = BrickColor.new("Bright red")
    line.Parent = game.Workspace
    
    -- Desenhar caixas delimitadoras
    local box1 = Instance.new("SelectionBox")
    box1.Adornee = player1
    box1.Color3 = Color3.new(1, 0, 0) -- Vermelho
    box1.Parent = player1
    
    local box2 = Instance.new("SelectionBox")
    box2.Adornee = player2
    box2.Color3 = Color3.new(1, 0, 0) -- Vermelho
    box2.Parent = player2
    
    -- Mostrar distância
    print("Distância entre os jogadores: " .. distance .. " metros")
end

-- Função para ativar/desativar ESP
local espEnabled = false

local function toggleESP(enabled)
    espEnabled = enabled
    print("ESP ativado: " .. tostring(espEnabled))
end

-- Criar opção de ESP no menu
createMenuOption("Esp Script", 50, toggleESP)

-- Função principal do ESP
local function mainESP()
    if not espEnabled then
        return
    end
    
    for _, player1 in ipairs(game.Players:GetPlayers()) do
        for _, player2 in ipairs(game.Players:GetPlayers()) do
            if player1 ~= player2 then
                ESP(player1.Character.HumanoidRootPart, player2.Character.HumanoidRootPart)
            end
        end
    end
end

-- Loop principal para executar o ESP
while true do
    mainESP()
    wait(1)
end

-- Opção de voar
local canFly = false

-- Função para ativar/desativar voar
local function toggleFly(enabled)
    canFly = enabled
    print("Voar ativado: " .. tostring(canFly))
end

-- Criar opção de voar no menu
createMenuOption("Voar", 100, toggleFly)

-- Função principal para voar
game:GetService("UserInputService").JumpRequest:Connect(function()
    if canFly then
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Physics)
    end
end)
