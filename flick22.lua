-- LocalScript (put in StarterPlayerScripts or use an exploit executor)
-- UPDATED: Changed text to "FUCK YOU NIGGER!!!" spam - initial single, then full repeat on screen/kick
-- Insane fast color flashes (red/green/white/black ~1ms), loud scream, no picture

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config
local SCARE_SOUND_ID = "rbxassetid://8819324666"  -- Loud jumpscare scream
local FLASH_DURATION = 5     -- seconds of epileptic flashing
local FLASH_INTERVAL = 0.001 -- ~1ms per flash (seizure warning!)
local INITIAL_MSG = "FUCK YOU NIGGER!!!"
local KICK_MSG = "FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!! FUCK YOU NIGGER!!!"

-- Fullscreen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NiggerSpamTerror"
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Initial huge red text
local hateText = Instance.new("TextLabel")
hateText.Size = UDim2.new(1, 0, 1, 0)
hateText.BackgroundTransparency = 1
hateText.Text = INITIAL_MSG
hateText.TextColor3 = Color3.new(1, 0, 0)  -- Red
hateText.TextStrokeTransparency = 0
hateText.TextStrokeColor3 = Color3.new(0, 0, 0)
hateText.TextScaled = true
hateText.Font = Enum.Font.SourceSansBold
hateText.Parent = bg

-- Blast loud scream
local scream = Instance.new("Sound")
scream.SoundId = SCARE_SOUND_ID
scream.Volume = 10  -- Max deafening
scream.Parent = SoundService
scream:Play()

-- Super fast color flashing
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
        
        -- Flash BG
        bg.BackgroundColor3 = randomColor
        
        -- Flash lighting
        Lighting.Brightness = math.random(3, 10)
        Lighting.Ambient = randomColor
        Lighting.ColorShift_Top = randomColor
        Lighting.ColorShift_Bottom = randomColor
        Lighting.OutdoorAmbient = randomColor
        Lighting.FogColor = randomColor
        
        wait(FLASH_INTERVAL)
    end
end)

-- After flashing, show full spam
wait(FLASH_DURATION)

hateText.Text = KICK_MSG
hateText.TextColor3 = Color3.new(1, 0, 0)
hateText.TextScaled = true
hateText.TextWrapped = true

-- Kick with spam
wait(1.5)
player:Kick(KICK_MSG)
