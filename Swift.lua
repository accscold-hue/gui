-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/accscold-hue/gui/refs/heads/main/uilib.lua'))()

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "Swift.XYZ",
   Icon = 0,
   LoadingTitle = "Swift.XYZ",
   LoadingSubtitle = " ",
   ShowText = "Test Gui",
   Theme = "Amethyst",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = ""
   },
   Discord = {
      Enabled = true,
      Invite = "CFmHhXG9GV",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Key",
      Subtitle = "Key System",
      Note = "Join The Discord",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"SwiftOnTop"}
   }
})

-- Notification
Rayfield:Notify({
   Title = "Swift.XYZ",
   Content = "Swift has been injected!",
   Duration = 5,
   Image = 4483362458,
})

-- ======= Main Menu Tab =======
local MainTab = Window:CreateTab("Main Menu", 4483362458)
local MainSection = MainTab:CreateSection("Misc")

-- Join Discord Button
MainTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        local url = "https://discord.gg/CFmHhXG9GV"
        setclipboard(url)
        Rayfield:Notify({
            Title = " ",
            Content = "Discord link copied to clipboard!",
            Duration = 5,
            Image = 4483362458,
        })
    end,
})

-- Destroy UI Button
MainTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
       Rayfield:Destroy()
   end,
})

-- Server Section
local ServerSection = MainTab:CreateSection("Server")

-- Disconnect Button
MainTab:CreateButton({
    Name = "Disconnect",
    Callback = function()
        game.Players.LocalPlayer:Kick("Thanks for using Swift.XYZ!")
    end,
})

-- ServerHop Button
MainTab:CreateButton({
    Name = "ServerHop",
    Callback = function()
        local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
        module:Teleport(game.PlaceId)
    end,
})

-- ======= Player Tab =======
local PlayerTab = Window:CreateTab("Player", 4483362458)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Update Humanoid on respawn
Player.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
end)

-- Walk Speed Slider
local SpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = Humanoid.WalkSpeed,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end,
})

-- Reset Walk Speed Button
PlayerTab:CreateButton({
    Name = "Reset Speed",
    Callback = function()
        SpeedSlider:Set(16) -- The new slider integer value
    end,
})

-- ======= Fun Tab =======
local FunTab = Window:CreateTab("Fun", 4483362458)
-- Add fun features here if needed

-- Load saved configuration
Rayfield:LoadConfiguration()
