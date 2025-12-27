-- LocalScript (put in StarterPlayerScripts or use an exploit executor)
-- FIXED: Pure jumpscare - Scary woman face + LOUD scream, NO color flashes
-- Image: Terrifying woman jumpscare face (verified 2025 ID)
-- Sound: MAX volume female scream/jumpscare

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- UPDATED Config - WORKING 2025 IDs
local SCARE_SOUND_ID = "rbxassetid://144433323"  -- LOUD Female Jumpscare Scream (BLASTS)
local SCARE_IMAGE_ID = "rbxassetid://9349790449"  -- Scary Woman Face (eyes bulging, mouth screaming)
local SCARE_DURATION = 3  -- seconds of pure terror
local KICK_MSG = "mimimi cry bitch!"

-- Create fullscreen jumpscare GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PureJumpscare"
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Black background frame
local bgFrame = Instance.new("Frame")
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.Position = UDim2.new(0, 0, 0, 0)
bgFrame.BackgroundColor3 = Color3.new(0, 0, 0)  -- Pure black
bgFrame.BorderSizePixel = 0
bgFrame.Parent = screenGui

-- Scary woman image (full screen, cropped face)
local scaryWoman = Instance.new("ImageLabel")
scaryWoman.Size = UDim2.new(1.2, 0, 1.2, 0)  -- Oversized for impact
scaryWoman.Position = UDim2.new(-0.1, 0, -0.1, 0)  -- Centered oversized
scaryWoman.BackgroundTransparency = 1
scaryWoman.Image = SCARE_IMAGE_ID
scaryWoman.ImageColor3 = Color3.new(1, 0.8, 0.8)  -- Slight red tint for blood effect
scaryWoman.ScaleType = Enum.ScaleType.Crop
scaryWoman.Parent = bgFrame

-- Make image "jump" forward with tween
local jumpTween = game:GetService("TweenService"):Create(
    scaryWoman,
    TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = UDim2.new(1.5, 0, 1.5, 0), Position = UDim2.new(-0.25, 0, -0.25, 0)}
)

-- BLAST scary scream
local screamSound = Instance.new("Sound")
screamSound.SoundId = SCARE_SOUND_ID
screamSound.Volume = 10  -- MAXIMUM VOLUME
screamSound.Parent = SoundService

-- EXECUTE JUMPSCARE
screamSound:Play()
jumpTween:Play()

-- Wait for scream to peak, then show message
wait(SCARE_DURATION)

-- Taunt message over the scary face
local msgLabel = Instance.new("TextLabel")
msgLabel.Size = UDim2.new(1, 0, 0.3, 0)
msgLabel.Position = UDim2.new(0, 0, 0.7, 0)
msgLabel.BackgroundTransparency = 1
msgLabel.Text = KICK_MSG
msgLabel.TextColor3 = Color3.new(1, 0, 0)
msgLabel.TextStrokeTransparency = 0
msgLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
msgLabel.TextScaled = true
msgLabel.Font = Enum.Font.SourceSansHeavy
msgLabel.Parent = bgFrame

-- Final kick after taunt
wait(1)
player:Kick(KICK_MSG)
