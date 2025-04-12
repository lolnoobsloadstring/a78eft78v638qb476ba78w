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
		writefile("kiExeKeyData.json", HttpService:JSONEncode(data))
		return true
	end
	return false
end

local function loadKeyFromFile()
	if readfile and isfile and isfile("kiExeKeyData.json") then
		local success, data = pcall(function()
			return HttpService:JSONDecode(readfile("kiExeKeyData.json"))
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

local Colors = {
	Primary = Color3.fromRGB(28, 28, 36),
	Secondary = Color3.fromRGB(35, 35, 45),
	Accent = Color3.fromRGB(114, 137, 218),
	Text = Color3.fromRGB(255, 255, 255),
	SubText = Color3.fromRGB(185, 185, 210),
	InputBackground = Color3.fromRGB(47, 49, 54),
	ButtonHover = Color3.fromRGB(71, 82, 196),
	ErrorRed = Color3.fromRGB(231, 76, 60),
	SuccessGreen = Color3.fromRGB(46, 204, 113)
}

local KeySystem = Instance.new("ScreenGui")
KeySystem.Name = "kiExeKeySystem"
KeySystem.Parent = LocalPlayer:WaitForChild("PlayerGui")
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeySystem.IgnoreGuiInset = true
KeySystem.DisplayOrder = 999

local Blur = Instance.new("BlurEffect")
Blur.Size = 20
Blur.Parent = Lighting
Blur.Name = "kiExeBlur"

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = KeySystem
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.4
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)

local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = Background
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.BackgroundColor3 = Colors.Primary
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.Size = UDim2.new(0, 400, 0, 350)
MainContainer.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Colors.Accent
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.5
MainStroke.Parent = MainContainer

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = MainContainer
Header.BackgroundColor3 = Colors.Secondary
Header.BorderSizePixel = 0
Header.Size = UDim2.new(1, 0, 0, 50)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Name = "Title"
HeaderTitle.Parent = Header
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Position = UDim2.new(0, 20, 0, 0)
HeaderTitle.Size = UDim2.new(1, -40, 1, 0)
HeaderTitle.Font = Enum.Font.GothamBold
HeaderTitle.Text = "kiExe Key System"
HeaderTitle.TextColor3 = Colors.Text
HeaderTitle.TextSize = 22
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left

local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Name = "Logo"
LogoIcon.Parent = Header
LogoIcon.BackgroundTransparency = 1
LogoIcon.Position = UDim2.new(0.95, -15, 0.5, -15)
LogoIcon.Size = UDim2.new(0, 30, 0, 30)
LogoIcon.Image = "rbxassetid://7733658504"
LogoIcon.ImageColor3 = Colors.Accent

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Parent = MainContainer
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0, 0, 0, 50)
Content.Size = UDim2.new(1, 0, 1, -50)

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Name = "WelcomeMsg"
WelcomeLabel.Parent = Content
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Position = UDim2.new(0, 30, 0, 20)
WelcomeLabel.Size = UDim2.new(1, -60, 0, 30)
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.Text = "Welcome to kiExe"
WelcomeLabel.TextColor3 = Colors.Accent
WelcomeLabel.TextSize = 20
WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left

local DescriptionLabel = Instance.new("TextLabel")
DescriptionLabel.Name = "Description"
DescriptionLabel.Parent = Content
DescriptionLabel.BackgroundTransparency = 1
DescriptionLabel.Position = UDim2.new(0, 30, 0, 55)
DescriptionLabel.Size = UDim2.new(1, -60, 0, 60)
DescriptionLabel.Font = Enum.Font.Gotham
DescriptionLabel.Text = "To access this system, you need a valid key from our Discord server. Join our community for the latest updates and support."
DescriptionLabel.TextColor3 = Colors.SubText
DescriptionLabel.TextSize = 16
DescriptionLabel.TextWrapped = true
DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left

