local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.TeamColor = false
ESP.Color = Color3.fromRGB(255, 255, 255)
local Window = Fluent:CreateWindow({
    Title = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name),
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Minus
})
local Tabs = {
    Main = Window:AddTab({Title = "Main", Icon = "contact"}),
    Puzzle = Window:AddTab({Title = "Puzzle", Icon = "puzzle"}),
    Esp = Window:AddTab({Title = "Esp", Icon = "rss"}),
    Teleport = Window:AddTab({Title = "Teleport", Icon = "venetian-mask"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "more-horizontal"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})}
Tabs.Main:AddToggle("Collect Coin", {
    Title = "Auto Collect Coin",
    Default = false,
    Callback = function(v)
        getgenv().CollectCoin = v
        while getgenv().CollectCoin do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                firetouchinterest(game.Players.LocalPlayer.Character
                    .HumanoidRootPart,
                    game:GetService("Workspace").Obby.Quidz, 0)
                firetouchinterest(game.Players.LocalPlayer.Character
                    .HumanoidRootPart,
                    game:GetService("Workspace").Obby.Quidz, 1)
            end
        end
    end
})
Tabs.Main:AddToggle("Kill All", {
    Title = "Auto Kill All",
    Default = false,
    Callback = function(v)
        getgenv().KillAll = v
        while getgenv().KillAll do
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if game:GetService("Players").LocalPlayer.PlayerGui.GameUI
                        .InGameDisplay.BearNote.Visible == true and
                        game.Players.LocalPlayer.Character:FindFirstChild(
                            "HumanoidRootPart") then
                        if v.Character and
                            v.Character:FindFirstChild("HumanoidRootPart") then
                            firetouchinterest(
                                game.Players.LocalPlayer.Character.HumanoidRootPart,
                                v.Character.HumanoidRootPart, 0)
                            firetouchinterest(
                                game.Players.LocalPlayer.Character.HumanoidRootPart,
                                v.Character.HumanoidRootPart, 1)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddButton({
    Title = "Inf Stamina",
    Callback = function()
        local stamina = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.InGameDisplay.StaminaDisplay.Current
        local hook
        hook = hookmetamethod(game, "__index", newcclosure(function(self, arg)
            if self == stamina and arg == "Value" then
                return 100
            end
            return hook(self, arg)
        end))
    end
})
Tabs.Puzzle:AddToggle("Wire", {
    Title = "Auto Wire Puzzle",
    Default = false,
    Callback = function(v)
        getgenv().Wire = v
        while getgenv().Wire do
            wait()
            for i, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Folder") and v.Name == "Wires" then
                    for i, c in pairs(v:GetDescendants()) do
                        if c.ClassName == "ClickDetector" then
                            fireclickdetector(c)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Puzzle:AddButton({
    Title = "Color Code Puzzle",
    Callback = function()
        pcall(function()
            while wait() do
                if not game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[1] then break end
                if game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[1].Note.Label.Text ~= game:GetService("Workspace").PuzzleBin.ColorCode.Clue.Note.Frame[1].Text then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[1].ClickDetector)
                end
                if game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[2].Note.Label.Text ~= game:GetService("Workspace").PuzzleBin.ColorCode.Clue.Note.Frame[2].Text then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[2].ClickDetector)
                end
                if game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[3].Note.Label.Text ~= game:GetService("Workspace").PuzzleBin.ColorCode.Clue.Note.Frame[3].Text then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[3].ClickDetector)
                end
                if game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[4].Note.Label.Text ~= game:GetService("Workspace").PuzzleBin.ColorCode.Clue.Note.Frame[4].Text then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin.ColorCode.Buttons[4].ClickDetector)
                end
            end
        end)
    end
})
Tabs.Puzzle:AddButton({
    Title = "Cheese Altar Puzzle",
    Callback = function()
        pcall(function()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
                game:GetService("Workspace").Map["_Entities"].Cheese
                .Detect, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
                game:GetService("Workspace").Map["_Entities"].Cheese
                .Detect, 1)
            wait(1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService(
                "Players").LocalPlayer
            .Backpack
            .PuzzleCheese)
            wait(0.4)
            firetouchinterest(
                game.Players.LocalPlayer.Character.PuzzleCheese.Handle,
                game:GetService("Workspace").PuzzleBin.CheeseAltar.Detect, 0)
            firetouchinterest(
                game.Players.LocalPlayer.Character.PuzzleCheese.Handle,
                game:GetService("Workspace").PuzzleBin.CheeseAltar.Detect, 1)
            wait(0.4)
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        end)
    end
})
Tabs.Puzzle:AddToggle("Puzzle Beam", {
    Title = "Auto Puzzle Beam",
    Default = false,
    Callback = function(v)
        getgenv().Beam = v
        while getgenv().Beam do
            wait()
            for i, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Folder") and v.Name == "Puzzle | Beams" then
                    for i, c in pairs(v:GetDescendants()) do
                        if c.ClassName == "ClickDetector" then
                            fireclickdetector(c)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Puzzle:AddButton({
    Title = "Puzzle Cheese",
    Callback = function()
        pcall(function()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
                game:GetService("Workspace").PuzzleBin["Puzzle | Cheese"]
                .Cheese, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
                game:GetService("Workspace").PuzzleBin["Puzzle | Cheese"]
                .Cheese, 1)
            wait(0.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService(
                "Players").LocalPlayer
            .Backpack
            .PuzzleCheeseTool)
            wait(1)
            firetouchinterest(game.Players.LocalPlayer.Character.PuzzleCheeseTool
                .Handle,
                game:GetService("Workspace").PuzzleBin["Puzzle | Cheese"]
                .Stand, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.PuzzleCheeseTool
                .Handle,
                game:GetService("Workspace").PuzzleBin["Puzzle | Cheese"]
                .Stand, 1)
            wait(0.4)
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        end)
    end
})
Tabs.Puzzle:AddButton({
    Title = "Puzzle Color",
    Callback = function()
        pcall(function()
            while wait() do
                if not game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel1 then break end
                if game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel1.Color ~= game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Clue.Note.T1.TextColor3 then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel1.Click)
                end
                if game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel2.Color ~= game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Clue.Note.T2.TextColor3 then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel2.Click)
                end
                if game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel3.Color ~= game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Clue.Note.T3.TextColor3 then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel3.Click)
                end
                if game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel4.Color ~= game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Clue.Note.T4.TextColor3 then
                    fireclickdetector(game:GetService("Workspace").PuzzleBin["Puzzle | Color"].Interactive.Panel4.Click)
                end
            end
        end)
    end
})
Tabs.Esp:AddToggle("Enable Esp", {
    Title = "Enable Esp",
    Default = false,
    Callback = function(v)
        ESP.Players = v
    end
})
Tabs.Esp:AddToggle("Player Names", {
    Title = "Player Names",
    Default = false,
    Callback = function(v)
        ESP.Names = v
    end
})
Tabs.Esp:AddToggle("Player Tracers", {
    Title = "Player Tracers",
    Default = false,
    Callback = function(v)
        ESP.Tracers = v
    end
})
Tabs.Esp:AddToggle("Player Boxes", {
    Title = "Player Boxes",
    Default = false,
    Callback = function(v)
        ESP.Boxes = v
    end
})
Tabs.Esp:AddToggle("Esp Teamcolor", {
    Title = "Player TeamColor",
    Default = false,
    Callback = function(v)
        ESP.TeamColor = v
    end
})
Tabs.Esp:AddColorpicker("Esp ColorPick", {
    Title = "Esp Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(v)
        ESP.Color = v
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Map",
    Callback = function()
        pcall(function()
            if game:GetService("Workspace").PuzzleBin:FindFirstChild("Wire") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace").PuzzleBin.Wire.Back.CFrame *
                    CFrame.new(0, 0, 6)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    game:GetService("Workspace").PuzzleBin["Puzzle | Cheese"].Stand
                    .CFrame * CFrame.new(0, 4, 0)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Lobby",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97.9829636, 4.69609547, -22.2013416, 0.885594249, -2.53390908e-08, 0.464459687, -1.28971829e-08, 1, 7.91473695e-08, -0.464459687, -7.60826779e-08, 0.885594249)
    end
})
Tabs.Misc:AddSlider("Ws", {
    Title = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Callback = function(v)
        setws = tonumber(v)
    end
})
Tabs.Misc:AddToggle("Toggle Ws", {
    Title = "Toggle WalkSpeed",
    Default = false,
    Callback = function(v)
        getgenv().ws = v
        while getgenv().ws do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setws
            end
        end
    end
})
Tabs.Misc:AddSlider("Jp", {
    Title = "JumpPower",
    Default = 50,
    Min = 50,
    Max = 400,
    Rounding = 1,
    Callback = function(v)
        setjp = tonumber(v)
    end
})
Tabs.Misc:AddToggle("Noclip", {
    Title = "Noclip",
    Default = false,
    Callback = function(v)
        getgenv().noclip = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().noclip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true and v.Name ~= floatName then
                        v.CanCollide = false
                        if not getgenv().noclip then
                            v.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
})
Tabs.Misc:AddButton({
    Title = "Fullbright",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/06iG6YkU'))()
    end
})
spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = setjp
        end
    end
end)
-- config
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Folder")
SaveManager:SetFolder("Folder/GameFolder")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
