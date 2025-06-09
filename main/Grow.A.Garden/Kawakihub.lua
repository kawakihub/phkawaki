game:GetService("StarterGui"):SetCore("SendNotification", {Title="Script loading...", Text="Made by Kawaki", Duration=5})


local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()
local Window = l:CreateWindow({
    Title = "Kawaki Hub",
    SubTitle = "https://discord.gg/49DAzBrkX4",
    TabWidth = 0,
    Size = UDim2.fromOffset(0, 0),
    Acrylic = false,
    Theme = "Dark",
})
l:Destroy()

wait(0.005)

loadstring(game:HttpGet("https://raw.githubusercontent.com/kawakihub/phkawaki/refs/heads/main/real-yobi/main/Grow.A.Garden/yobi/Kawakihub.lua"))()

wait(0.1)

game:GetService("StarterGui"):SetCore("SendNotification", {Title="Join My Discord Server", Text="https://discord.gg/49DAzBrkX4", Duration=5})