local InputContainer = Instance.new("Frame")
InputContainer.Name = "InputContainer"
InputContainer.Parent = Content
InputContainer.BackgroundTransparency = 1
InputContainer.Position = UDim2.new(0, 30, 0, 125)
InputContainer.Size = UDim2.new(1, -60, 0, 45)

local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Parent = InputContainer
KeyInput.BackgroundColor3 = Colors.InputBackground
KeyInput.BorderSizePixel = 0
KeyInput.Size = UDim2.new(1, 0, 1, 0)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Colors.Text
KeyInput.TextSize = 16
KeyInput.ClearTextOnFocus = false

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 6)
KeyCorner.Parent = KeyInput

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Colors.Accent
KeyStroke.Thickness = 1
KeyStroke.Transparency = 0.8
KeyStroke.Parent = KeyInput

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "Status"
StatusLabel.Parent = Content
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 30, 0, 175)
StatusLabel.Size = UDim2.new(1, -60, 0, 25)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = ""
StatusLabel.TextColor3 = Colors.SubText
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local ButtonsContainer = Instance.new("Frame")
ButtonsContainer.Name = "ButtonsContainer"
ButtonsContainer.Parent = Content
ButtonsContainer.BackgroundTransparency = 1
ButtonsContainer.Position = UDim2.new(0, 30, 0, 210)
ButtonsContainer.Size = UDim2.new(1, -60, 0, 45)

local function createButton(name, text, posX, parent)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Parent = parent
	button.BackgroundColor3 = Colors.InputBackground
	button.BorderSizePixel = 0
	button.Position = UDim2.new(posX, 0, 0, 0)
	button.Size = UDim2.new(0.48, 0, 1, 0)
	button.Font = Enum.Font.GothamSemibold
	button.Text = text
	button.TextColor3 = Colors.Text
	button.TextSize = 16
	button.AutoButtonColor = false

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = button

	local stroke = Instance.new("UIStroke")
	stroke.Color = Colors.Accent
	stroke.Thickness = 1
	stroke.Transparency = 0.8
	stroke.Parent = button

	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Accent}):Play()
		playSound("Hover", 0.2)
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Colors.InputBackground}):Play()
	end)

	button.MouseButton1Down:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(0.48, 0, 0.95, 0)}):Play()
		playSound("Click", 0.3)
	end)

	button.MouseButton1Up:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(0.48, 0, 1, 0)}):Play()
	end)

	return button
end

local ConfirmButton = createButton("ConfirmButton", "Confirm Key", 0, ButtonsContainer)
local DiscordButton = createButton("DiscordButton", "Join Discord", 0.52, ButtonsContainer)
local LoadingContainer = Instance.new("Frame")
LoadingContainer.Name = "LoadingContainer"
LoadingContainer.Parent = Content
LoadingContainer.BackgroundTransparency = 1
LoadingContainer.Visible = false
LoadingContainer.Position = UDim2.new(0, 30, 0, 270)
LoadingContainer.Size = UDim2.new(1, -60, 0, 45)

local LoadingBar = Instance.new("Frame")
LoadingBar.Name = "LoadingBar"
LoadingBar.Parent = LoadingContainer
LoadingBar.BackgroundColor3 = Colors.InputBackground
LoadingBar.BorderSizePixel = 0
LoadingBar.Size = UDim2.new(1, 0, 1, 0)

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 6)
LoadingCorner.Parent = LoadingBar

local LoadingProgress = Instance.new("Frame")
LoadingProgress.Name = "Progress"
LoadingProgress.Parent = LoadingBar
LoadingProgress.BackgroundColor3 = Colors.Accent
LoadingProgress.BorderSizePixel = 0
LoadingProgress.Size = UDim2.new(0, 0, 1, 0)

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 6)
ProgressCorner.Parent = LoadingProgress

local LoadingText = Instance.new("TextLabel")
LoadingText.Name = "LoadingText"
LoadingText.Parent = LoadingBar
LoadingText.BackgroundTransparency = 1
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.Font = Enum.Font.GothamSemibold
LoadingText.Text = "Loading..."
LoadingText.TextColor3 = Colors.Text
LoadingText.TextSize = 16

