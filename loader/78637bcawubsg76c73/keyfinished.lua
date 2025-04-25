local success, error = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/games/" .. game.PlaceId .. ".lua"))()
end)

if not success then
    -- Create modern warning UI with red gradient theme
    local WarningUI = Instance.new("ScreenGui")
    local MainContainer = Instance.new("Frame")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local CloseButton = Instance.new("ImageButton")
    local WarningIcon = Instance.new("ImageLabel")
    local WarningMessage = Instance.new("TextLabel")
    local ButtonsHolder = Instance.new("Frame")
    local DiscordButton = Instance.new("TextButton")
    local DiscordIcon = Instance.new("ImageLabel")
    local CloseWarningButton = Instance.new("TextButton")
    local Blur = Instance.new("BlurEffect")
    
    -- Configure UI
    WarningUI.Name = "UltraModernWarning"
    WarningUI.Parent = game.CoreGui
    WarningUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    WarningUI.IgnoreGuiInset = true
    
    -- Add blur effect to the game
    Blur.Name = "WarningBlur"
    Blur.Parent = game.Lighting
    Blur.Size = 0
    
    -- Main container with backdrop
    MainContainer.Name = "MainContainer"
    MainContainer.Parent = WarningUI
    MainContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainContainer.BackgroundTransparency = 0.4
    MainContainer.BorderSizePixel = 0
    MainContainer.Size = UDim2.new(1, 0, 1, 0)
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainContainer
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 380, 0, 220)
    MainFrame.BorderSizePixel = 0
    
    -- Create gradient
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 30, 45))
    })
    UIGradient.Rotation = 45
    UIGradient.Parent = MainFrame
    
    -- Add glass effect
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    UIStroke.Transparency = 0.8
    UIStroke.Thickness = 1.5
    UIStroke.Parent = MainFrame
    
    -- Add rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Add shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = MainFrame
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Size = UDim2.new(1, 50, 1, 50)
    Shadow.ZIndex = -1
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.6
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundTransparency = 1
    TopBar.Size = UDim2.new(1, 0, 0, 36)
    
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 16, 0, 0)
    Title.Size = UDim2.new(1, -50, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Game Not Supported"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Create modern close button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(1, -26, 0.5, -8)
    CloseButton.Size = UDim2.new(0, 16, 0, 16)
    CloseButton.Image = "rbxassetid://9125292145" -- Close X icon
    CloseButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Warning icon
    WarningIcon.Name = "WarningIcon"
    WarningIcon.Parent = MainFrame
    WarningIcon.BackgroundTransparency = 1
    WarningIcon.Position = UDim2.new(0, 20, 0, 45)
    WarningIcon.Size = UDim2.new(0, 32, 0, 32)
    WarningIcon.Image = "rbxassetid://9072944922" -- Warning icon
    WarningIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    
    WarningMessage.Name = "WarningMessage"
    WarningMessage.Parent = MainFrame
    WarningMessage.BackgroundTransparency = 1
    WarningMessage.Position = UDim2.new(0, 62, 0, 45)
    WarningMessage.Size = UDim2.new(1, -82, 0, 80)
    WarningMessage.Font = Enum.Font.GothamMedium
    WarningMessage.Text = "This game is not currently supported by our script. Please join our Discord server for updates or to request support for this game."
    WarningMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
    WarningMessage.TextSize = 14
    WarningMessage.TextWrapped = true
    WarningMessage.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Button holder
    ButtonsHolder.Name = "ButtonsHolder"
    ButtonsHolder.Parent = MainFrame
    ButtonsHolder.BackgroundTransparency = 1
    ButtonsHolder.Position = UDim2.new(0, 0, 0.75, 0)
    ButtonsHolder.Size = UDim2.new(1, 0, 0, 45)
    
    -- Discord button with icon
    DiscordButton.Name = "DiscordButton"
    DiscordButton.Parent = ButtonsHolder
    DiscordButton.AnchorPoint = Vector2.new(0, 0.5)
    DiscordButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DiscordButton.BackgroundTransparency = 0.9
    DiscordButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    DiscordButton.Size = UDim2.new(0.35, 0, 0, 38)
    DiscordButton.Font = Enum.Font.GothamBold
    DiscordButton.Text = "  Copy Discord"
    DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordButton.TextSize = 14
    
    -- Add rounded corners to Discord button
    local DiscordCorner = Instance.new("UICorner")
    DiscordCorner.CornerRadius = UDim.new(0, 8)
    DiscordCorner.Parent = DiscordButton
    
    -- Discord icon
    DiscordIcon.Name = "DiscordIcon"
    DiscordIcon.Parent = DiscordButton
    DiscordIcon.BackgroundTransparency = 1
    DiscordIcon.Position = UDim2.new(0, 10, 0.5, -8)
    DiscordIcon.Size = UDim2.new(0, 16, 0, 16)
    DiscordIcon.Image = "rbxassetid://9125454560" -- Discord icon
    DiscordIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Create hover effect for Discord button
    local DiscordButtonStroke = Instance.new("UIStroke")
    DiscordButtonStroke.Color = Color3.fromRGB(255, 255, 255)
    DiscordButtonStroke.Transparency = 0.7
    DiscordButtonStroke.Thickness = 1
    DiscordButtonStroke.Parent = DiscordButton
    
    CloseWarningButton.Name = "CloseWarningButton"
    CloseWarningButton.Parent = ButtonsHolder
    CloseWarningButton.AnchorPoint = Vector2.new(0, 0.5)
    CloseWarningButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseWarningButton.BackgroundTransparency = 0.9
    CloseWarningButton.Position = UDim2.new(0.55, 0, 0.5, 0)
    CloseWarningButton.Size = UDim2.new(0.35, 0, 0, 38)
    CloseWarningButton.Font = Enum.Font.GothamSemibold
    CloseWarningButton.Text = "Close"
    CloseWarningButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseWarningButton.TextSize = 14
    
    -- Add rounded corners to Close button
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseWarningButton
    
    -- Create hover effect for Close button
    local CloseButtonStroke = Instance.new("UIStroke")
    CloseButtonStroke.Color = Color3.fromRGB(255, 255, 255)
    CloseButtonStroke.Transparency = 0.7
    CloseButtonStroke.Thickness = 1
    CloseButtonStroke.Parent = CloseWarningButton
    
    -- Button functionality
    CloseButton.MouseButton1Click:Connect(function()
        -- Fade out animation
        for i = 10, 0, -1 do
            MainFrame.BackgroundTransparency = 1 - (i/10)
            UIStroke.Transparency = 0.8 + ((10-i)/50)
            Shadow.ImageTransparency = 0.6 + ((10-i)/25)
            MainContainer.BackgroundTransparency = 0.4 + ((10-i)/16.67)
            Blur.Size = (i * 2)
            wait(0.02)
        end
        WarningUI:Destroy()
        Blur:Destroy()
    end)
    
    CloseWarningButton.MouseButton1Click:Connect(function()
        -- Fade out animation
        for i = 10, 0, -1 do
            MainFrame.BackgroundTransparency = 1 - (i/10)
            UIStroke.Transparency = 0.8 + ((10-i)/50)
            Shadow.ImageTransparency = 0.6 + ((10-i)/25)
            MainContainer.BackgroundTransparency = 0.4 + ((10-i)/16.67)
            Blur.Size = (i * 2)
            wait(0.02)
        end
        WarningUI:Destroy()
        Blur:Destroy()
    end)
    
    DiscordButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/brkA4V6Ucd")
        
        -- Show copied notification
        local oldText = DiscordButton.Text
        DiscordButton.Text = "  Copied!"
        
        -- Pulse animation
        for i = 1, 6 do
            if i % 2 == 0 then
                DiscordButtonStroke.Color = Color3.fromRGB(255, 255, 255)
            else
                DiscordButtonStroke.Color = Color3.fromRGB(100, 255, 100)
            end
            wait(0.2)
        end
        
        DiscordButton.Text = oldText
        DiscordButtonStroke.Color = Color3.fromRGB(255, 255, 255)
    end)
    
    -- Add hover effects
    DiscordButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(DiscordButton, TweenInfo.new(0.3), {BackgroundTransparency = 0.8}):Play()
    end)
    
    DiscordButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(DiscordButton, TweenInfo.new(0.3), {BackgroundTransparency = 0.9}):Play()
    end)
    
    CloseWarningButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(CloseWarningButton, TweenInfo.new(0.3), {BackgroundTransparency = 0.8}):Play()
    end)
    
    CloseWarningButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(CloseWarningButton, TweenInfo.new(0.3), {BackgroundTransparency = 0.9}):Play()
    end)
    
    -- Entrance animation
    MainFrame.BackgroundTransparency = 1
    MainContainer.BackgroundTransparency = 1
    UIStroke.Transparency = 1
    Shadow.ImageTransparency = 1
    
    -- Initial position (slightly above center)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, -20)
    
    -- Smooth entrance animation
    for i = 0, 10 do
        MainFrame.BackgroundTransparency = 1 - (i/10)
        MainContainer.BackgroundTransparency = 1 - (i/16.67)
        UIStroke.Transparency = 1 - (i/50)
        Shadow.ImageTransparency = 1 - (i/25)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, -20 + (i*2))
        Blur.Size = i * 2
        wait(0.02)
    end
    
    -- Add subtle floating animation
    spawn(function()
        while MainFrame.Parent do
            -- Subtle floating effect
            game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), 
                {Position = UDim2.new(0.5, 0, 0.5, 3)}):Play()
            wait(2)
            game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), 
                {Position = UDim2.new(0.5, 0, 0.5, -3)}):Play()
            wait(2)
        end
    end)
end
