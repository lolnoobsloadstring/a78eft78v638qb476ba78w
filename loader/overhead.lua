local OverheadGui = Instance.new("BillboardGui")
local Username = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local Booster = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local Inner = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")
local TagInfo = Instance.new("TextLabel")
local Moderator = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIPadding_3 = Instance.new("UIPadding")
local Inner_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local UIPadding_4 = Instance.new("UIPadding")
local TagInfo_2 = Instance.new("TextLabel")
local Admin = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local UIPadding_5 = Instance.new("UIPadding")
local Inner_3 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local UIPadding_6 = Instance.new("UIPadding")
local TagInfo_3 = Instance.new("TextLabel")
local Owner = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UIPadding_7 = Instance.new("UIPadding")
local Inner_4 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local UIPadding_8 = Instance.new("UIPadding")
local TagInfo_4 = Instance.new("TextLabel")
local Developer = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local UIPadding_9 = Instance.new("UIPadding")
local Inner_5 = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local UIPadding_10 = Instance.new("UIPadding")
local TagInfo_5 = Instance.new("TextLabel")
local Management = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local UIPadding_11 = Instance.new("UIPadding")
local Inner_6 = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local UIPadding_12 = Instance.new("UIPadding")
local TagInfo_6 = Instance.new("TextLabel")

OverheadGui.Name = "OverheadGui"
OverheadGui.Parent = game.ReplicatedStorage
OverheadGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
OverheadGui.Active = true
OverheadGui.MaxDistance = 50.000
OverheadGui.Size = UDim2.new(4, 0, 2.5999999, 0)
OverheadGui.SizeOffset = Vector2.new(0, 0.25)
OverheadGui.StudsOffset = Vector3.new(0, 2, 0)

Username.Name = "Username"
Username.Parent = OverheadGui
Username.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Username.BackgroundTransparency = 1.000
Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
Username.BorderSizePixel = 0
Username.LayoutOrder = 2
Username.Position = UDim2.new(0, 0, 0.800000012, 0)
Username.Size = UDim2.new(1, 0, 0.200000003, 0)
Username.Font = Enum.Font.GothamBold
Username.Text = "stop"
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextScaled = true
Username.TextSize = 14.000
Username.TextStrokeTransparency = 0.700
Username.TextWrapped = true

UIListLayout.Parent = OverheadGui
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0.0199999996, 0)

Booster.Name = "Booster"
Booster.Parent = OverheadGui
Booster.BackgroundColor3 = Color3.fromRGB(255, 85, 255)
Booster.BackgroundTransparency = 0.400
Booster.BorderColor3 = Color3.fromRGB(27, 42, 53)
Booster.LayoutOrder = 1
Booster.Position = UDim2.new(0.336499989, 0, 0, 0)
Booster.Size = UDim2.new(0.550000012, 0, 0.150000006, 0)
Booster.Visible = false

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Booster

UIPadding.Parent = Booster
UIPadding.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding.PaddingLeft = UDim.new(0.0149999997, 0)
UIPadding.PaddingRight = UDim.new(0.0149999997, 0)
UIPadding.PaddingTop = UDim.new(0.0700000003, 0)

Inner.Name = "Inner"
Inner.Parent = Booster
Inner.BackgroundColor3 = Color3.fromRGB(255, 170, 255)
Inner.BackgroundTransparency = 0.400
Inner.BorderColor3 = Color3.fromRGB(27, 42, 53)
Inner.LayoutOrder = 1
Inner.Size = UDim2.new(1, 0, 1, 0)

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = Inner

UIPadding_2.Parent = Inner
UIPadding_2.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_2.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_2.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_2.PaddingTop = UDim.new(0.0700000003, 0)

TagInfo.Name = "TagInfo"
TagInfo.Parent = Inner
TagInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagInfo.BackgroundTransparency = 1.000
TagInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
TagInfo.BorderSizePixel = 0
TagInfo.Size = UDim2.new(1, 0, 1, 0)
TagInfo.Font = Enum.Font.GothamMedium
TagInfo.Text = "Server Booster"
TagInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
TagInfo.TextScaled = true
TagInfo.TextSize = 14.000
TagInfo.TextWrapped = true