local function shake(guiObject)
	local originalPosition = guiObject.Position

	for i = 1, 3 do
		local shakeOffset = 5
		TweenService:Create(guiObject, TweenInfo.new(0.05), {Position = originalPosition + UDim2.new(0, -shakeOffset, 0, 0)}):Play()
		wait(0.05)
		TweenService:Create(guiObject, TweenInfo.new(0.05), {Position = originalPosition + UDim2.new(0, shakeOffset, 0, 0)}):Play()
		wait(0.05)
	end

	TweenService:Create(guiObject, TweenInfo.new(0.1), {Position = originalPosition}):Play()
end

local function updateStatus(text, color)
	StatusLabel.Text = text
	StatusLabel.TextColor3 = color or Colors.SubText
end

local function loadingAnimation(success)
	LoadingContainer.Visible = true

	for i = 0, 100, 5 do
		TweenService:Create(LoadingProgress, TweenInfo.new(0.1), {Size = UDim2.new(i/100, 0, 1, 0)}):Play()
		LoadingText.Text = "Loading... " .. i .. "%"
		wait(0.1)
	end

	if success then
		TweenService:Create(LoadingProgress, TweenInfo.new(0.2), {BackgroundColor3 = Colors.SuccessGreen}):Play()
		LoadingText.Text = "Success!"
	else
		TweenService:Create(LoadingProgress, TweenInfo.new(0.2), {BackgroundColor3 = Colors.ErrorRed}):Play()
		LoadingText.Text = "Failed!"
	end

	wait(1)

	TweenService:Create(LoadingContainer, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingBar, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingProgress, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(LoadingText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()

	wait(0.5)
	LoadingContainer.Visible = false
	LoadingProgress.Size = UDim2.new(0, 0, 1, 0)
	LoadingProgress.BackgroundColor3 = Colors.Accent
	LoadingProgress.BackgroundTransparency = 0
	LoadingBar.BackgroundTransparency = 0
	LoadingText.TextTransparency = 0
	LoadingText.Text = "Loading..."
end

local function fetchKeyData()
	local success, keyData = pcall(function()
		local response = game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/keydata.json")
		return HttpService:JSONDecode(response)
	end)

	return keyData
end

local savedKey = loadKeyFromFile()
if savedKey then
	KeyInput.Text = "••••••••••••••••"
	updateStatus("Key loaded from saved file", Colors.Accent)
end

local function validateKey(inputKey)
	local keyData = fetchKeyData()

	if keyData and keyData.key then
		return string.lower(inputKey) == string.lower(keyData.key)
	else
		warn("Failed to get key data")
		return false
	end
end

local function handleKeySubmission()
	local inputKey = KeyInput.Text

	if inputKey == "" then
		updateStatus("Please enter a key", Colors.ErrorRed)
		shake(KeyInput)
		playSound("Error", 0.3)
		return
	end

	if savedKey and KeyInput.Text == "••••••••••••••••" then
		inputKey = savedKey
	end

	updateStatus("Validating key...", Colors.Accent)
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
		shake(KeyInput)

		if setclipboard then
			setclipboard("https://discord.gg/kiexe")
		end

		DiscordButton.Text = "Link Copied!"
		wait(2)
		DiscordButton.Text = "Join Discord"
	end
end

ConfirmButton.MouseButton1Click:Connect(handleKeySubmission)

DiscordButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/kiexe")
	end

	DiscordButton.Text = "Link Copied!"
	updateStatus("Discord invite copied to clipboard", Colors.Accent)

	wait(2)
	DiscordButton.Text = "Join Discord"
	updateStatus("", Colors.SubText)
end)

KeyInput.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		handleKeySubmission()
	end
end)

MainContainer.Position = UDim2.new(0.5, 0, 1.5, 0)
Background.BackgroundTransparency = 1

TweenService:Create(Background, TweenInfo.new(0.5), {BackgroundTransparency = 0.4}):Play()
wait(0.2)
TweenService:Create(MainContainer, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
