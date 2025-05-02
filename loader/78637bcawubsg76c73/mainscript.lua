local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local function saveKeyToFile(key)
	if writefile then
		local data = {
			key = key,
			timestamp = os.time()
		}
		writefile("ryza_KeyData.json", HttpService:JSONEncode(data))
		return true
	end
	return false
end

local function loadKeyFromFile()
	if readfile and isfile and isfile("ryza_KeyData.json") then
		local success, data = pcall(function()
			return HttpService:JSONDecode(readfile("ryza_KeyData.json"))
		end)
		if success and data and data.key and data.timestamp then
			return data.key
		end
	end
	return nil
end

local SoundEffects = {
	Click = 4590657391,
	Success = 7512349485,
	Error = 7512347501,
	Hover = 6333717580
}

local function playSound(soundType, volume)
	volume = volume or 0.5
	local sound = Instance.new("Sound")
	sound.Volume = volume
	sound.SoundId = "rbxassetid://" .. SoundEffects[soundType]
	sound.Parent = script
	sound:Play()

	sound.Ended:Connect(function()
		sound:Destroy()
	end)
end

-- Modern flat color scheme
local Colors = {
	Background = Color3.fromRGB(10, 10, 15),       -- Nearly black background
	CardBackground = Color3.fromRGB(18, 18, 25),   -- Dark card background
	CardHeader = Color3.fromRGB(25, 25, 32),       -- Slightly lighter header
	InputBackground = Color3.fromRGB(30, 30, 40),  -- Input field background
	AccentRed = Color3.fromRGB(240, 30, 70),       -- Vibrant red accent
	AccentRedDark = Color3.fromRGB(180, 25, 60),   -- Darker red for contrast
	TextPrimary = Color3.fromRGB(255, 255, 255),   -- White text
	TextSecondary = Color3.fromRGB(180, 180, 200), -- Light gray text
	TextMuted = Color3.fromRGB(130, 130, 150),     -- Muted text color
	SuccessGreen = Color3.fromRGB(40, 200, 110),   -- Success color
	ErrorRed = Color3.fromRGB(230, 60, 70),        -- Error color
	BorderColor = Color3.fromRGB(50, 50, 65)       -- Border color
}

local KeySystem = Instance.new("ScreenGui")
KeySystem.Name = "ryzaKeySystem"
KeySystem.Parent = LocalPlayer:WaitForChild("PlayerGui")
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeySystem.IgnoreGuiInset = true
KeySystem.DisplayOrder = 999

-- Add blur effect
local Blur = Instance.new("BlurEffect")
Blur.Size = 15
Blur.Parent = Lighting
Blur.Name = "ryzaBlur"

-- Background
local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = KeySystem
Background.BackgroundColor3 = Colors.Background
Background.BackgroundTransparency = 0.2
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)

-- Create a pattern overlay to add texture to the background
local PatternOverlay = Instance.new("ImageLabel")
PatternOverlay.Name = "PatternOverlay"
PatternOverlay.Parent = Background
PatternOverlay.BackgroundTransparency = 1
PatternOverlay.Size = UDim2.new(1, 0, 1, 0)
PatternOverlay.Image = "rbxassetid://6883032839" -- Subtle dot pattern
PatternOverlay.ImageTransparency = 0.93
PatternOverlay.ScaleType = Enum.ScaleType.Tile
PatternOverlay.TileSize = UDim2.new(0, 200, 0, 200)

-- Create the main container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = Background
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.BackgroundColor3 = Colors.CardBackground
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.Size = UDim2.new(0, 440, 0, 470)
MainContainer.ClipsDescendants = true

-- Add rounded corners to main container
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

-- Add a red border stroke to main container
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Colors.AccentRed
MainStroke.Thickness = 2
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Parent = MainContainer

-- Header section
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = MainContainer
Header.BackgroundColor3 = Colors.CardHeader
Header.BorderSizePixel = 0
Header.Size = UDim2.new(1, 0, 0, 70)

-- Rounded corners for header (top corners only)
local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

-- Create a frame to cover the bottom corners of the header
local HeaderCoverBottom = Instance.new("Frame")
HeaderCoverBottom.Name = "HeaderCoverBottom"
HeaderCoverBottom.Parent = Header
HeaderCoverBottom.BackgroundColor3 = Colors.CardHeader
HeaderCoverBottom.BorderSizePixel = 0
HeaderCoverBottom.Position = UDim2.new(0, 0, 1, -12)
HeaderCoverBottom.Size = UDim2.new(1, 0, 0, 12)

