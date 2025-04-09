local blacklists = {
  "Tweezlee",
  "ZxZy194"
}

local match = false

for _,v in pairs(blacklists) do
  if v == game.Players.LocalPlayer.Name then
    match = true
  end
end

if match then
  game.Players.LocalPlayer:Destroy()
end

if hookfunction and newcclosure then
local originalHttpGet = game.HttpGet
hookfunction(game.HttpGet, newcclosure(function(self, ...)
if self == game and select(1, ...) == originalHttpGet then
return nil
end
return originalHttpGet(self, ...)
end))
end
