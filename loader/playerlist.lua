-- ✨ Cute & Modern Ryza PlayerList ✨
-- Matches the topbar style with animated pastel gradients and kawaii elements

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

-- Find the existing Ryza UI
local ryza = playerGui:FindFirstChild("ryza")
if not ryza then
	warn("Ryza UI not found! PlayerList won't be attached properly.")
	return
end

-- Create the PlayerList main container with fixed size
local PlayerList = Instance.new("Frame")
PlayerList.Name = "PlayerList"
PlayerList.Parent = ryza
PlayerList.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
PlayerList.BorderSizePixel = 0
PlayerList.Position = UDim2.new(1, -220, 0, 110) -- Position it below the TopBar
PlayerList.Size = UDim2.new(0, 200, 0, 300) -- Fixed size that will not change
PlayerList.ClipsDescendants = true
PlayerList.AnchorPoint = Vector2.new(1, 0)
PlayerList.Visible = true

-- Rounded corners with larger radius for consistent look
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = PlayerList

-- Enhanced glow effect with pastel color (same as TopBar)
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = PlayerList
UIStroke.Color = Color3.fromRGB(220, 150, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.3
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Add subtle pulsing animation to the border
spawn(function()
	while PlayerList.Parent do
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

-- Create a dreamy animated background gradient (pastel kawaii style - matches TopBar)
local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 45, 95)),
	ColorSequenceKeypoint.new(0.3, Color3.fromRGB(45, 45, 80)),
	ColorSequenceKeypoint.new(0.7, Color3.fromRGB(65, 40, 90)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 40, 75))
}
BackgroundGradient.Rotation = 45
BackgroundGradient.Parent = PlayerList

-- Animate background gradient
spawn(function()
	local rotation = 45
	while PlayerList.Parent do
		rotation = (rotation + 0.2) % 360
		BackgroundGradient.Rotation = rotation
		wait(0.03)
	end
end)

-- Header Container
local HeaderContainer = Instance.new("Frame")
HeaderContainer.Name = "HeaderContainer"
HeaderContainer.Parent = PlayerList
HeaderContainer.BackgroundColor3 = Color3.fromRGB(60, 50, 90)
HeaderContainer.BackgroundTransparency = 0.4
HeaderContainer.BorderSizePixel = 0
HeaderContainer.Position = UDim2.new(0, 0, 0, 0)
HeaderContainer.Size = UDim2.new(1, 0, 0, 40)

-- Header Container Corner
local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = HeaderContainer

-- Title and count container
local TitleContainer = Instance.new("Frame")
TitleContainer.Name = "TitleContainer"
TitleContainer.Parent = HeaderContainer
TitleContainer.BackgroundTransparency = 1
TitleContainer.Position = UDim2.new(0, 10, 0, 0)
TitleContainer.Size = UDim2.new(1, -20, 1, 0)

-- Cute Header Title
local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Name = "HeaderTitle"
HeaderTitle.Parent = TitleContainer
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Position = UDim2.new(0, 0, 0, 4)
HeaderTitle.Size = UDim2.new(1, -40, 0, 22)
HeaderTitle.Font = Enum.Font.GothamBold
HeaderTitle.Text = "Players"
HeaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HeaderTitle.TextSize = 16
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Add rainbow effect to header title
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 255)),
	ColorSequenceKeypoint.new(0.3, Color3.fromRGB(200, 200, 255)),
	ColorSequenceKeypoint.new(0.6, Color3.fromRGB(200, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 255))
}
TitleGradient.Parent = HeaderTitle

-- Animate title gradient
spawn(function()
	local offset = 0
	while HeaderTitle.Parent do
		offset = (offset + 0.01) % 1
		TitleGradient.Offset = Vector2.new(offset, 0)
		wait(0.03)
	end
end)

-- Player Count
local PlayerCount = Instance.new("TextLabel")
PlayerCount.Name = "PlayerCount"
PlayerCount.Parent = TitleContainer
PlayerCount.BackgroundTransparency = 1
PlayerCount.Position = UDim2.new(0, 0, 0, 24)
PlayerCount.Size = UDim2.new(1, -40, 0, 14)
PlayerCount.Font = Enum.Font.GothamSemibold
PlayerCount.Text = "Loading..."
PlayerCount.TextColor3 = Color3.fromRGB(200, 180, 255)
PlayerCount.TextSize = 12
PlayerCount.TextXAlignment = Enum.TextXAlignment.Left

