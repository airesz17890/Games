game:GetService("CoreGui").PurchasePrompt.ChildAdded:Connect(function(v)
    v:Destroy()
end)
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local fly = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.Color = Color3.fromRGB(255, 255, 255)
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
local tab1 = window:AddTab("Main")
local tab2 = window:AddTab("Esp")
local tab3 = window:AddTab("Misc")
tab1:AddSwitch("Auto Farm", function(v)
    getgenv().farm = v
    while getgenv().farm do
        task.wait()
        if game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:FindFirstChildOfClass("MeshPart") and game:GetService("Workspace").Areas["Area24_Mineshaft"]:WaitForChild("Goal") then
            for i, v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                v.Anchored = true
                v.CFrame = game:GetService("Workspace").Areas["Area24_Mineshaft"].Goal.CFrame
                task.wait()
                v.Anchored = false
            end
        else
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-99, 46, 18995)
                for i, v in pairs(game:GetService("Workspace").Areas["Area24_Mineshaft"].DraggableItems:GetDescendants()) do
                    if v.ClassName == "ProximityPrompt" then
                        fireproximityprompt(v)
                    end
                end
            end
        end
    end
end)
tab1:AddSwitch("Auto Workout", function(v)
    getgenv().workout = v
    while getgenv().workout do
        task.wait()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-346, 60, 19115)
            for i, v in pairs(game:GetService("Workspace").Areas["Area24_Mineshaft"].Gym:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
            local args = {
                [1] = strengh,
                [2] = "Default"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("StrongMan_UpgradeStrength"):InvokeServer(unpack(args))
            if not getgenv().workout then
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
        end
    end
end)
tab1:AddTextBox("Strengh Workout", function(v)
    strengh = tonumber(v)
end)
tab1:AddSwitch("Auto Rebirth", function(v)
    getgenv().rebirth = v
    while getgenv().rebirth do
        task.wait()
        game:GetService("ReplicatedStorage"):WaitForChild("StrongMan_Rebirth"):FireServer()
    end
end)
local dropdown = tab1:AddDropdown("Select Buy Pet", function(v)
    selectbuy = v
end)
tab1:AddSwitch("Auto Buy Selected Pet", function(v)
    getgenv().buy = true
    while getgenv().buy do
        task.wait()
        local args = {
            [1] = selectbuy
        }
        game:GetService("ReplicatedStorage"):WaitForChild("TGSPetShopRoll"):InvokeServer(unpack(args))
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
    game:GetService("RunService").RenderStepped:Connect(function()
        humanoid().WalkSpeed = setwalkspeed
        humanoid().JumpPower = setjumppower
    end)
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
            humanoid():ChangeState("Jumping")
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
spawn(function()
    for i, v in pairs(game:GetService("Workspace").Lib.Loot.LootTables.PetShops:GetChildren()) do
        if v:IsA("ModuleScript") then
            dropdown:Add(v)
        end
    end
end)
tab1:Show()
