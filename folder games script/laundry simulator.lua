for i, v in pairs(game:GetService("Workspace").Plots:GetDescendants()) do
    if v.Name == "ClaimPlot" then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
    end
end
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local fly = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.Color = Color3.fromRGB(255, 255, 255)
local player = game.Players.LocalPlayer
local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(250, 346),
    can_resize = true,
})
function humanoid()
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
        return game.Players.LocalPlayer.Character.Humanoid
    end
end
function Teleport(cframe)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(cframe.x, cframe.y + 5, cframe.z)
end
function GetBestClothing()
    local clothes = workspace.Debris.Clothing:GetChildren()
    local tiers = {
        Silver = {
            Multiplier = 3,
            UIColour = Color3.fromRGB(161, 161, 161)
        },
        Gold = {
            Multiplier = 10,
            UIColour = Color3.fromRGB(255, 170, 0)
        },
        Emerald = {
            Multiplier = 25,
            UIColour = Color3.fromRGB(18, 236, 6)
        },
        Ruby = {
            Multiplier = 25,
            UIColour = Color3.fromRGB(239, 0, 0)
        },
        Sapphire = {
            Multiplier = 25,
            UIColour = Color3.fromRGB(79, 215, 255)
        }
    }
    local topMultiplier = 1
    local topClothing = nil
    for i = 1, #clothes do
        local clothing = clothes[i]:FindFirstChildOfClass('StringValue')
        if clothing then
            if tiers[clothing.Value].Multiplier == 25 then return clothes[i] end
            if topMultiplier < tiers[clothing.Value].Multiplier then
                topClothing = clothes[i]
                topMultiplier = tiers[clothing.Value].Multiplier
            end
        end
    end
    if topClothing == nil then return workspace.Debris.Clothing:FindFirstChildOfClass('MeshPart') end
    return topClothing
end
function FillBasket()
    local timesToLoop = player.NonSaveVars.TotalWashingMachineCapacity.Value - player.NonSaveVars.BackpackAmount.Value
    if timesToLoop > player.NonSaveVars.BasketSize.Value then timesToLoop = player.NonSaveVars.BasketSize.Value end
    while player.NonSaveVars.BackpackAmount.Value ~= player.NonSaveVars.TotalWashingMachineCapacity.Value and player.NonSaveVars.BackpackAmount.Value ~= player.NonSaveVars.BasketSize.Value do
        local clothingPart = GetBestClothing()
        if clothingPart == nil then clothingPart = workspace.Debris.Clothing:FindFirstChildOfClass('MeshPart') end
        if clothingPart then
            Teleport(clothingPart.CFrame)
            game.ReplicatedStorage.Events.GrabClothing:FireServer(clothingPart)
        end
        wait(0.1)
    end
end
local tab1 = window:AddTab("Main")
local tab2 = window:AddTab("Esp")
local tab3 = window:AddTab("Misc")
tab1:AddSwitch("Auto Farm", function(v)
    getgenv().Autofarm = v
    while true do
        if not getgenv().Autofarm then return end
        wait()
        local washers = workspace.Plots[tostring(player.NonSaveVars.OwnsPlot.Value)].WashingMachines:GetChildren()
        for i = 1, #washers do
            local thisWasher = washers[i]
            if player.NonSaveVars.BasketStatus.Value == 'Clean' and player.NonSaveVars.BackpackAmount.Value > 0 then
                Teleport(workspace._FinishChute.Hinge.CFrame)
                game.ReplicatedStorage.Events.DropClothesInChute:FireServer()
            elseif thisWasher.Config.CycleFinished.Value then
                if player.NonSaveVars.BackpackAmount.Value == 0 or player.NonSaveVars.BasketStatus.Value == 'Clean' then
                    Teleport(thisWasher.Parts.Part.CFrame)
                    game.ReplicatedStorage.Events.UnloadWashingMachine:FireServer(thisWasher)
                end
            elseif thisWasher.Config.Started.Value == false then
                FillBasket()
                wait(0.1)
                Teleport(thisWasher.Parts.Part.CFrame)
                game.ReplicatedStorage.Events.LoadWashingMachine:FireServer(thisWasher)
            end
        end
    end
end)
tab1:AddSwitch("Auto Rebirth", function(v)
    getgenv().Rebirth = v
    while getgenv().Rebirth do
        task.wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):InvokeServer()
    end
end)
tab1:AddButton("Open Shop Gui", function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.ArchysShopEntrance.Open, 0)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.ArchysShopEntrance.Open, 1)
end)
tab1:AddButton("Unlock Gamepass", function()
    for i, v in pairs(game:GetService("Players").carpor178.Gamepasses:GetChildren()) do
        if v.ClassName == "BoolValue" and v.Value == false then
            v.Value = true
        end
    end
end)
tab2:AddSwitch("Enable Esp", function(v)
    ESP.Players = v
end)
tab2:AddSwitch("Player Names", function(v)
    ESP.Names = v
end)
tab2:AddSwitch("Player Tracer", function(v)
    ESP.Tracers = v
end)
tab2:AddSwitch("Player Boxes", function(v)
    ESP.Boxes = v
end)
tab2:AddLabel("Esp Color")
tab2:AddColorPicker(function(v)
    ESP.Color = v
end)
local slider1 = tab3:AddSlider("WalkSpeed", function(v)
    setwalkspeed = tonumber(v)
end, {
    ["min"] = 16,
    ["max"] = 300,
})
slider1:Set(0)
local slider2 = tab3:AddSlider("JumpPower", function(v)
    setjumppower = tonumber(v)
end, {
    ["min"] = 50,
    ["max"] = 1000,
})
slider2:Set(0)
spawn(function()
    while task.wait() do
        humanoid().WalkSpeed = setwalkspeed
        humanoid().JumpPower = setjumppower
    end
end)
tab3:AddSwitch("Fly", function(v)
    fly(v)
end)
tab3:AddSwitch("Noclip", function(no)
    getgenv().noclip = no
    while getgenv().noclip do
        wait()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
                if not getgenv().noclip then
                    v.CanCollide = true
                end
            end
        end
    end
end)
tab3:AddSwitch("Inf Jump", function(v)
    getgenv().infjump = v
    game:GetService("UserInputService").JumpRequest:connect(function()
        if getgenv().infjump then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)
tab3:AddButton("Less Lag", function()
    local mx = game.Debris
    local mx3 = game.Debris.MaxItems
    if (mx.MaxItems > 9999999999) then
        mx.MaxItems = mx3 * .9999999999
    end
    wait()
    setfpscap(1000)
end)
tab3:AddButton("Fullbright", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/06iG6YkU'))()
end)
tab1:Show()