-- Logo/brand text
local BrandText = Instance.new("TextLabel")
BrandText.Name = "BrandText"
BrandText.Parent = Header
BrandText.BackgroundTransparency = 1
BrandText.Position = UDim2.new(0, 25, 0, 0)
BrandText.Size = UDim2.new(0, 200, 1, 0)
BrandText.Font = Enum.Font.GothamBold
BrandText.Text = "ryza.us"
BrandText.TextColor3 = Colors.TextPrimary
BrandText.TextSize = 28
BrandText.TextXAlignment = Enum.TextXAlignment.Left

-- Version label
local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Parent = Header
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 25, 0.65, 0)
VersionLabel.Size = UDim2.new(0, 100, 0, 20)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "v2.5"
VersionLabel.TextColor3 = Colors.AccentRed
VersionLabel.TextSize = 16
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Warning icon on the right
local WarningIcon = Instance.new("ImageLabel")
WarningIcon.Name = "WarningIcon"
WarningIcon.Parent = Header
WarningIcon.BackgroundTransparency = 1
WarningIcon.Position = UDim2.new(1, -65, 0.5, -20)
WarningIcon.Size = UDim2.new(0, 40, 0, 40)
WarningIcon.Image = "rbxassetid://7734053495" -- Warning icon
WarningIcon.ImageColor3 = Colors.AccentRed

-- Content container with proper spacing
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Parent = MainContainer
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0, 0, 0, 70)
Content.Size = UDim2.new(1, 0, 1, -70)

-- Welcome heading with proper spacing
local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Name = "WelcomeLabel"
WelcomeLabel.Parent = Content
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Position = UDim2.new(0, 30, 0, 30)
WelcomeLabel.Size = UDim2.new(1, -60, 0, 36)
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.Text = "Welcome to ryza.us"
WelcomeLabel.TextColor3 = Colors.AccentRed
WelcomeLabel.TextSize = 24
WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Description with proper spacing
local DescriptionLabel = Instance.new("TextLabel")
DescriptionLabel.Name = "Description"
DescriptionLabel.Parent = Content
DescriptionLabel.BackgroundTransparency = 1
DescriptionLabel.Position = UDim2.new(0, 30, 0, 75)
DescriptionLabel.Size = UDim2.new(1, -60, 0, 60)
DescriptionLabel.Font = Enum.Font.Gotham
DescriptionLabel.Text = "To access this system, you need a valid key from our Discord server. Join our community for the latest updates and support."
DescriptionLabel.TextColor3 = Colors.TextSecondary
DescriptionLabel.TextSize = 16
DescriptionLabel.TextWrapped = true
DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Key input section with better spacing and visual design
local InputBg = Instance.new("Frame")
InputBg.Name = "InputBackground"
InputBg.Parent = Content
InputBg.BackgroundColor3 = Colors.InputBackground
InputBg.BorderSizePixel = 0
InputBg.Position = UDim2.new(0, 30, 0, 150)
InputBg.Size = UDim2.new(1, -60, 0, 60)

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputBg

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Colors.BorderColor
InputStroke.Thickness = 1
InputStroke.Parent = InputBg

-- Key input field
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Parent = InputBg
KeyInput.BackgroundTransparency = 1
KeyInput.Position = UDim2.new(0, 15, 0, 0)
KeyInput.Size = UDim2.new(1, -30, 1, 0)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.PlaceholderColor3 = Colors.TextMuted
KeyInput.Text = ""
KeyInput.TextColor3 = Colors.TextPrimary
KeyInput.TextSize = 18
KeyInput.ClearTextOnFocus = false
KeyInput.TextXAlignment = Enum.TextXAlignment.Left

-- Visual dot indicator or animation for the key input
local KeyVisualizer = Instance.new("Frame")
KeyVisualizer.Name = "KeyVisualizer"
KeyVisualizer.Parent = Content
KeyVisualizer.BackgroundTransparency = 1
KeyVisualizer.Position = UDim2.new(0, 30, 0, 225)
KeyVisualizer.Size = UDim2.new(1, -60, 0, 20)

-- Create 11 dots for visualization
for i = 1, 11 do
	local dot = Instance.new("Frame")
	dot.Name = "Dot" .. i
	dot.Parent = KeyVisualizer
	dot.BackgroundColor3 = i <= 3 and Colors.AccentRed or Colors.BorderColor
	dot.BorderSizePixel = 0
	dot.Position = UDim2.new((i-1)/10, 0, 0.5, -2)
	dot.Size = UDim2.new(0, 4, 0, 4)

	local dotRound = Instance.new("UICorner")
	dotRound.CornerRadius = UDim.new(1, 0)
	dotRound.Parent = dot
