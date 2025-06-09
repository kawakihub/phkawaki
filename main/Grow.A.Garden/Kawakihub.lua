game:GetService("StarterGui"):SetCore("SendNotification", {Title="Script loading...", Text="Made by Lucas", Duration=5})


local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()
local Window = l:CreateWindow({
    Title = "Kawaki Hub",
    SubTitle = "https://discord.gg/wbUUHP5J",
    TabWidth = 0,
    Size = UDim2.fromOffset(0, 0),
    Acrylic = false,
    Theme = "Dark",
})
l:Destroy()

wait(0.005)

loadstring(game:HttpGet("https://raw.githubusercontent.com/kawakihub/phkawaki/refs/heads/main/real-yobi/main/Grow.A.Garden/yobi/Kawakihub.lua"))()

wait(0.1)

game:GetService("StarterGui"):SetCore("SendNotification", {Title="script loaded...", Text="Made by Kawaki Hub", Duration=5})
