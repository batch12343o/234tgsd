-- LocalScript (put in StarterPlayerScripts or use an exploit executor)
-- UPDATED JUMPSCARE: Loud scream + scary dog-like horror face + new insane kick message
-- Pure sudden terror: black screen, face jumps forward, scream blasts, then spam kick message

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config - Working IDs (late 2025)
local SCARE_SOUND_ID = "rbxassetid://8819324666"  -- Loud jumpscare scream (female, very loud)
local SCARE_IMAGE_ID = "rbxassetid://7255938910"  -- Scary Face 2.0 - creepy distorted horror face (dog/monster vibe)
local JUMP_DURATION = 0.35   -- Fast aggressive jump
local SCARE_HOLD = 2.8       -- Let the fear build
local KICK_MSG = "GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING ! GOD IS COMING !"

-- Fullscreen jumpscare GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ApocalypseJumpscare"
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Scary dog/monster horror face (starts normal size)
local horrorFace = Instance.new("ImageLabel")
horrorFace.Size = UDim2.new(0.85, 0, 0.85, 0)
horrorFace.Position = UDim2.new(0.075, 0, 0.075, 0)
horrorFace.BackgroundTransparency = 1
horrorFace.Image = SCARE_IMAGE_ID
horrorFace.ScaleType = Enum.ScaleType.Fit
horrorFace.Parent = bg

-- Violent jump forward tween
local jumpTweenInfo = TweenInfo.new(JUMP_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local jumpGoal = {Size = UDim2.new(1.8, 0, 1.8, 0), Position = UDim2.new(-0.4, 0, -0.4, 0)}
local jumpTween = TweenService:Create(horrorFace, jumpTweenInfo, jumpGoal)

-- Play the loud scream
local scream = Instance.new("Sound")
scream.SoundId = SCARE_SOUND_ID
scream.Volume = 10  -- Deafening
scream.Parent = SoundService

-- EXECUTE JUMPSCARE
scream:Play()
jumpTween:Play()

wait(SCARE_HOLD)

-- Massive taunt text (spammed message)
local taunt = Instance.new("TextLabel")
taunt.Size = UDim2.new(1, 0, 1, 0)
taunt.Position = UDim2.new(0, 0, 0, 0)
taunt.BackgroundTransparency = 0.3
taunt.BackgroundColor3 = Color3.new(0, 0, 0)
taunt.Text = KICK_MSG
taunt.TextColor3 = Color3.new(1, 0, 0)
taunt.TextStrokeTransparency = 0
taunt.TextStrokeColor3 = Color3.new(0, 0, 0)
taunt.TextScaled = true
taunt.TextWrapped = true
taunt.Font = Enum.Font.SourceSansBold
taunt.Parent = bg

-- Kick the player with the full message
wait(1.5)
player:Kick(KICK_MSG)