end

-- Status label with proper spacing
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "Status"
StatusLabel.Parent = Content
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 30, 0, 255)
StatusLabel.Size = UDim2.new(1, -60, 0, 25)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = ""
StatusLabel.TextColor3 = Colors.SuccessGreen
StatusLabel.TextSize = 16
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Buttons container with better spacing
local ButtonsContainer = Instance.new("Frame")
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Parent = Content
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Position = UDim2.new(0, 30, 0, 295)
ButtonsContainer.Size = UDim2.new(1, -60, 0, 50)

-- Enhanced button creation function
local function createButton(name, text, icon, posX, parent)
	local buttonContainer = Instance.new("Frame")
	buttonContainer.Name = name .. "Container"
	buttonContainer.Parent = parent
	buttonContainer.BackgroundTransparency = 1
	buttonContainer.Position = UDim2.new(posX, 0, 0, 0)
	buttonContainer.Size = UDim2.new(0.48, 0, 1, 0)

	local button = Instance.new("TextButton")
	button.Name = name
	button.Parent = buttonContainer
	button.BackgroundColor3 = name == "ConfirmButton" and Colors.AccentRed or Colors.InputBackground
	button.BorderSizePixel = 0
	button.Size = UDim2.new(1, 0, 1, 0)
	button.Font = Enum.Font.GothamSemibold
	button.Text = ""
	button.TextColor3 = Colors.TextPrimary
	button.TextSize = 16
	button.AutoButtonColor = false

	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 8)
	buttonCorner.Parent = button

	-- Button stroke (only for non-primary buttons)
	if name ~= "ConfirmButton" then
		local buttonStroke = Instance.new("UIStroke")
		buttonStroke.Color = Colors.BorderColor
		buttonStroke.Thickness = 1.5
		buttonStroke.Parent = button
	end

	-- Button icon
	local iconImage = Instance.new("ImageLabel")
	iconImage.Name = "Icon"
	iconImage.Parent = button
	iconImage.BackgroundTransparency = 1
	iconImage.Position = UDim2.new(0, 15, 0.5, -10)
	iconImage.Size = UDim2.new(0, 20, 0, 20)
	iconImage.Image = icon
	iconImage.ImageColor3 = Colors.TextPrimary

	-- Button text
	local buttonText = Instance.new("TextLabel")
	buttonText.Name = "ButtonText"
	buttonText.Parent = button
	buttonText.BackgroundTransparency = 1
	buttonText.Position = UDim2.new(0, 45, 0, 0)
	buttonText.Size = UDim2.new(1, -55, 1, 0)
	buttonText.Font = Enum.Font.GothamSemibold
	buttonText.Text = text
	buttonText.TextColor3 = Colors.TextPrimary
	buttonText.TextSize = 16
	buttonText.TextXAlignment = Enum.TextXAlignment.Left

	-- Hover and click effects
	button.MouseEnter:Connect(function()
		if name == "ConfirmButton" then
			TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Colors.AccentRedDark}):Play()
		else
			TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 55)}):Play()
		end
		playSound("Hover", 0.2)
	end)

	button.MouseLeave:Connect(function()
		if name == "ConfirmButton" then
			TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Colors.AccentRed}):Play()
		else
			TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Colors.InputBackground}):Play()
		end
	end)

	button.MouseButton1Down:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(0.98, 0, 0.95, 0)}):Play()
		TweenService:Create(buttonContainer, TweenInfo.new(0.1), {Position = buttonContainer.Position + UDim2.new(0.01, 0, 0.025, 0)}):Play()
		playSound("Click", 0.3)
	end)

	button.MouseButton1Up:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 1, 0)}):Play()
		TweenService:Create(buttonContainer, TweenInfo.new(0.1), {Position = UDim2.new(posX, 0, 0, 0)}):Play()
	end)

	return button
end

-- Create buttons with icons
local ConfirmButton = createButton("ConfirmButton", "Confirm Key", "rbxassetid://7733715400", 0, ButtonsContainer)
local DiscordButton = createButton("DiscordButton", "Join Discord", "rbxassetid://7743875962", 0.52, ButtonsContainer)