-- Create divider
local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Parent = PlayerList
Divider.BackgroundColor3 = Color3.fromRGB(180, 130, 255)
Divider.Position = UDim2.new(0, 10, 0, 40)
Divider.Size = UDim2.new(1, -20, 0, 1)
Divider.BorderSizePixel = 0
Divider.Transparency = 0.7

-- Scrolling Frame for Player Entries
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = PlayerList
ScrollingFrame.Active = true
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 0, 0, 45)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -45)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 150, 255)
ScrollingFrame.ScrollBarImageTransparency = 0.3
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Will be updated dynamically
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- Padding for ScrollingFrame
local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.Parent = ScrollingFrame
ScrollPadding.PaddingLeft = UDim.new(0, 10)
ScrollPadding.PaddingRight = UDim.new(0, 10)
ScrollPadding.PaddingTop = UDim.new(0, 8)
ScrollPadding.PaddingBottom = UDim.new(0, 8)

-- List Layout for smooth list arrangement
local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScrollingFrame
ListLayout.Padding = UDim.new(0, 6)
ListLayout.SortOrder = Enum.SortOrder.Name
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Fixed Toggle functionality (expanded by default)
local isMinimized = false

-- Function to create a player entry
local function createPlayerEntry(plr)
	-- Skip if entry already exists
	if ScrollingFrame:FindFirstChild(plr.Name) then
		return
	end

	-- Player Entry Container
  game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
  
	local PlayerEntry = Instance.new("Frame")
	PlayerEntry.Name = plr.Name
	PlayerEntry.Parent = ScrollingFrame
	PlayerEntry.BackgroundColor3 = Color3.fromRGB(60, 50, 90)
	PlayerEntry.BackgroundTransparency = 0.6
	PlayerEntry.BorderSizePixel = 0
	PlayerEntry.Size = UDim2.new(1, 0, 0, 34) -- Slightly shorter without team display

	-- Player Entry Rounded Corners
	local EntryCorner = Instance.new("UICorner")
	EntryCorner.CornerRadius = UDim.new(0, 10)
	EntryCorner.Parent = PlayerEntry

	-- Player Entry Gradient (unique for each player based on name)
	local nameSum = 0
	for i = 1, #plr.Name do
		nameSum = nameSum + string.byte(plr.Name:sub(i, i))
	end

	-- Fix color values to be within range (0-1)
	local hue1 = ((nameSum % 60) / 100) + 0.5 -- Ensure between 0-1
	local hue2 = (((nameSum * 13) % 60) / 100) + 0.7 -- Ensure between 0-1

	-- Safety check to ensure values are within range
	hue1 = math.clamp(hue1, 0, 1)
	hue2 = math.clamp(hue2, 0, 1)

	local EntryGradient = Instance.new("UIGradient")
	EntryGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromHSV(hue1, 0.6, 0.8)),
		ColorSequenceKeypoint.new(1, Color3.fromHSV(hue2, 0.7, 0.7))
	}
	EntryGradient.Rotation = 45
	EntryGradient.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0.7),
		NumberSequenceKeypoint.new(1, 0.8)
	}
	EntryGradient.Parent = PlayerEntry

	-- Add hover effect to player entry
	PlayerEntry.MouseEnter:Connect(function()
		TweenService:Create(PlayerEntry, TweenInfo.new(0.3), {
			BackgroundTransparency = 0.4
		}):Play()
		TweenService:Create(EntryGradient, TweenInfo.new(0.3), {
			Rotation = EntryGradient.Rotation + 15
		}):Play()
	end)

	PlayerEntry.MouseLeave:Connect(function()
		TweenService:Create(PlayerEntry, TweenInfo.new(0.3), {
			BackgroundTransparency = 0.6
		}):Play()
		TweenService:Create(EntryGradient, TweenInfo.new(0.3), {
			Rotation = EntryGradient.Rotation - 15
		}):Play()
	end)

	-- Avatar Icon Container
	local AvatarContainer = Instance.new("Frame")
	AvatarContainer.Name = "AvatarContainer"
	AvatarContainer.Parent = PlayerEntry
	AvatarContainer.BackgroundTransparency = 1
	AvatarContainer.Position = UDim2.new(0, 5, 0, 3)
	AvatarContainer.Size = UDim2.new(0, 30, 0, 30)

	-- Circular mask for avatar
	local AvatarMask = Instance.new("Frame")
	AvatarMask.Name = "AvatarMask"
	AvatarMask.Parent = AvatarContainer
	AvatarMask.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AvatarMask.BackgroundTransparency = 0.1
	AvatarMask.Size = UDim2.new(1, 0, 1, 0)
	AvatarMask.ZIndex = 2

	-- Make avatar mask circular
	local AvatarCorner = Instance.new("UICorner")
	AvatarCorner.CornerRadius = UDim.new(1, 0)
	AvatarCorner.Parent = AvatarMask

	-- Avatar Image
	local AvatarImage = Instance.new("ImageLabel")
	AvatarImage.Name = "AvatarImage"
	AvatarImage.Parent = AvatarMask
	AvatarImage.BackgroundTransparency = 1
	AvatarImage.Size = UDim2.new(1, 0, 1, 0)
	AvatarImage.Image = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	AvatarImage.ZIndex = 1

	-- Circular clipping for avatar
	local AvatarClipping = Instance.new("UICorner")
	AvatarClipping.CornerRadius = UDim.new(1, 0)
	AvatarClipping.Parent = AvatarImage

	-- Player Info Container
	local InfoContainer = Instance.new("Frame")
	InfoContainer.Name = "InfoContainer"
	InfoContainer.Parent = PlayerEntry
	InfoContainer.BackgroundTransparency = 1
	InfoContainer.Position = UDim2.new(0, 40, 0, 0)
	InfoContainer.Size = UDim2.new(1, -45, 1, 0)

	-- Username Label
	local UsernameLabel = Instance.new("TextLabel")
	UsernameLabel.Name = "UsernameLabel"
	UsernameLabel.Parent = InfoContainer
	UsernameLabel.BackgroundTransparency = 1
	UsernameLabel.Position = UDim2.new(0, 0, 0, 3)
	UsernameLabel.Size = UDim2.new(1, 0, 0, 18)
	UsernameLabel.Font = Enum.Font.GothamBold
	UsernameLabel.Text = plr.Name
	UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	UsernameLabel.TextSize = 14
	UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left

	-- Center the username vertically since we're not showing team
	UsernameLabel.Position = UDim2.new(0, 0, 0.5, -9)
	UsernameLabel.TextSize = 15

	-- Add status indicator (online/local player)
	local StatusIndicator = Instance.new("Frame")
	StatusIndicator.Name = "StatusIndicator"
	StatusIndicator.Parent = PlayerEntry
	StatusIndicator.AnchorPoint = Vector2.new(1, 0.5)
	StatusIndicator.Position = UDim2.new(1, -8, 0.5, 0)
	StatusIndicator.Size = UDim2.new(0, 8, 0, 8)

	-- Make status indicator circular
	local StatusCorner = Instance.new("UICorner")
	StatusCorner.CornerRadius = UDim.new(1, 0)
	StatusCorner.Parent = StatusIndicator

	-- Set indicator color (green for local player, blue for others)
	if plr == player then
		StatusIndicator.BackgroundColor3 = Color3.fromRGB(100, 255, 150)

		-- Add little crown for local player
		local CrownIcon = Instance.new("TextLabel")
		CrownIcon.Name = "CrownIcon"
		CrownIcon.Parent = AvatarContainer
		CrownIcon.BackgroundTransparency = 1
		CrownIcon.Position = UDim2.new(0.5, 0, 0, -10)
		CrownIcon.Size = UDim2.new(0, 20, 0, 20)
		CrownIcon.Font = Enum.Font.GothamBold
		CrownIcon.Text = "👑"
		CrownIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
		CrownIcon.TextSize = 14
		CrownIcon.ZIndex = 3
		CrownIcon.TextYAlignment = Enum.TextYAlignment.Bottom

		-- Cute animation for crown
		spawn(function()
			while CrownIcon.Parent do
				for i = -10, -8, 0.1 do
					if CrownIcon.Parent then
						CrownIcon.Position = UDim2.new(0.5, 0, 0, i)
						wait(0.03)
					else
						break
					end
				end
				for i = -8, -10, -0.1 do
					if CrownIcon.Parent then
						CrownIcon.Position = UDim2.new(0.5, 0, 0, i)
						wait(0.03)
					else
						break
					end
				end
			end
		end)
	else
		StatusIndicator.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
	end

	-- Animate status indicator
	spawn(function()
		while StatusIndicator.Parent do
			for i = 0.7, 1, 0.02 do
				if StatusIndicator.Parent then
					StatusIndicator.BackgroundTransparency = i
					wait(0.03)
				else
					break
				end
			end
			for i = 1, 0.7, -0.02 do
				if StatusIndicator.Parent then
					StatusIndicator.BackgroundTransparency = i
					wait(0.03)
				else
					break
				end
			end
		end
	end)

	-- Add cute sparkle effects
	local function createSparkle()
		local Sparkle = Instance.new("TextLabel")
		Sparkle.Name = "Sparkle"
		Sparkle.Parent = PlayerEntry
		Sparkle.BackgroundTransparency = 1
		Sparkle.Size = UDim2.new(0, 10, 0, 10)
		Sparkle.Font = Enum.Font.GothamBold
		Sparkle.Text = "✦"
		Sparkle.TextColor3 = Color3.fromRGB(255, 255, 255)
		Sparkle.TextTransparency = 0.8
		Sparkle.TextSize = 10
		Sparkle.ZIndex = 3
		Sparkle.Rotation = math.random(0, 360)
		Sparkle.Position = UDim2.new(math.random(), 0, math.random(), 0)

		-- Animate and remove sparkle
		spawn(function()
			local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:Create(Sparkle, tweenInfo, {
				TextTransparency = 1,
				Rotation = Sparkle.Rotation + math.random(-180, 180),
				Position = UDim2.new(Sparkle.Position.X.Scale + math.random(-0.2, 0.2), 0, 
					Sparkle.Position.Y.Scale + math.random(-0.2, 0.2), 0),
				TextSize = 8
			})
			tween:Play()

			tween.Completed:Connect(function()
				Sparkle:Destroy()
			end)
		end)
	end

	-- Create random sparkles
	if math.random() > 0.6 then
		spawn(function()
			while PlayerEntry.Parent do
				createSparkle()
				wait(math.random(3, 6))
			end
		end)
	end

	-- Create on-click sparkles
	PlayerEntry.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			for i = 1, 3 do
				createSparkle()
			end
		end
	end)

	-- Create entry with a cute pop-in effect
	PlayerEntry.Size = UDim2.new(0, 0, 0, 0)
	PlayerEntry.BackgroundTransparency = 1

	TweenService:Create(PlayerEntry, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 0, 34), -- Match the new height
		BackgroundTransparency = 0.6
	}):Play()

	-- Update ScrollingFrame canvas size
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 16)
end

-- Function to remove a player entry
local function removePlayerEntry(plr)
	local entry = ScrollingFrame:FindFirstChild(plr.Name)
	if entry then
		-- Add pop-out effect
		TweenService:Create(entry, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1
		}):Play()

		-- Wait for animation to complete before removing
		delay(0.3, function()
			entry:Destroy()
			-- Update ScrollingFrame canvas size
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 16)
		end)
	end
end

-- Update player count (without changing the PlayerList size)
local function updatePlayerCount()
	local count = #Players:GetPlayers()
	PlayerCount.Text = count .. " player" .. (count ~= 1 and "s" or "") .. " online"
	
	-- Removed the code that changes PlayerList height
	-- The PlayerList will remain at its fixed size of UDim2.new(0, 200, 0, 300)
end

-- Add existing players
for _, plr in pairs(Players:GetPlayers()) do
	createPlayerEntry(plr)
end
updatePlayerCount()

-- Connect events for player joining and leaving
Players.PlayerAdded:Connect(function(plr)
	createPlayerEntry(plr)
	updatePlayerCount()
end)

Players.PlayerRemoving:Connect(function(plr)
	removePlayerEntry(plr)
	updatePlayerCount()
end)
