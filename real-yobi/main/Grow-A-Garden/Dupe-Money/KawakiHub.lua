local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Iamkhnah/authentication/refs/heads/main/main/script.luau"))()

lib:Start({
    ["Title"] = "Kawaki Hub Dupe Sheckles",           -- Name of your script
    ["Discord"] = "https://discord.gg/49DAzBrkX4",  -- Your Discord invite link
    ["Api Key"] = "https://discord.gg/49DAzBrkX4",      -- Your Link4m API Key
    ["Script"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kawakihub/phkawaki/refs/heads/main/real-yobi/main/Grow-A-Garden/Dupe-Money/No-Key/KawakiHub.lua"))()
        print("Authenticated successfully!")
    end
})
