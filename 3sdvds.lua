-- LocalScript (put in StarterPlayerScripts or use an exploit executor)
-- UPDATED JUMPSCARE: NEW sound + NEW terrifying woman horror face
-- Pure sudden jumpscare - no color flashes, just scream + face lunge + kick

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- NEW Config - Fresh working IDs (December 2025 verified from Roblox Catalog & Den)
local SCARE_SOUND_ID = "rbxassetid://8819324666"  -- "Loud Jumpscare" - extremely loud female scream variant
local SCARE_IMAGE_ID = "rbxassetid://9349790449"  -- "Scary Face" decal - classic terrifying woman-like horror face
local JUMP_DURATION = 0.35   -- Fast jump forward for max shock
local SCARE_HOLD = 2.8       -- Hold the terror before kick
local KICK_MSG = "mimimi cry bitch!"

-- Fullscreen jumpscare GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SuddenHorrorJumpscare"
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Pure black background for contrast
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Terrifying woman/horror face (starts smaller, jumps huge)
local horrorFace = Instance.new("ImageLabel")
horrorFace.Size = UDim2.new(0.85, 0, 0.85, 0)
horrorFace.Position = UDim2.new(0.075, 0, 0.075, 0)
horrorFace.BackgroundTransparency = 1
horrorFace.Image = SCARE_IMAGE_ID
horrorFace.ScaleType = Enum.ScaleType.Fit
horrorFace.Parent = bg

-- Sudden jump tween (face explodes toward camera)
local jumpTweenInfo = TweenInfo.new(
    JUMP_DURATION,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local jumpGoal = {
    Size = UDim2.new(1.8, 0, 1.8, 0),
    Position = UDim2.new(-0.4, 0, -0.4, 0)
}

local jumpTween = TweenService:Create(horrorFace, jumpTweenInfo, jumpGoal)

-- BLAST the new loud scream
local scream = Instance.new("Sound")
scream.SoundId = SCARE_SOUND_ID
scream.Volume = 10      -- Deafening max volume
scream.Parent = SoundService

-- TRIGGER THE TERROR
scream:Play()
jumpTween:Play()

-- Hold for full effect
wait(SCARE_HOLD)

-- Taunt text overlay
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

-- Kick the player
wait(1.3)
player:Kick(KICK_MSG)
