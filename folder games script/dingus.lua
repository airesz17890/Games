local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(250, 346),
	toggle_key = Enum.KeyCode.Equals,
	can_resize = true,
})
local Tab1 = window:AddTab("Main")
Tab1:AddButton("Complete Task",function()
	for i=1,100,1 do
        game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(i)
    end
end)
Tab1:AddButton("Kill All",function()
	local Players = game:GetService("Players"):GetPlayers()
    for _,Player in pairs(Players) do
        if Player ~= game:GetService("Players").LocalPlayer then
            game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(Player.Character)
        end
    end
end)
Tab1:Show()