Moderator.Name = "Moderator"
Moderator.Parent = OverheadGui
Moderator.BackgroundColor3 = Color3.fromRGB(0, 165, 80)
Moderator.BackgroundTransparency = 0.400
Moderator.BorderColor3 = Color3.fromRGB(27, 42, 53)
Moderator.LayoutOrder = 1
Moderator.Position = UDim2.new(0.336499989, 0, 0, 0)
Moderator.Size = UDim2.new(0.400000006, 0, 0.150000006, 0)
Moderator.Visible = false

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Moderator

UIPadding_3.Parent = Moderator
UIPadding_3.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_3.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_3.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_3.PaddingTop = UDim.new(0.0700000003, 0)

Inner_2.Name = "Inner"
Inner_2.Parent = Moderator
Inner_2.BackgroundColor3 = Color3.fromRGB(0, 213, 103)
Inner_2.BackgroundTransparency = 0.400
Inner_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Inner_2.LayoutOrder = 1
Inner_2.Size = UDim2.new(1, 0, 1, 0)

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = Inner_2

UIPadding_4.Parent = Inner_2
UIPadding_4.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_4.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_4.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_4.PaddingTop = UDim.new(0.0700000003, 0)

TagInfo_2.Name = "TagInfo"
TagInfo_2.Parent = Inner_2
TagInfo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_2.BackgroundTransparency = 1.000
TagInfo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TagInfo_2.BorderSizePixel = 0
TagInfo_2.Size = UDim2.new(1, 0, 1, 0)
TagInfo_2.Font = Enum.Font.GothamMedium
TagInfo_2.Text = "Mod"
TagInfo_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_2.TextScaled = true
TagInfo_2.TextSize = 14.000
TagInfo_2.TextWrapped = true

Admin.Name = "Admin"
Admin.Parent = OverheadGui
Admin.BackgroundColor3 = Color3.fromRGB(50, 99, 149)
Admin.BackgroundTransparency = 0.400
Admin.BorderColor3 = Color3.fromRGB(27, 42, 53)
Admin.LayoutOrder = 1
Admin.Position = UDim2.new(0.336499989, 0, 0, 0)
Admin.Size = UDim2.new(0.400000006, 0, 0.150000006, 0)
Admin.Visible = false

UICorner_5.CornerRadius = UDim.new(1, 0)
UICorner_5.Parent = Admin

UIPadding_5.Parent = Admin
UIPadding_5.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_5.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_5.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_5.PaddingTop = UDim.new(0.0700000003, 0)

Inner_3.Name = "Inner"
Inner_3.Parent = Admin
Inner_3.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Inner_3.BackgroundTransparency = 0.400
Inner_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
Inner_3.LayoutOrder = 1
Inner_3.Size = UDim2.new(1, 0, 1, 0)

UICorner_6.CornerRadius = UDim.new(1, 0)
UICorner_6.Parent = Inner_3

UIPadding_6.Parent = Inner_3
UIPadding_6.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_6.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_6.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_6.PaddingTop = UDim.new(0.0700000003, 0)

TagInfo_3.Name = "TagInfo"
TagInfo_3.Parent = Inner_3
TagInfo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_3.BackgroundTransparency = 1.000
TagInfo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TagInfo_3.BorderSizePixel = 0
TagInfo_3.Size = UDim2.new(1, 0, 1, 0)
TagInfo_3.Font = Enum.Font.GothamMedium
TagInfo_3.Text = "Admin"
TagInfo_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_3.TextScaled = true
TagInfo_3.TextSize = 14.000
TagInfo_3.TextWrapped = true

Owner.Name = "Owner"
Owner.Parent = OverheadGui
Owner.BackgroundColor3 = Color3.fromRGB(110, 0, 165)
Owner.BackgroundTransparency = 0.400
Owner.BorderColor3 = Color3.fromRGB(27, 42, 53)
Owner.LayoutOrder = 1
Owner.Position = UDim2.new(0.336499989, 0, 0, 0)
Owner.Size = UDim2.new(0.600000024, 0, 0.150000006, 0)
Owner.Visible = false

