repeat wait() until game:IsLoaded()
if game:GetService("ReplicatedStorage").PlayerMoney[tostring(game.Players.LocalPlayer)].OwnsTycoon.Value == nil then
    for i, v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetDescendants()) do
        if v.Name == "Touch to claim!" and v:FindFirstChild("Head") then
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Head, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Head, 1)
        end
    end
end
wait(1)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local win = library:Window(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
function tycon()
    for i, v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetChildren()) do
        if v and v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end
win:Toggle("Auto Click Machine", false, function(v)
    getgenv().click = v
    while getgenv().click do
        wait()
        fireclickdetector(tycon().Essentials.Drop0.Model.clicker.ClickDetector)
        wait()
        for i, v in pairs(tycon():GetChildren()) do
            if v.Name == "clicker" then
                fireclickdetector(v.ClickDetector)
            end
        end
    end
end)
function tycoon()
    for i, v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetChildren()) do
        if v and v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end
win:Toggle("Auto Claim Money", false, function(v)
    getgenv().claim = v
    while getgenv().claim do
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), tycoon().Essentials.Giver, 0)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), tycoon().Essentials.Giver, 1)
    end
end)
function tycoons()
    for i, v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetChildren()) do
        if v and v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end
win:Toggle("Auto Buy Pad", false, function(v)
    getgenv().buy = v
    while getgenv().buy do
        wait()
        for i, v in pairs(tycoons().Buttons:GetDescendants()) do
            if not v:FindFirstChild("DevProduct") then
                if v:FindFirstChild("Head") then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Head, 0)
                    wait()
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v.Head, 1)
                    wait()
                    game:GetService("Players").LocalPlayer.PlayerGui["Main Gui"].Notif.Back.Visible = false
                end
            end
        end
    end
end)
win:Toggle("Auto Steal Money", false, function(v)
    getgenv().steal = v
    while getgenv().steal do
        wait()
        for f, g in pairs(game.workspace:GetDescendants()) do
            if g.Name == "Owner" then
                if g.Value ~= game:GetService("Players").LocalPlayer then
                    for f, h in pairs(g.Parent:GetChildren()) do
                        for f, i in pairs(h:GetChildren()) do
                            if h.Name == "Essentials" then
                                if i.Name == "Giver" then
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), i, 0)
                                    wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), i, 1)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
win:Button("Steal Gear", function()
    for i, v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetChildren()) do
        if v then
            for i, v in pairs(v:GetChildren()) do
                if v.Name == "Giver" then
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 0)
                    wait()
                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 1)
                end
            end
        end
    end
    for f, g in pairs(game.workspace:GetDescendants()) do
        if g.Name == "Owner" then
            if g.Value ~= game:GetService("Players").LocalPlayer then
                for f, h in pairs(g.Parent:GetChildren()) do
                    for f, i in pairs(h:GetChildren()) do
                        if h.Name == "PurchasedObjects" then
                            for i, v in pairs(i:GetDescendants()) do
                                if v.Name == "Giver" then
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 0)
                                    wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 1)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
win:Toggle("Collect Crate", false, function(v)
    getgenv().crate = v
    while getgenv().crate do
        wait()
        for i, v in pairs(game:GetService("Workspace").Crates:GetDescendants()) do
            if v.ClassName == "Part" then
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 0)
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 1)
                wait()
                firesignal(game:GetService("Players").LocalPlayer.PlayerGui["Main Gui"].Crates.CrateGui.Skip.Activated)
            end
        end
    end
end)
function tycooon()
    for i, v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetChildren()) do
        if v and v.Owner.Value == game.Players.LocalPlayer then
            return v
        end
    end
end
win:Button("Tp Tycoon", function()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = tycooon().Essentials.Spawn.CFrame * CFrame.new(0, 3, 0)
end)
