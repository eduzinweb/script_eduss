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

-- Checkbox para ativar/desativar ESP
local espCheckbox = Instance.new("TextButton")
espCheckbox.Size = UDim2.new(0, 20, 0, 20)
espCheckbox.Position = UDim2.new(0, 10, 0, 50)
espCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
espCheckbox.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
espCheckbox.Text = ""
espCheckbox.Parent = mainFrame

-- Texto da checkbox do ESP
local espText = Instance.new("TextLabel")
espText.Size = UDim2.new(0, 100, 0, 20)
espText.Position = UDim2.new(0, 40, 0, 50)
espText.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
espText.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
espText.TextSize = 18
espText.Text = "Esp Script"
espText.Parent = mainFrame

-- Checkbox para ativar/desativar voar
local flyCheckbox = Instance.new("TextButton")
flyCheckbox.Size = UDim2.new(0, 20, 0, 20)
flyCheckbox.Position = UDim2.new(0, 10, 0, 100)
flyCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
flyCheckbox.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
flyCheckbox.Text = ""
flyCheckbox.Parent = mainFrame

-- Texto da checkbox de voar
local flyText = Instance.new("TextLabel")
flyText.Size = UDim2.new(0, 100, 0, 20)
flyText.Position = UDim2.new(0, 40, 0, 100)
flyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
flyText.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
flyText.TextSize = 18
flyText.Text = "Voar"
flyText.Parent = mainFrame

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

local function toggleESP()
    espEnabled = not espEnabled
    print("ESP ativado: " .. tostring(espEnabled))
end

-- Conectar a checkbox com a função de ativar/desativar ESP
espCheckbox.MouseButton1Click:Connect(toggleESP)

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
local function toggleFly()
    canFly = not canFly
    print("Voar ativado: " .. tostring(canFly))
end

-- Conectar o botão de voar com a função de ativar/desativar voar
flyCheckbox.MouseButton1Click:Connect(toggleFly)

-- Função principal para voar
game:GetService("UserInputService").JumpRequest:Connect(function()
    if canFly then
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Physics)
    end
end)
