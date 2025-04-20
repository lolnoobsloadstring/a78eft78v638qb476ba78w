-- Modern Overhead Tags System
-- Creates sleek, properly scaled tags above player heads

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Modern tag configuration
local TagConfig = {
    Scale = 0.75,                -- Overall scale factor
    MaxDistance = 75,            -- Maximum visibility distance
    StudsOffset = Vector3.new(0, 2.5, 0),  -- Position above head
    TagSpacing = 0.06,           -- Space between tags
    AnimationDuration = 0.3,     -- Animation speed in seconds
    
    -- Font configuration
    UsernameFont = Enum.Font.GothamBold,
    TagFont = Enum.Font.GothamMedium,
    
    -- Tag styling
    TagHeight = 0.13,            -- Height of each tag
    CornerRadius = 1,            -- Rounded corner radius (1 = fully rounded)
    
    -- Color scheme (modern, vibrant colors)
    Colors = {
        Owner = {
            Outer = Color3.fromRGB(125, 50, 200),
            Inner = Color3.fromRGB(170, 80, 255),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Management = {
            Outer = Color3.fromRGB(100, 30, 180),
            Inner = Color3.fromRGB(150, 65, 235),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Developer = {
            Outer = Color3.fromRGB(30, 100, 190),
            Inner = Color3.fromRGB(65, 155, 255),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Administrator = {
            Outer = Color3.fromRGB(40, 80, 170),
            Inner = Color3.fromRGB(80, 140, 255),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Moderator = {
            Outer = Color3.fromRGB(20, 150, 80),
            Inner = Color3.fromRGB(40, 200, 110),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Booster = {
            Outer = Color3.fromRGB(200, 60, 200),
            Inner = Color3.fromRGB(255, 100, 255),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Executors = {
            Outer = Color3.fromRGB(200, 60, 110),
            Inner = Color3.fromRGB(255, 90, 150),
            Text = Color3.fromRGB(255, 255, 255)
        },
        Default = {
            Text = Color3.fromRGB(255, 255, 255)
        }
    },
    
    -- Tag texts
    TagTexts = {
        Owner = "kallia <3",
        Management = "Management",
        Developer = "Developer",
        Administrator = "Admin",
        Moderator = "Mod",
        Booster = "Server Booster",
        Executors = "ryza.us user"
    }
}

-- User permissions database
local Permissions = {
    ["Ownership"] = {
        "lvasion"
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

-- Create the base tag template
local function createTagTemplate(name, config)
    local tag = Instance.new("Frame")
    local inner = Instance.new("Frame")
    local tagInfo = Instance.new("TextLabel")
    local outerCorner = Instance.new("UICorner")
    local innerCorner = Instance.new("UICorner")
    local outerPadding = Instance.new("UIPadding")
    local innerPadding = Instance.new("UIPadding")
    
    -- Configure the tag
    tag.Name = name
    tag.BackgroundColor3 = config.Outer
    tag.BackgroundTransparency = 0.2
    tag.BorderSizePixel = 0
    tag.Size = UDim2.new(0.6, 0, TagConfig.TagHeight, 0)
    tag.AnchorPoint = Vector2.new(0.5, 0)
    tag.Position = UDim2.new(0.5, 0, 0, 0)
    tag.Visible = false
    
    -- Configure the inner frame
    inner.Name = "Inner"
    inner.Parent = tag
    inner.BackgroundColor3 = config.Inner
    inner.BackgroundTransparency = 0.2
    inner.BorderSizePixel = 0
    inner.Size = UDim2.new(1, 0, 1, 0)
    
    -- Configure rounded corners
    outerCorner.Name = "UICorner"
    outerCorner.Parent = tag
    outerCorner.CornerRadius = UDim.new(TagConfig.CornerRadius, 0)
    
    innerCorner.Name = "UICorner"
    innerCorner.Parent = inner
    innerCorner.CornerRadius = UDim.new(TagConfig.CornerRadius, 0)
    
    -- Configure padding
    outerPadding.Name = "UIPadding"
    outerPadding.Parent = tag
    outerPadding.PaddingTop = UDim.new(0.07, 0)
    outerPadding.PaddingBottom = UDim.new(0.07, 0)
    outerPadding.PaddingLeft = UDim.new(0.02, 0)
    outerPadding.PaddingRight = UDim.new(0.02, 0)
    
    innerPadding.Name = "UIPadding"
    innerPadding.Parent = inner
    innerPadding.PaddingTop = UDim.new(0.07, 0)
    innerPadding.PaddingBottom = UDim.new(0.07, 0)
    innerPadding.PaddingLeft = UDim.new(0.02, 0)
    innerPadding.PaddingRight = UDim.new(0.02, 0)
    
    -- Configure text
    tagInfo.Name = "TagInfo"
    tagInfo.Parent = inner
    tagInfo.BackgroundTransparency = 1
    tagInfo.Size = UDim2.new(1, 0, 1, 0)
    tagInfo.Font = TagConfig.TagFont
    tagInfo.Text = TagConfig.TagTexts[name] or name
    tagInfo.TextColor3 = config.Text
    tagInfo.TextScaled = true
    tagInfo.TextSize = 14
    tagInfo.TextWrapped = true
    
    return tag
end

-- Create the main overhead GUI
local function createOverheadGui()
    local gui = Instance.new("BillboardGui")
    local username = Instance.new("TextLabel")
    local layout = Instance.new("UIListLayout")
    
    -- Configure the billboard GUI
    gui.Name = "ModernOverheadGui"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Active = true
    gui.MaxDistance = TagConfig.MaxDistance
    gui.Size = UDim2.new(4 * TagConfig.Scale, 0, 2.6 * TagConfig.Scale, 0)
    gui.StudsOffset = TagConfig.StudsOffset
    gui.AlwaysOnTop = true
    gui.LightInfluence = 0
    
    -- Configure the username
    username.Name = "Username"
    username.Parent = gui
    username.BackgroundTransparency = 1
    username.Size = UDim2.new(1, 0, 0.2, 0)
    username.Font = TagConfig.UsernameFont
    username.Text = "Username"
    username.TextColor3 = TagConfig.Colors.Default.Text
    username.TextScaled = true
    username.TextStrokeTransparency = 0.5
    username.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    username.LayoutOrder = 99  -- Make username appear last
    
    -- Configure the layout
    layout.Parent = gui
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Padding = UDim.new(TagConfig.TagSpacing, 0)
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    
    -- Create and add all tag types
    for tagName, colorData in pairs(TagConfig.Colors) do
        if tagName ~= "Default" then
            local tag = createTagTemplate(tagName, colorData)
            tag.Parent = gui
            tag.LayoutOrder = 1  -- All tags appear before username
        end
    end
    
    return gui
end

-- Store the template in ReplicatedStorage
local overheadTemplate = createOverheadGui()
overheadTemplate.Parent = ReplicatedStorage

-- Helper function to check if a player is in a group
local function isInGroup(name, group)
    for _, member in pairs(Permissions[group] or {}) do
        if member == name then
            return true
        end
    end
    return false
end

-- Apply overhead tags to a player
local function applyOverheadTag(player)
    -- Wait for character and head
    local character = player.Character or player.CharacterAdded:Wait()
    if not character:FindFirstChild("Head") then
        character:WaitForChild("Head")
    end
    
    -- Remove any existing tags
    if character.Head:FindFirstChild("ModernOverheadGui") then
        character.Head.ModernOverheadGui:Destroy()
    end
    
    -- Clone and configure the new GUI
    local overheadGui = overheadTemplate:Clone()
    overheadGui.Parent = character.Head
    
    -- Set username
    overheadGui.Username.Text = string.format("%s (@%s)", player.DisplayName, player.Name)
    
    -- Determine and show appropriate tags
    if isInGroup(player.Name, "Ownership") then
        overheadGui.Owner.Visible = true
        -- Add a subtle shine effect to owner tag
        local shine = Instance.new("UIGradient")
        shine.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 200, 200)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
        })
        shine.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.9),
            NumberSequenceKeypoint.new(0.5, 0.7),
            NumberSequenceKeypoint.new(1, 0.9)
        })
        shine.Rotation = 90
        shine.Parent = overheadGui.Owner.Inner
        
        -- Animate the gradient
        spawn(function()
            while overheadGui and overheadGui.Parent do
                local tween = TweenService:Create(shine, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
                tween:Play()
                wait(2)
                shine.Offset = Vector2.new(-1, 0)
            end
        end)
    end
    
    -- Apply other tags
    if isInGroup(player.Name, "Management") then
        overheadGui.Management.Visible = true
    end
    
    if isInGroup(player.Name, "Developer") then
        overheadGui.Developer.Visible = true
    end
    
    if isInGroup(player.Name, "Administrator") then
        overheadGui.Administrator.Visible = true
    end
    
    if isInGroup(player.Name, "Moderator") then
        overheadGui.Moderator.Visible = true
    end
    
    if isInGroup(player.Name, "Booster") then
        overheadGui.Booster.Visible = true
    end
    
    if isInGroup(player.Name, "Executors") then
        overheadGui.Executors.Visible = true
    end
    
    -- Add a fade-in animation
    for _, child in pairs(overheadGui:GetChildren()) do
        if child:IsA("Frame") and child.Visible then
            child.Position = UDim2.new(0.5, 0, -0.1, 0)
            child.BackgroundTransparency = 1
            child.Inner.BackgroundTransparency = 1
            child.Inner.TagInfo.TextTransparency = 1
            
            TweenService:Create(child, TweenInfo.new(TagConfig.AnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0, 0),
                BackgroundTransparency = 0.2
            }):Play()
            
            TweenService:Create(child.Inner, TweenInfo.new(TagConfig.AnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0.2
            }):Play()
            
            TweenService:Create(child.Inner.TagInfo, TweenInfo.new(TagConfig.AnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0
            }):Play()
        end
        
        if child:IsA("TextLabel") and child.Name == "Username" then
            child.TextTransparency = 1
            child.TextStrokeTransparency = 1
            
            TweenService:Create(child, TweenInfo.new(TagConfig.AnimationDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                TextStrokeTransparency = 0.5
            }):Play()
        end
    end
end

-- Function to add a player to the executors group
local function addToExecutors(player)
    if not isInGroup(player.Name, "Executors") then
        table.insert(Permissions.Executors, player.Name)
        
        -- Reapply the tag
        if player.Character and player.Character:FindFirstChild("Head") then
            applyOverheadTag(player)
        end
    end
end

-- Apply tags when players join or characters load
local function setupPlayer(player)
    player.CharacterAdded:Connect(function()
        wait(1) -- Short delay to ensure character is fully loaded
        applyOverheadTag(player)
    end)
    
    -- Listen for the special chat message
    player.Chatted:Connect(function(message)
        if message == "ryza.us()" then
            addToExecutors(player)
        end
    end)
    
    -- Apply tags to existing character
    if player.Character then
        applyOverheadTag(player)
    end
end

-- Setup existing players
for _, player in pairs(Players:GetPlayers()) do
    setupPlayer(player)
end

-- Setup new players
Players.PlayerAdded:Connect(setupPlayer)

-- Apply tags to local player when character spawns
LocalPlayer.CharacterAdded:Connect(function()
    wait(1)
    applyOverheadTag(LocalPlayer)
end)

-- If local player already has a character, apply tags
if LocalPlayer.Character then
    wait(1)
    applyOverheadTag(LocalPlayer)
end
