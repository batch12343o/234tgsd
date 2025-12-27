-- LocalScript (put in StarterPlayerScripts or exploit executor)
-- UPDATED: No picture at all - instead instant "GOD IS COMING !" in red
-- Then insane fast color flashes (red, green, white, black) every ~1ms for 5 seconds
-- Loud scream + final spam kick message

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config
local SCARE_SOUND_ID = "rbxassetid://8819324666"  -- The loud jumpscare scream you liked
local FLASH_DURATION = 5     -- seconds of flashing madness
local FLASH_INTERVAL = 0.001 -- ~1ms per flash (as fast as Roblox allows, seizure warning!)
local INITIAL_MSG = "GOD IS COMING !"
local KICK_MSG = "GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING !"

-- Create fullscreen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GodIsComingTerror"
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Big red "GOD IS COMING !" text that appears instantly
local godText = Instance.new("TextLabel")
godText.Size = UDim2.new(1, 0, 1, 0)
godText.BackgroundTransparency = 1
godText.Text = INITIAL_MSG
godText.TextColor3 = Color3.new(1, 0, 0)  -- Pure red
godText.TextStrokeTransparency = 0
godText.TextStrokeColor3 = Color3.new(0, 0, 0)
godText.TextScaled = true
godText.Font = Enum.Font.SourceSansBold
godText.Parent = bg

-- Play the loud scream immediately
local scream = Instance.new("Sound")
scream.SoundId = SCARE_SOUND_ID
scream.Volume = 10  -- Deafening
scream.Parent = SoundService
scream:Play()

-- Insane fast color flashing loop
spawn(function()
    local colors = {
        Color3.new(1, 0, 0),    -- Red
        Color3.new(0, 1, 0),    -- Green
        Color3.new(1, 1, 1),    -- White
        Color3.new(0, 0, 0)     -- Black
    }
    
    local start = tick()
    while tick() - start < FLASH_DURATION do
        local randomColor = colors[math.random(1, #colors)]
        
        -- Flash background
        bg.BackgroundColor3 = randomColor
        
        -- Flash Lighting (global effect)
        Lighting.Brightness = math.random(3, 10)
        Lighting.Ambient = randomColor
        Lighting.ColorShift_Top = randomColor
        Lighting.ColorShift_Bottom = randomColor
        Lighting.OutdoorAmbient = randomColor
        Lighting.FogColor = randomColor
        
        wait(FLASH_INTERVAL)  -- as fast as possible (~1ms)
    end
end)

-- Hold the flashing terror
wait(FLASH_DURATION)

-- Final full-screen spam message
godText.Text = KICK_MSG
godText.TextColor3 = Color3.new(1, 0, 0)
godText.TextScaled = true
godText.TextWrapped = true

-- Kick after short delay
wait(1.5)
player:Kick(KICK_MSG)
