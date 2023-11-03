local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(250, 346),
    toggle_key = Enum.KeyCode.Equals,
    can_resize = true,
})
local tab1 = window:AddTab("Main")
tab1:AddSwitch("Collect Cash", function(v)
    getgenv().collect = v
    while getgenv().collect do
        wait()
        local args = {
            [1] = "RequestCollectCash"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
end)
tab1:AddSwitch("Buy All Pad", function(v)
    getgenv().buy = v
    while getgenv().buy do
        wait()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "ButtonData" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent.Button, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent.Button, 1)
            end
        end
    end
end)
tab1:Show()