-- Loading container with better presentation
local LoadingContainer = Instance.new("Frame")
LoadingContainer.Name = "LoadingContainer"
LoadingContainer.Parent = Content
LoadingContainer.BackgroundTransparency = 1
LoadingContainer.Visible = false
LoadingContainer.Position = UDim2.new(0, 30, 0, 360)
LoadingContainer.Size = UDim2.new(1, -60, 0, 45)

local LoadingLabel = Instance.new("TextLabel")
LoadingLabel.Name = "LoadingLabel"
LoadingLabel.Parent = LoadingContainer
LoadingLabel.BackgroundTransparency = 1
LoadingLabel.Position = UDim2.new(0, 0, 0, -25)
LoadingLabel.Size = UDim2.new(1, 0, 0, 20)
LoadingLabel.Font = Enum.Font.Gotham
LoadingLabel.Text = "Loading..."
LoadingLabel.TextColor3 = Colors.TextSecondary
LoadingLabel.TextSize = 16

local LoadingBar = Instance.new("Frame")
LoadingBar.Name = "LoadingBar"
LoadingBar.Parent = LoadingContainer
LoadingBar.BackgroundColor3 = Colors.InputBackground
LoadingBar.BorderSizePixel = 0
LoadingBar.Size = UDim2.new(1, 0, 0, 8)

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 4)
LoadingCorner.Parent = LoadingBar

local LoadingProgress = Instance.new("Frame")
LoadingProgress.Name = "Progress"
LoadingProgress.Parent = LoadingBar
LoadingProgress.BackgroundColor3 = Colors.AccentRed
LoadingProgress.BorderSizePixel = 0
LoadingProgress.Size = UDim2.new(0, 0, 1, 0)

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 4)
ProgressCorner.Parent = LoadingProgress

local LoadingPercent = Instance.new("TextLabel")
LoadingPercent.Name = "LoadingPercent"
LoadingPercent.Parent = LoadingContainer
LoadingPercent.BackgroundTransparency = 1
LoadingPercent.Position = UDim2.new(0, 0, 0, 15)
LoadingPercent.Size = UDim2.new(1, 0, 0, 20)
LoadingPercent.Font = Enum.Font.GothamSemibold
LoadingPercent.Text = "0%"
LoadingPercent.TextColor3 = Colors.TextPrimary
LoadingPercent.TextSize = 14

-- Footer with copyright
local FooterText = Instance.new("TextLabel")
FooterText.Name = "FooterText"
FooterText.Parent = Content
FooterText.BackgroundTransparency = 1
FooterText.Position = UDim2.new(0, 0, 1, -35)
FooterText.Size = UDim2.new(1, 0, 0, 20)
FooterText.Font = Enum.Font.Gotham
FooterText.Text = "© ryza.us 2025 • All rights reserved"
FooterText.TextColor3 = Colors.TextMuted
FooterText.TextSize = 12

-- Shake animation improved
local function shake(guiObject)
	local originalPosition = guiObject.Position

	for i = 1, 3 do
		TweenService:Create(guiObject, TweenInfo.new(0.05), {Position = originalPosition + UDim2.new(0, -7, 0, 0)}):Play()
		wait(0.05)
		TweenService:Create(guiObject, TweenInfo.new(0.05), {Position = originalPosition + UDim2.new(0, 7, 0, 0)}):Play()
		wait(0.05)
	end

	TweenService:Create(guiObject, TweenInfo.new(0.1), {Position = originalPosition}):Play()
end

-- Update status with better visualization
local function updateStatus(text, color)
	StatusLabel.Text = text
	StatusLabel.TextColor3 = color or Colors.TextSecondary
end

