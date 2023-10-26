local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
        local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
            main_color = Color3.fromRGB(41, 74, 122),
            min_size = Vector2.new(250, 346),
            can_resize = true,
        })
        local tab1 = window:AddTab("Main")
        local tab2 = window:AddTab("Esp")
        local tab3 = window:AddTab("Misc")
        local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
        ESP:Toggle(true)
        ESP.Tracers = false
        ESP.Names = false
        ESP.Boxes = false
        ESP.Players = false
        ESP.Color = Color3.fromRGB(255, 255, 255)
        function humanoid()
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
                return game.Players.LocalPlayer.Character.Humanoid
            end
        end
        function HumanoidRootPart()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                return game.Players.LocalPlayer.Character.HumanoidRootPart
            end
        end
        tab1:AddSwitch("Auto Pickup Item", function(v)
            getgenv().collect = v
            while getgenv().collect do
                task.wait()
                for i, v in pairs(game:GetService("Workspace").Interactables.Artifacts:GetChildren()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait()
                        keypress(69)
                    end
                end
            end
        end)
        tab1:AddSwitch("Auto Sell Item", function(v)
            getgenv().sell = v
            while getgenv().sell do
                task.wait()
                game:GetService("ReplicatedStorage"):WaitForChild("SellAll"):FireServer()
            end
        end)
        tab1:AddSwitch("Auto Collect Coin", function(v)
            getgenv().coin = v
            while getgenv().coin do
                task.wait()
                for i, v in pairs(game:GetService("Workspace").Interactables.Coins:GetChildren()) do
                    if v.Name == "Coin" or v.Name == "RCoin" then
                        firetouchinterest(HumanoidRootPart(), v, 0)
                        firetouchinterest(HumanoidRootPart(), v, 1)
                    end
                end
            end
        end)
        tab1:AddSwitch("Inf Stamina", function(v)
            getgenv().stamina = v
            local path = game:GetService("Players").LocalPlayer.Stamina
            local hook = nil
            hook = hookmetamethod(game, "__index", function(self, arg)
                if self == path and arg == "Value" and getgenv().stamina then
                    return 200
                end
                return hook(self, arg)
            end)
        end)
        tab1:AddSwitch("God Mod", function(v)
            getgenv().god = v
            local god = nil
            god = hookmetamethod(game, "__namecall", function(self, ...)
                if tostring(self) == "DamageHumanoid" and getgenv().god then
                    return
                end
                return god(self, ...)
            end)
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