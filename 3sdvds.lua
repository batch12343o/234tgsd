-- LocalScript (put in StarterPlayerScripts or use an exploit executor)
-- UPDATED JUMPSCARE: LOUD scream + NEW SCARY DOG FACE picture
-- Pure sudden jumpscare - black screen, dog face jumps forward, scream blasts, then kick

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config - Working IDs (December 2025)
local SCARE_SOUND_ID = "rbxassetid://8819324666"  -- Loud Jumpscare scream (female, very loud & effective)
local SCARE_IMAGE_ID = "rbxassetid://4749623124"  -- Scary Face 2.0 - popular creepy/distorted dog-like horror face variant (widely used in scary Roblox content)
local JUMP_DURATION = 0.35   -- Quick aggressive jump for shock
local SCARE_HOLD = 2.8       -- Time to let the terror sink in
local KICK_MSG = "mimimi cry bitch!"

-- Fullscreen jumpscare GUI setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DogJumpscareTerror"
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Pure black background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Scary dog/horror face (starts smaller & centered, jumps huge)
local horrorDog = Instance.new("ImageLabel")
horrorDog.Size = UDim2.new(0.85, 0, 0.85, 0)
horrorDog.Position = UDim2.new(0.075, 0, 0.075, 0)
horrorDog.BackgroundTransparency = 1
horrorDog.Image = SCARE_IMAGE_ID
horrorDog.ScaleType = Enum.ScaleType.Fit
horrorDog.Parent = bg

-- Violent forward jump tween (feels like the dog lunges at the camera)
local jumpTweenInfo = TweenInfo.new(
    JUMP_DURATION,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local jumpGoal = {
    Size = UDim2.new(1.8, 0, 1.8, 0),
    Position = UDim2.new(-0.4, 0, -0.4, 0)
}

local jumpTween = TweenService:Create(horrorDog, jumpTweenInfo, jumpGoal)

-- BLAST the loud scream
local scream = Instance.new("Sound")
scream.SoundId = SCARE_SOUND_ID
scream.Volume = 10      -- Max volume - will deafen if headphones are on
scream.Parent = SoundService

-- TRIGGER THE JUMPSCARE
scream:Play()
jumpTween:Play()

-- Hold the horror
wait(SCARE_HOLD)

-- Taunt text
local taunt = Instance.new("TextLabel")
taunt.Size = UDim2.new(1, 0, 0.35, 0)
taunt.Position = UDim2.new(0, 0, 0.65, 0)
taunt.BackgroundTransparency = 1
taunt.Text = KICK_MSG
taunt.TextColor3 = Color3.new(1, 0, 0)
taunt.TextStrokeTransparency = 0
taunt.TextStrokeColor3 = Color3.new(0, 0, 0)
taunt.TextScaled = true
taunt.Font = Enum.Font.SourceSansBold
taunt.Parent = bg

-- Kick after taunt
wait(1.3)
player:Kick(KICK_MSG)
