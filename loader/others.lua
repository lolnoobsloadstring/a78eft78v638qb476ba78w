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