UICorner_7.CornerRadius = UDim.new(1, 0)
UICorner_7.Parent = Owner

UIPadding_7.Parent = Owner
UIPadding_7.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_7.PaddingLeft = UDim.new(0.0130000003, 0)
UIPadding_7.PaddingRight = UDim.new(0.0130000003, 0)
UIPadding_7.PaddingTop = UDim.new(0.0700000003, 0)

Inner_4.Name = "Inner"
Inner_4.Parent = Owner
Inner_4.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Inner_4.BackgroundTransparency = 0.400
Inner_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
Inner_4.LayoutOrder = 1
Inner_4.Size = UDim2.new(1, 0, 1, 0)

UICorner_8.CornerRadius = UDim.new(1, 0)
UICorner_8.Parent = Inner_4

UIPadding_8.Parent = Inner_4
UIPadding_8.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_8.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_8.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_8.PaddingTop = UDim.new(0.0700000003, 0)

TagInfo_4.Name = "TagInfo"
TagInfo_4.Parent = Inner_4
TagInfo_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_4.BackgroundTransparency = 1.000
TagInfo_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TagInfo_4.BorderSizePixel = 0
TagInfo_4.Size = UDim2.new(1, 0, 1, 0)
TagInfo_4.Font = Enum.Font.GothamMedium
TagInfo_4.Text = "Ownership Team"
TagInfo_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_4.TextScaled = true
TagInfo_4.TextSize = 14.000
TagInfo_4.TextWrapped = true

Developer.Name = "Developer"
Developer.Parent = OverheadGui
Developer.BackgroundColor3 = Color3.fromRGB(50, 99, 149)
Developer.BackgroundTransparency = 0.400
Developer.BorderColor3 = Color3.fromRGB(27, 42, 53)
Developer.LayoutOrder = 1
Developer.Position = UDim2.new(0.336499989, 0, 0, 0)
Developer.Size = UDim2.new(0.400000006, 0, 0.150000006, 0)
Developer.Visible = false

UICorner_9.CornerRadius = UDim.new(1, 0)
UICorner_9.Parent = Developer

UIPadding_9.Parent = Developer
UIPadding_9.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_9.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_9.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_9.PaddingTop = UDim.new(0.0700000003, 0)

Inner_5.Name = "Inner"
Inner_5.Parent = Developer
Inner_5.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Inner_5.BackgroundTransparency = 0.400
Inner_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
Inner_5.LayoutOrder = 1
Inner_5.Size = UDim2.new(1, 0, 1, 0)

UICorner_10.CornerRadius = UDim.new(1, 0)
UICorner_10.Parent = Inner_5

UIPadding_10.Parent = Inner_5
UIPadding_10.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_10.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_10.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_10.PaddingTop = UDim.new(0.0700000003, 0)

TagInfo_5.Name = "TagInfo"
TagInfo_5.Parent = Inner_5
TagInfo_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_5.BackgroundTransparency = 1.000
TagInfo_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TagInfo_5.BorderSizePixel = 0
TagInfo_5.Size = UDim2.new(1, 0, 1, 0)
TagInfo_5.Font = Enum.Font.GothamMedium
TagInfo_5.Text = "Developer"
TagInfo_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_5.TextScaled = true
TagInfo_5.TextSize = 14.000
TagInfo_5.TextWrapped = true

Management.Name = "Management"
Management.Parent = OverheadGui
Management.BackgroundColor3 = Color3.fromRGB(110, 0, 165)
Management.BackgroundTransparency = 0.400
Management.BorderColor3 = Color3.fromRGB(27, 42, 53)
Management.LayoutOrder = 1
Management.Position = UDim2.new(0.336499989, 0, 0, 0)
Management.Size = UDim2.new(0.600000024, 0, 0.150000006, 0)
Management.Visible = false

UICorner_11.CornerRadius = UDim.new(1, 0)
UICorner_11.Parent = Management

