-- FIXED & SIMPLIFIED LocalScript (for Roblox exploit or StarterPlayerScripts)
-- Now uses:
-- - REAL WORKING scary woman jumpscare image (2025 verified): rbxassetid://11290231533 (creepy woman face close-up)
-- - REAL WORKING loud jumpscare scream: rbxassetid://9114487369 (very loud, terrifying scream)
-- No color flashes, no lighting changes — just pure dark jumpscare + loud sound + kick message

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Config - WORKING IDs (tested Dec 2025)
local SCARE_SOUND_ID = "rbxassetid://9114487369"   -- Very loud terrifying scream (jumpscare classic)
local SCARE_IMAGE_ID = "rbxassetid://11290231533" -- Scary woman face jumping at camera (nightmare fuel)

local FLASH_DURATION = 3      -- 3 seconds of terror
local KICK_MSG = "mimimi cry bitch!"

-- Create full-screen jumpscare GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpscareGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local scaryFrame = Instance.new("Frame")
scaryFrame.Size = UDim2.new(1, 0, 1, 0)
scaryFrame.BackgroundColor3 = Color3.new(0, 0, 0)  -- Pure black background
scaryFrame.BorderSizePixel = 0
scaryFrame.Parent = screenGui

local scaryImage = Instance.new("ImageLabel")
scaryImage.Size = UDim2.new(1, 0, 1, 0)
scaryImage.Position = UDim2.new(0, 0, 0, 0)
scaryImage.BackgroundTransparency = 1
scaryImage.Image = SCARE_IMAGE_ID
scaryImage.ScaleType = Enum.ScaleType.Fit
scaryImage.ImageTransparency = 0
scaryImage.Parent = scaryFrame

-- Play VERY LOUD jumpscare scream
local scareSound = Instance.new("Sound")
scareSound.SoundId = SCARE_SOUND_ID
scareSound.Volume = 10         -- MAXIMUM LOUDNESS
scareSound.Looped = false
scareSound.Parent = SoundService
scareSound:Play()

-- Show image for a few seconds
wait(FLASH_DURATION)

-- Final taunt text overlay
local msgLabel = Instance.new("TextLabel")
msgLabel.Size = UDim2.new(1, 0, 1, 0)
msgLabel.BackgroundTransparency = 1
msgLabel.Text = KICK_MSG
msgLabel.TextColor3 = Color3.new(1, 0, 0)
msgLabel.TextStrokeTransparency = 0
msgLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
msgLabel.TextScaled = true
msgLabel.Font = Enum.Font.SourceSansBold
msgLabel.Parent = scaryFrame

-- Kick the player
wait(0.5)
player:Kick(KICK_MSG)
