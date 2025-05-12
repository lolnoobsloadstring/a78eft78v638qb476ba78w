if hookfunction and newcclosure then
    local originalHttpGet = game.HttpGet
    hookfunction(game.HttpGet, newcclosure(function(self, ...)
        if self == game then
            local url = select(1, ...)
            if url == originalHttpGet then
                while true do end
                return nil
            end
        end
        return originalHttpGet(self, ...)
    end))
end

local success, error = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/games/" .. game.PlaceId .. ".lua"))()
end)

if not success then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lolnoobsloadstring/a78eft78v638qb476ba78w/refs/heads/main/loader/78637bcawubsg76c73/games/null.lua"))()
end
