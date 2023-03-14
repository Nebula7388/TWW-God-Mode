local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Discord Library - by Nebula#7388")

local serv = win:Server("Preview", "")

local btns = serv:Channel("MAIN")
local maxHealth = 0
local function godMode()
    while task.wait() do
        maxHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
        game.Players.LocalPlayer.Character.Humanoid.Health = maxHealth - 1
    end
end
local godModeCoroutine = coroutine.create(godMode)
btns:Toggle("God-Mode",true, function(bool)
    if bool == true then
        DiscordLib:Notification("Notification", "Enabled GodMode", "Okay!")
        coroutine.resume(godModeCoroutine)
    else
        DiscordLib:Notification("Notification", "Disabled GodMode", "Okay!")
        coroutine.close(godModeCoroutine)
        godModeCoroutine = coroutine.create(godMode)

    end



end)
