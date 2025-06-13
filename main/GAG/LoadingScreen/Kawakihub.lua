--🌙 Grow A Garden - Final Loading Screen with Balloon Game, Music, and Auto Execution

pcall(function()
	setclipboard("https://discord.gg/49DAzBrkX4")
end)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

local gui = Instance.new("ScreenGui")
gui.Name = "GrowAGardenLoadingScreen"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Fade Out Function
local function fadeOutUI(callback)
	for i = 1, 20 do
		local t = i / 20
		frame.BackgroundTransparency = t
		for _, v in pairs(frame:GetDescendants()) do
			if v:IsA("TextLabel") or v:IsA("TextButton") then
				v.TextTransparency = t
				v.BackgroundTransparency = t
			elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.ImageTransparency = t
				v.BackgroundTransparency = t
			end
		end
		wait(0.03)
	end
	if callback then callback() end
end

-- UI Elements
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.05, 0)
title.BackgroundTransparency = 1
title.Text = ""
title.Font = Enum.Font.FredokaOne
title.TextSize = 48
title.TextColor3 = Color3.fromRGB(200, 255, 150)

local fullText = "🌻 Grow A Garden 🐝🍯"
task.spawn(function()
	for i = 1, #fullText do
		title.Text = string.sub(fullText, 1, i)
		wait(0.05)
	end
end)

local image = Instance.new("ImageLabel", frame)
image.Size = UDim2.new(0, 100, 0, 100)
image.Position = UDim2.new(0.5, -50, 0.25, -50)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://1000304999"
image.ScaleType = Enum.ScaleType.Fit
Instance.new("UICorner", image).CornerRadius = UDim.new(1, 0)

local progressBG = Instance.new("Frame", frame)
progressBG.Size = UDim2.new(0.6, 0, 0.05, 0)
progressBG.Position = UDim2.new(0.2, 0, 0.5, 0)
progressBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", progressBG).CornerRadius = UDim.new(0, 20)

local progressBar = Instance.new("Frame", progressBG)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 20)

local progressText = Instance.new("TextLabel", frame)
progressText.Size = UDim2.new(1, 0, 0.1, 0)
progressText.Position = UDim2.new(0, 0, 0.56, 0)
progressText.BackgroundTransparency = 1
progressText.Text = "0%"
progressText.Font = Enum.Font.FredokaOne
progressText.TextSize = 32
progressText.TextColor3 = Color3.fromRGB(150, 255, 150)

local discord = Instance.new("TextLabel", frame)
discord.Size = UDim2.new(1, 0, 0.05, 0)
discord.Position = UDim2.new(0, 0, 0.62, 0)
discord.BackgroundTransparency = 1
discord.Text = "Join Our Discord: https://discord.gg/49DAzBrkX4"
discord.Font = Enum.Font.FredokaOne
discord.TextSize = 20
discord.TextColor3 = Color3.fromRGB(100, 200, 100)

-- Sounds
local music = Instance.new("Sound", frame)
music.SoundId = "rbxassetid://9127576330"
music.Volume = 0.5
music.Looped = true
music:Play()

local popSound = Instance.new("Sound", frame)
popSound.SoundId = "rbxassetid://9118823104"
popSound.Volume = 1

-- Scoreboard
local score = 0
local highScore = 0
local scoreText = Instance.new("TextLabel", frame)
scoreText.Size = UDim2.new(0, 300, 0, 50)
scoreText.Position = UDim2.new(1, -310, 0, 10)
scoreText.BackgroundTransparency = 1
scoreText.Font = Enum.Font.FredokaOne
scoreText.TextSize = 22
scoreText.TextColor3 = Color3.fromRGB(255, 200, 200)
scoreText.Text = "🎈 Popped: 0 | 🏆 High: 0"

-- Balloon Mini-Game
local active = true
local balloons = {}

local function spawnBalloon()
	while active do
		wait(math.random(1, 2))
		local balloon = Instance.new("ImageLabel")
		balloon.Size = UDim2.new(0, 40, 0, 50)
		balloon.Position = UDim2.new(math.random(), -20, 0, -60)
		balloon.BackgroundTransparency = 1
		balloon.Image = "rbxassetid://5079739912"
		balloon.ZIndex = 10
		balloon.Name = "Balloon"
		balloon.Parent = frame
		table.insert(balloons, balloon)

		TweenService:Create(balloon, TweenInfo.new(4, Enum.EasingStyle.Linear), {
			Position = balloon.Position + UDim2.new(0, 0, 0, math.random(300, 500))
		}):Play()

		task.delay(4.5, function()
			if balloon and balloon.Parent then
				balloon:Destroy()
			end
		end)
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local pos = input.Position
		for i, balloon in ipairs(balloons) do
			if balloon and balloon.Parent then
				local absPos = balloon.AbsolutePosition
				local absSize = balloon.AbsoluteSize
				if pos.X >= absPos.X and pos.X <= absPos.X + absSize.X and pos.Y >= absPos.Y and pos.Y <= absPos.Y + absSize.Y then
					pcall(function() popSound:Play() end)
					score += 1
					if score > highScore then highScore = score end
					scoreText.Text = "🎈 Popped: " .. score .. " | 🏆 High: " .. highScore
					balloon:Destroy()
					balloons[i] = nil
				end
			end
		end
	end
end)

task.spawn(spawnBalloon)

-- Save high score to PlayerGui
local function saveHighScore()
	local guiVal = Instance.new("StringValue")
	guiVal.Name = "GrowAGardenHighScore"
	guiVal.Value = tostring(highScore)
	guiVal.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Progress Loader
local duration = 20
local steps = 100
local delayTime = duration / steps

task.spawn(function()
	for i = 1, steps do
		local progress = i / steps
		progressBar:TweenSize(UDim2.new(progress, 0, 1, 0), "Out", "Quad", 0.1, true)
		progressText.Text = math.floor(progress * 100) .. "%"
		wait(delayTime)
	end

	progressText.Text = "100%"
	active = false
	wait(0.5)

	saveHighScore()

	fadeOutUI(function()
		music:Stop()
		gui:Destroy()
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/kawakihub/phkawaki/refs/heads/main/real-yobi/main/Grow.A.Garden/yobi/Kawakihub.lua"))()
		end)
	end)
end)
