local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local flyEnabled = false
local flyDebounce = false

local function toggleFly()
    if flyDebounce then return end
    flyDebounce = true
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        humanoid.PlatformStand = true
        humanoid.AutoRotate = false
        humanoid.Sit = true
    else
        humanoid.PlatformStand = false
        humanoid.AutoRotate = true
        humanoid.Sit = false
    end
    
    wait(0.5)
    flyDebounce = false
end

local function collectChests()
    local chests = game.Workspace:GetChildren()
    
    for _, chest in ipairs(chests) do
        if chest.Name == "Chest" and chest:FindFirstChild("ClickDetector") then
            humanoid:MoveTo(chest.Position)
            wait(1)
            if (character:FindFirstChild("Backpack"):FindFirstChild("Chest")) then
                print("Já coletou este baú!")
            else
                chest.ClickDetector:Click()
                print("Baú coletado!")
            end
        end
    end
end

humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
    if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
        local now = tick()
        if now - (lastJump or 0) <= 0.5 then
            toggleFly()
        end
        lastJump = now
    end
end)

while true do
    collectChests()
    wait(5)
end
