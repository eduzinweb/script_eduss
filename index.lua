local player = game.Players.LocalPlayer
local ui = Instance.new("ScreenGui")
ui.Parent = player.PlayerGui

-- Mensagem de execução do script
local messageLabel = Instance.new("TextLabel")
messageLabel.Size = UDim2.new(0, 200, 0, 40)
messageLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
messageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
messageLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
messageLabel.TextSize = 20
messageLabel.Text = "Executando Script..."
messageLabel.Parent = ui

-- Esperar 5 segundos para mostrar o menu
wait(5)

-- Frame principal do menu
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
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

-- Botões de navegação
local menuButtons = {
    "Inicio",
    "Farm",
    "Teste"
}

local buttonY = 50
for i, buttonText in ipairs(menuButtons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.5, -10, 0, 30)
    button.Position = UDim2.new(0, 10, 0, buttonY)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Cinza
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Branco
    button.TextSize = 18
    button.Text = buttonText
    button.Parent = mainFrame

    buttonY = buttonY + 40
end

-- Botão de minimizar
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Branco
minimizeButton.Text = "X"
minimizeButton.Parent = title

-- Ícone de maximizar
local maximizeIcon = Instance.new("TextButton")
maximizeIcon.Size = UDim2.new(0, 30, 0, 30)
maximizeIcon.Position = UDim2.new(0, 0, 0, 0)
maximizeIcon.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde
maximizeIcon.TextColor3 = Color3.fromRGB(255, 255, 255) -- Branco
maximizeIcon.Text = "M"
maximizeIcon.Visible = false
maximizeIcon.Parent = title

-- Função para alternar entre o menu maximizado e minimizado
local function toggleMenu()
    mainFrame.Visible = not mainFrame.Visible
    maximizeIcon.Visible = not maximizeIcon.Visible
end

minimizeButton.MouseButton1Click:Connect(toggleMenu)
maximizeIcon.MouseButton1Click:Connect(toggleMenu)

-- Executando script
messageLabel.Visible = false

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

-- Checkbox para ativar/desativar ESP
local espCheckbox = Instance.new("TextButton")
espCheckbox.Size = UDim2.new(0, 20, 0, 20)
espCheckbox.Position = UDim2.new(0, 10, 0, 100)
espCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
espCheckbox.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
espCheckbox.Text = ""
espCheckbox.Parent = mainFrame

-- Texto da checkbox
local checkboxText = Instance.new("TextLabel")
checkboxText.Size = UDim2.new(0, 100, 0, 20)
checkboxText.Position = UDim2.new(0, 40, 0, 100)
checkboxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
checkboxText.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
checkboxText.TextSize = 18
checkboxText.Text = "Esp Script"
checkboxText.Parent = mainFrame

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
