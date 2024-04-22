-- Criar UI e botão
local player = game.Players.LocalPlayer
local ui = Instance.new("ScreenGui")
ui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
frame.BorderSizePixel = 2
frame.Parent = ui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho
button.BorderSizePixel = 2
button.Text = "Clique Aqui"
button.Parent = frame

local buttonColor = button.BackgroundColor3

-- Função para alternar a cor do botão
local function alternarCor()
    if buttonColor == Color3.fromRGB(255, 0, 0) then
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde
        buttonColor = Color3.fromRGB(0, 255, 0)
    else
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho
        buttonColor = Color3.fromRGB(255, 0, 0)
    end
end

button.MouseButton1Click:Connect(alternarCor)
