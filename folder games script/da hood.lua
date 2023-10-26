local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/airesz178/Ui-Library/main/orion%20ui%20library')))()
local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnable = true, IntroText = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)})
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local plr = game:GetService("Players").LocalPlayer
local tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1.2, Enum.EasingStyle.Linear)
local sell = game:GetService("Workspace").Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector
local maxclick = sell.MaxActivationDistance
--function
function humanoid()
    if plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:WaitForChild("HumanoidRootPart") then
        return plr.Character.HumanoidRootPart
    end
end
function money()
    for i, v in game:GetService("Workspace").Ignored.Drop:GetChildren() do
        if v:IsA("Part") and v.Parent then
            if (v.Position - humanoid().Position).Magnitude < 18 then
                local click = v:WaitForChild("ClickDetector")
                local maxclick = click.MaxActivationDistance
                repeat wait()
                    if click then
                        pcall(fireclickdetector, click, maxclick)
                    end
                until not v or not v.Parent or not click or not click.Parent or not getgenv().farm
            end
        end
    end
end
function getmoneydistance()
    for i, v in game:GetService("Workspace").Ignored.Drop:GetChildren() do
        if v:IsA("Part") then
            if (v.Position - humanoid().Position).Magnitude < 18 then
                return true
            end
        end
    end
end
function combat()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Combat" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == "Combat" then
            v:Activate()
        end
    end
end
function gethp()
    for i, c in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
        if c and c.Humanoid.Health > 0 then
            return true
        end
    end
end
function lettuce()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "[Lettuce]" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == "[Lettuce]" then
            v:Activate()
        end
    end
end
function Weight()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "[HeavyWeights]" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == "[HeavyWeights]" then
            v:Activate()
        end
    end
end
--misc function
for i, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Seat") then
        v:Destroy()
    end
end
Tab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(v)
        getgenv().farm = v
        while getgenv().farm do wait(0.4)
            if money() then
                money()
            else
                for i, v in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
                    if v and v.Humanoid.Health > 0 then
                        humanoid().CFrame = v.Open.CFrame * CFrame.new(-1.6, 0, 4)
                        combat()
                    end
                end
            end
            for i, v in pairs(game:GetService("Workspace").Ignored.HospitalJob:GetChildren()) do
                if v.Name == "Can I get the Red bottle" and v:FindFirstChild("ClickDetector") and gethp() and not getmoneydistance() then
                    humanoid().CFrame = v.HumanoidRootPart.CFrame
                    fireclickdetector(game:GetService("Workspace").Ignored.HospitalJob.Red.ClickDetector)
                    fireclickdetector(v.ClickDetector)
                elseif v.Name == "Can I get the Blue bottle" and v:FindFirstChild("ClickDetector") and gethp() and not getmoneydistance() then
                    humanoid().CFrame = v.HumanoidRootPart.CFrame
                    fireclickdetector(game:GetService("Workspace").Ignored.HospitalJob.Blue.ClickDetector)
                    fireclickdetector(v.ClickDetector)
                elseif v.Name == "Can I get the Green bottle" and v:FindFirstChild("ClickDetector") and gethp() and not getmoneydistance() then
                    humanoid().CFrame = v.HumanoidRootPart.CFrame
                    fireclickdetector(game:GetService("Workspace").Ignored.HospitalJob.Green.ClickDetector)
                    fireclickdetector(v.ClickDetector)
                end
            end
            for i, v in workspace:WaitForChild("Ignored"):WaitForChild("Drop"):GetChildren() do
                if v:IsA("MeshPart") and v.Parent and not gethp() and not getmoneydistance() and not game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Red bottle") and not game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Blue bottle") and not game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Green bottle") then
                    local click = v:WaitForChild("ClickDetector")
                    local maxclick = click.MaxActivationDistance
                    repeat wait()
                        if v then
                            humanoid().CFrame = CFrame.new(v.Position)
                        end
                        if click then
                            pcall(fireclickdetector, click, maxclick)
                        end
                    until not v or not v.Parent or not click or not click.Parent or not getgenv().farm
                end
            end
            if not game:GetService("Workspace").Ignored.Drop:FindFirstChildOfClass("MeshPart") and not gethp() and not getmoneydistance() and not game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Red bottle") and not game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Blue bottle") and not game:GetService("Workspace").Ignored.HospitalJob:FindFirstChild("Can I get the Green bottle") then
                humanoid().CFrame = CFrame.new(game:GetService("Workspace").Ignored["Clean the shoes on the floor and come to me for cash"].HumanoidRootPart.Position)
                pcall(fireclickdetector, sell, maxclick)
            end
            if plr.Character:FindFirstChild("BodyEffects") then
                if plr.Character.BodyEffects["K.O"].Value == true then
                    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                        plr.Character.Humanoid.Health = 0
                    end
                end
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Find Money",
    Default = false,
    Callback = function(v)
        getgenv().money = v
        while getgenv().money do wait(0.4)
            for i, v in pairs(game:GetService("Workspace").Ignored.Drop:GetChildren()) do
                if v:IsA("Part") then
                    local tween = tweenService:Create(humanoid(), tweenInfo, {CFrame = CFrame.new(v.Position)})
                    tween:Play()
                end
            end
            for i, v in workspace:WaitForChild("Ignored"):WaitForChild("Drop"):GetChildren() do
                if v:IsA("Part") and v.Parent then
                    if (v.Position - humanoid().Position).Magnitude < 18 then
                        local click = v:WaitForChild("ClickDetector")
                        local maxclick = click.MaxActivationDistance
                        repeat wait()
                            if click then
                                pcall(fireclickdetector, click, maxclick)
                            end
                        until not v or not v.Parent or not click or not click.Parent or not getgenv().money
                    end
                end
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Farm Lettuce",
    Default = false,
    Callback = function(v)
        getgenv().lettuce = v
        while getgenv().lettuce do wait()
            humanoid().CFrame = CFrame.new(game:GetService("Workspace").Ignored.Shop["[Lettuce] - $5"].Head.Position)
            wait()
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Lettuce] - $5"].ClickDetector)
            wait()
            lettuce()
        end
    end
})
Tab:AddToggle({
    Name = "Auto Farm Weight",
    Default = false,
    Callback = function(v)
        getgenv().Weight = v
        while getgenv().Weight do wait()
            if game.Players.LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]") or game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
                Weight()
                wait()
                humanoid().CFrame = CFrame.new(-1112, 114, -28)
            end
            if not game.Players.LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]") and not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
                humanoid().CFrame = CFrame.new(game:GetService("Workspace").Ignored.Shop["[HeavyWeights] - $258"].Head.Position)
                wait()
                fireclickdetector(game:GetService("Workspace").Ignored.Shop["[HeavyWeights] - $258"].ClickDetector)
            end
        end
    end
})
OrionLib:Init()