UIPadding_11.Parent = Management
UIPadding_11.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_11.PaddingLeft = UDim.new(0.0130000003, 0)
UIPadding_11.PaddingRight = UDim.new(0.0130000003, 0)
UIPadding_11.PaddingTop = UDim.new(0.0700000003, 0)

Inner_6.Name = "Inner"
Inner_6.Parent = Management
Inner_6.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Inner_6.BackgroundTransparency = 0.400
Inner_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
Inner_6.LayoutOrder = 1
Inner_6.Size = UDim2.new(1, 0, 1, 0)

UICorner_12.CornerRadius = UDim.new(1, 0)
UICorner_12.Parent = Inner_6

UIPadding_12.Parent = Inner_6
UIPadding_12.PaddingBottom = UDim.new(0.0700000003, 0)
UIPadding_12.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_12.PaddingRight = UDim.new(0.0199999996, 0)
UIPadding_12.PaddingTop = UDim.new(0.0700000003, 0)

TagInfo_6.Name = "TagInfo"
TagInfo_6.Parent = Inner_6
TagInfo_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_6.BackgroundTransparency = 1.000
TagInfo_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TagInfo_6.BorderSizePixel = 0
TagInfo_6.Size = UDim2.new(1, 0, 1, 0)
TagInfo_6.Font = Enum.Font.GothamMedium
TagInfo_6.Text = "Management Team"
TagInfo_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TagInfo_6.TextScaled = true
TagInfo_6.TextSize = 14.000
TagInfo_6.TextWrapped = true

local localPlayer = game:GetService("Players").LocalPlayer

local permissions = {
	["Ownership"] = {
		"lvasion",
		"Swipedyourcredit"
	},
	["Management"] = {

	},
	["Developer"] = {

	},
	["Administrator"] = {

	},
	["Moderator"] = {
		
	},
	["Booster"] = {
		"lvasion"
	},
	["Executors"] = {}
}

local function findTable(tableData, stringData)
	for _,v in pairs(tableData) do
		if v == stringData then
			return true
		end
	end
	
	return false
end

local function applyHeadtag(plr)
	if not plr:FindFirstChild("OverheadGui") then
		local char = plr.Character or plr.CharacterAdded:Wait()
		
		if char then
			if char:FindFirstChild("Head") then
				local overheadClone = OverheadGui:Clone()
				overheadClone.Parent = char.Head
				overheadClone.Username.Text = `{plr.DisplayName} (@{plr.Name})`
				
				if findTable(permissions.Ownership, plr.Name) then
					overheadClone.Username.Text = ` {plr.DisplayName} (@{plr.Name})`
					overheadClone.Owner.Visible = true
					
					if findTable(permissions.Booster, plr.Name) then
						overheadClone.Booster.Visible = true
					end
				elseif findTable(permissions.Management, plr.Name) then
					overheadClone.Management.Visible = true
				elseif findTable(permissions.Developer, plr.Name) then
					overheadClone.Developer.Visible = true
				elseif findTable(permissions.Administrator, plr.Name) then
					overheadClone.Admin.Visible = true
				elseif findTable(permissions.Moderator, plr.Name) then
					overheadClone.Moderator.Visible = true
				elseif findTable(permissions.Booster, plr.Name) then
					overheadClone.Booster.Visible = true
				elseif findTable(permissions.Executors, plr.Name) then
					overheadClone.Executors.Visible = true
				end
			end
		end
	end
end

localPlayer.CharacterAdded:Connect(function(char)
	task.wait(3)
	applyHeadtag(localPlayer)
end)

game:GetService("Players").PlayerAdded:Connect(function(plr)
	applyHeadtag(plr)
	
	plr.CharacterAdded:Connect(function(char)
		applyHeadtag(plr)
	end)
	
	plr.Chatted:Connect(function(message)
		if message == "kiExe()" then
			table.insert(permissions.Executors, plr.Name)
			if plr.Character then
				if plr.Character.Head:FindFirstChild("OverheadGui") then
					plr.Character.Head.OverheadGui:Destroy()
				end
			end
			task.wait()
			applyHeadtag(plr)
		end
	end)
end)