-- Loading animation with no gradient tweening
local function loadingAnimation(success)
	LoadingContainer.Visible = true
	LoadingLabel.Text = "Loading..."

	-- Update loading bar
	for i = 0, 100, 5 do
		TweenService:Create(LoadingProgress, TweenInfo.new(0.1), {Size = UDim2.new(i/100, 0, 1, 0)}):Play()
		LoadingPercent.Text = i .. "%"
		wait(0.1)
	end

	-- Update colors based on success
	if success then
		TweenService:Create(LoadingProgress, TweenInfo.new(0.2), {BackgroundColor3 = Colors.SuccessGreen}):Play()
		LoadingLabel.Text = "Success!"
	else
		TweenService:Create(LoadingProgress, TweenInfo.new(0.2), {BackgroundColor3 = Colors.ErrorRed}):Play()
		LoadingLabel.Text = "Failed!"
	end

	wait(1)

	-- Fade out
	TweenService:Create(LoadingContainer, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingBar, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingProgress, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
	TweenService:Create(LoadingPercent, TweenInfo.new(0.5), {TextTransparency = 1}):Play()

	wait(0.5)

	-- Reset
	LoadingContainer.Visible = false
	LoadingProgress.Size = UDim2.new(0, 0, 1, 0)
	LoadingProgress.BackgroundColor3 = Colors.AccentRed
	LoadingProgress.BackgroundTransparency = 0
	LoadingBar.BackgroundTransparency = 0
	LoadingLabel.TextTransparency = 0
	LoadingPercent.TextTransparency = 0
	LoadingLabel.Text = "Loading..."
	LoadingPercent.Text = "0%"
end

-- Key data functions
local function fetchKeyData()
	local success, keyData = pcall(function()
		local response = game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/keydata.json")
		return HttpService:JSONDecode(response)
	end)

	return keyData
end

-- Check for saved key
local savedKey = loadKeyFromFile()
if savedKey then
	KeyInput.Text = "••••••••••••••••"
	updateStatus("Key loaded from saved file", Colors.AccentRed)
end

-- Validate key function
local function validateKey(inputKey)
	local keyData = fetchKeyData()

	if keyData and keyData.key then
		return string.lower(inputKey) == string.lower(keyData.key)
	else
		warn("Failed to get key data")
		return false
	end
end

-- Handle key submission with better feedback
local function handleKeySubmission()
	local inputKey = KeyInput.Text

	if inputKey == "" then
		updateStatus("Please enter a key", Colors.ErrorRed)
		shake(InputBg)
		playSound("Error", 0.3)
		return
	end

	if savedKey and KeyInput.Text == "••••••••••••••••" then
		inputKey = savedKey
	end

	updateStatus("Validating key...", Colors.AccentRed)
	wait(0.5)

	local keyValid = validateKey(inputKey)

	if keyValid then
		playSound("Success", 0.5)
		saveKeyToFile(inputKey)
		updateStatus("Key accepted! Loading...", Colors.SuccessGreen)
		KeyInput.TextEditable = false
		loadingAnimation(true)
		wait(0.5)
		Blur:Destroy()
		TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
		TweenService:Create(MainContainer, TweenInfo.new(1), {Position = UDim2.new(0.5, 0, 1.5, 0)}):Play()
		wait(1)
		KeySystem:Destroy()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/keyfinished.lua'))()
	else
		playSound("Error", 0.5)
		updateStatus("Invalid key! Please check Discord for the correct key.", Colors.ErrorRed)
		shake(InputBg)

		if setclipboard then
			setclipboard("https://discord.gg/hytt99Crdz")
		end

		DiscordButton.ButtonText.Text = "Link Copied!"
		wait(2)
		DiscordButton.ButtonText.Text = "Join Discord"
	end
end

-- Button event handlers
ConfirmButton.MouseButton1Click:Connect(handleKeySubmission)

DiscordButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/hytt99Crdz")
	end

	DiscordButton.ButtonText.Text = "Link Copied!"
	updateStatus("Discord invite copied to clipboard", Colors.AccentRed)

	wait(2)
	DiscordButton.ButtonText.Text = "Join Discord"
	updateStatus("", Colors.TextSecondary)
end)

KeyInput.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		handleKeySubmission()
	end
end)

-- Smooth entrance animation
MainContainer.Position = UDim2.new(0.5, 0, 1.5, 0)
Background.BackgroundTransparency = 1

TweenService:Create(Background, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
wait(0.2)
TweenService:Create(MainContainer, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()

-- Add a simple animation for the dots
spawn(function()
	while wait(1) do
		if not KeySystem.Parent then break end

		for i = 1, 11 do
			local dot = KeyVisualizer:FindFirstChild("Dot" .. i)
			if dot then
				TweenService:Create(dot, TweenInfo.new(0.5), {BackgroundColor3 = Colors.AccentRed}):Play()
				wait(0.1)

				if i > 1 then
					local prevDot = KeyVisualizer:FindFirstChild("Dot" .. (i-1))
					if prevDot then
						TweenService:Create(prevDot, TweenInfo.new(0.5), {BackgroundColor3 = Colors.BorderColor}):Play()
					end
				end

				if i == 11 then
					wait(0.1)
					TweenService:Create(dot, TweenInfo.new(0.5), {BackgroundColor3 = Colors.BorderColor}):Play()
					wait(1)
				end
			end
		end
	end
end)
