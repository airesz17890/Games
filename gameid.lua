local player = game:GetService("Players").LocalPlayer
local afk = nil
afk = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    if self == player and getnamecallmethod() == "Idled" then
        return
    end
    return afk(self, ...)
end))
local games = {
    [1450425732] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/Scuba%20Diving%20At%20Quill%20Lake.lua",
    [9759729519] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/all%20of%20us%20are%20dead.lua",
    [10950394697] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/all%20of%20us%20are%20dead.lua",
    [10950541730] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/all%20of%20us%20are%20dead.lua",
    [4448566543] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/banana%20eat.lua",
    [5787810194] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/banana%20eat.lua",
    [3203685552] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/bear%20alpha.lua",
    [6348640020] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/blair.lua",
    [5256165620] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/blastoffsim%20world%201.lua",
    [8015075184] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/blastoffsim%20world%202.lua",
    [2788229376] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/da%20hood.lua",
    [2693023319] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/expedition%20antartica.lua",
    [6305942109] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/laundry%20simulator.lua",
    [3623096087] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/muscle%20legend.lua",
    [3956818381] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/ninja%20legend.lua",
    [7411558263] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/pass%20the%20bomb.lua",
    [6766156863] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/strongman%20simulator.lua",
    [574407221] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/super%20hero%20tycoon.lua",
    [4580204640] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/survive%20the%20killer.lua",
    [1962086868] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/tower%20of%20hell.lua",
    [338521019] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/identifyfraud.lua",
    [5736409216] = "https://raw.githubusercontent.com/airesz17890/Games/main/folder%20games%20script/mall%20tycoon.lua"
}
if games[game.PlaceId] then
    return loadstring(game:HttpGet(games[game.PlaceId]))()
end
