-- LocalScript (put in StarterPlayerScripts or use an exploit executor)
-- PURE JUMPSCARE: Scary woman face jumps at camera + LOUD female scream
-- NO color flashes, no extra effects - just sudden terror then kick
-- UPDATED IDs (working as of December 2025)

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config - Verified working IDs December 2025
local SCARE_SOUND_ID = "rbxassetid://6754147732"  -- Horror Jumpscare Sound Effect (VERY LOUD female scream)
local SCARE_IMAGE_ID = "rbxassetid://13255303848" -- Scary face 2.0 (terrifying woman-like horror face)
local JUMP_DURATION = 0.4   -- How fast the face "jumps" forward
local SCARE_HOLD = 2.5      -- How long the scream/face stays before kick
local KICK_MSG = "mimimi cry bitch!"

-- Create fullscreen jumpscare GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SuddenJumpscare"
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Pure black background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Scary woman/horror face (oversized & positioned to jump forward)
local horrorFace = Instance.new("ImageLabel")
horrorFace.Size = UDim2.new(0.9, 0, 0.9, 0)          -- starts smaller
horrorFace.Position = UDim2.new(0.05, 0, 0.05, 0)     -- centered
horrorFace.BackgroundTransparency = 1
horrorFace.Image = SCARE_IMAGE_ID
horrorFace.ScaleType = Enum.ScaleType.Fit
horrorFace.Parent = bg

-- Tween to make it JUMP forward suddenly
local jumpTweenInfo = TweenInfo.new(
    JUMP_DURATION,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local jumpGoal = {
    Size = UDim2.new(1.6, 0, 1.6, 0),
    Position = UDim2.new(-0.3, 0, -0.3, 0)
}

local jumpTween = TweenService:Create(horrorFace, jumpTweenInfo, jumpGoal)

-- BLAST the scream sound
local scream = Instance.new("Sound")
scream.SoundId = SCARE_SOUND_ID
scream.Volume = 10      -- MAXIMUM LOUDNESS
scream.Parent = SoundService

-- TRIGGER THE JUMPSCARE
scream:Play()
jumpTween:Play()

-- Hold the terror for a moment
wait(SCARE_HOLD)

-- Final taunt text
local taunt = Instance.new("TextLabel")
taunt.Size = UDim2.new(1, 0, 0.4, 0)
taunt.Position = UDim2.new(0, 0, 0.6, 0)
taunt.BackgroundTransparency = 1
taunt.Text = KICK_MSG
taunt.TextColor3 = Color3.new(1, 0, 0)
taunt.TextStrokeTransparency = 0
taunt.TextStrokeColor3 = Color3.new(0, 0, 0)
taunt.TextScaled = true
taunt.Font = Enum.Font.SourceSansBold
taunt.Parent = bg

-- Kick after short delay
wait(1.2)
player:Kick(KICK_MSG)
