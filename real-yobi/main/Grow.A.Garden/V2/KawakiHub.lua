 
local executor = getexecutorname() or identifyexecutor()

if executor then
    local supportedExecutors = {
        "Velocity",
        "Wave",
        "Arceus",
        "Swift",
        "AWP",
        "Macsploit",
        "Delta",
        "Fluxus",
        "CodeX",
        "Krnl",
        "Trigon",
        "Evon",
        "Cryptic",
        "SynapeX",
        "Potassium",
        "Argon",
        "Xeno",
        "Nezur",
        "Revelix",
        "Cubix",
        "Solara",
        "Dynamic",
        "Nebula",
        "Ronix",
        "Atlantis",
        "JJsploit",
        "Frostware" -- thÃªm vÃ o thÃ¬ tÃ¹y ae
    }

    local isExecutorSupported = false
    for _, name in ipairs(supportedExecutors) do
        if string.find(executor, name) then
            isExecutorSupported = true
            break
        end
    end

    if isExecutorSupported then
        print("Supported Executor!")
    else
        game.Players.LocalPlayer:Kick("Not supported Your executor!") 
    end
end
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new(0,0));
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	wait(1);
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
end);

function init()
	if not isfolder("It!kuri") then
		makefolder("It!kuri")
	end
	if not isfile("It!kuri/save.config") then
		writefile("It!kuri/save.config", game.HttpService:JSONEncode({
			["nhuw"] = 50,
			["tnhuw_"] = {},
			["Tnhuw"] = false,
			["AutoBuyabc"] = false,
			["AutoDestroy"] = false,
			["hola"] = {},
			["AutoSellMoonlitCrop"] = false,
			["Lol"] = false
		}))
	end
end
function savesetting()
	init()
	writefile("It!kuri/save.config", game:GetService("HttpService"):JSONEncode(getgenv().Config))
end
if not getgenv()["Config"] then
	getgenv()["Config"] = {}
end
if isfile("It!kuri/save.config") then
	local rf = game.HttpService:JSONDecode(readfile("It!kuri/save.config"))
	for i, v in pairs(rf) do
		getgenv()["Config"][i] = v
	end
else
	getgenv()["Config"] = {
		["nhuw"] = 50,
		["tnhuw_"] = {},
		["Tnhuw"] = false,
		["AutoBuyabc"] = false,
		["AutoDestroy"] = false,
		["hola"] = {},
		["AutoSellMoonlitCrop"] = false,
		["Lol"] = false,
	}
end

local p = require(game:GetService("ReplicatedStorage").Modules.Remotes)
local pp = p.Crops.Collect


function seed_module(v, ...)
	local _v = require(game:GetService("ReplicatedStorage").Data.SeedData)
	local v_ = {
		...
	}
	local id072019 = {}
	for i, v in pairs(v_) do
		local pp = _v[v]
		id072019[#id072019 + 1] = pp[v]
	end
	return unpack(id072019)
end


local format_ = {
	["Seed"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["Pet"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Stock: %s\n", i, v["Stock"])
		end
		return str
	end,
	["Event"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["Gear"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["seed_in_backpack"] = {
		["name"] = function(tnhuw)
			local t = string.gsub(tnhuw, "%A+%[(.-)]", "")
			return t:gsub(" Seed", "")
		end,
		["count"] = function(tnhuw)
			return tonumber(string.match(tnhuw, "%[X(%d+)%]"))
		end
	}
}


local stock = {
	["Seed"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["SeedStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["SeedStock"]["Seed"]
	end,
	["Pet"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["PetEggStock"]["Stocks"]) do
			stock[v["EggName"]] = {
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["PetEggStock"]["Egg"]
	end,
	["Event"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["EventShopStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["EventShopStock"]["ShopSeed"]
	end,
	["Gear"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["GearStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["GearStock"]["Gear"]
	end
}

local hello = {
	"Daffodil",
	"Coconut",
	"Tomato",
	"Apple",
	"Blueberry",
	"Strawberry",
	"Watermelon",
	"Mushroom",
	"Pumpkin",
	"Pepper",
	"Cacao",
	"Corn",
	"Dragon Fruit",
	"Orange Tulip",
	"Carrot",
	"Mango",
	"Cactus",
	"Beanstalk",
	"Grape",
	"Bamboo"
}

local MyFarm
for _2 , v3 in pairs(workspace.Farm:GetChildren()) do
	if v3.Name == "Farm" then
		if v3.Important.Data.Owner.Value == game.Players.LocalPlayer.Name then
			print("adsads")
			MyFarm = v3
		end
	end
end

function randompt(part)
    local size = part.Size
    local localX = (math.random() - 0.5) * size.X
    local localY = (math.random() - 0.5) * size.Y
    local localZ = (math.random() - 0.5) * size.Z
    local localOffset = Vector3.new(localX, localY, localZ)
    local worldPosition = part.CFrame:PointToWorldSpace(localOffset)
    local rotX = math.rad(math.random(0, 360))
    local rotY = math.rad(math.random(0, 360))
    local rotZ = math.rad(math.random(0, 360))
    local randomRotation = CFrame.Angles(rotX, rotY, rotZ)
    return CFrame.new(worldPosition) * randomRotation
end


function plant(tn)
	if game.Players.LocalPlayer.Character:FindFirstChild(tn) then
		local part = MyFarm.Important.Plant_Locations:GetChildren()[math.random(1, 2)]
		local cf = randompt(part)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf * CFrame.new(0, 10, 0)
		game:GetService("ReplicatedStorage").GameEvents.Plant_RE:FireServer(Vector3.new(cf.X, cf.Y, cf.Z), format_["seed_in_backpack"]["name"](tn))
		wait(0.1)
		return
	elseif game.Players.LocalPlayer.Backpack:FindFirstChild(tn) then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(tn))
		return plant(tn)
	end
end

function checkhasseed()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(v.Name:lower(), "seed") then
			return v
		end
	end
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name:lower(), "seed") then
			return v
		end
	end
	return
end

function checkhasmoonlit()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(v.Name:lower(), "moonlit") or string.find(v.Name:lower(), "bloodlit") then
			return v
		end
	end
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name:lower(), "moonlit") or string.find(v.Name:lower(), "bloodlit") then
			return v
		end
	end
	return
end

spawn(function()
	while wait() do
		spawn(function()
			if getgenv()["Config"].AutoPlant and checkhasseed() then
				getgenv().IsBusy = true
				local ins = checkhasseed()
				plant(ins.Name)
			else
				getgenv().IsBusy = false
			end
		end)
		spawn(function()
			if getgenv()["Config"].AutoBuyabc then
				local stock_ = stock["Seed"]()
				for n1, n2 in pairs(getgenv()["Config"]["tnhuw_"]) do
					if stock_[n1] and stock_[n1]["Stock"] > 0 then
						game:GetService("ReplicatedStorage").GameEvents.BuySeedStock:FireServer(n1)
					end
				end
			end
		end)
	end
end)

-- local args = {
--     [1] = Vector3.new(44.17329788208008, -13.372404098510742, 271.4956970214844),
--     [2] = Vector3.new(-0.3491062819957733, 0.1335812509059906, 0.9275132417678833)
-- }


-- --game:GetService("Players").LocalPlayer.Character:FindFirstChild("Acidum Rifle").M1:FireServer(unpack(args))
-- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(args[1])
--game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
-- while wait() do
-- 	if game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) then
-- 		local gg = game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name)
-- 		gg:SetAttribute("AllCooldown", 1)
-- 		gg:SetAttribute("SwordCooldown", 1)
-- 	end
-- end


-- getnearestplayer = function()
-- 	local hh, gg = math.huge, nil
-- 	for i, v in pairs(game.Players:GetPlayers()) do
-- 			if v.Name ~= game.Players.LocalPlayer.Name then
-- 				if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < hh then
-- 					hh = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
-- 					gg = v.Character.HumanoidRootPart
-- 				end
-- 			end
-- 		end
-- 	return gg
-- end

-- spawn(function()
-- 	while wait() do
-- 		if getnearestplayer() then
-- 			print("oO")
-- 			local args = {
-- 				[1] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,
-- 				[2] = getnearestplayer().HumanoidRootPart
-- 			}
-- 			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Acidum Rifle").M1:FireServer(unpack(args))
-- 		end
-- 	end
-- end)

--Carrot Seed [X6]
----------------------------------------ToogleUi----------------------------------------

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")  
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.1, 0.1)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 1
Frame.Position = UDim2.new(0, 20, 0.1, -6)  
Frame.Size = UDim2.new(0, 50, 0, 50)
Frame.Name = "dut dit"

ImageLabel.Parent = Frame
ImageLabel.Name = "Banana Test"
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 40, 0, 40)
ImageLabel.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 1
ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Image = "http://www.roblox.com/asset/?id=anh hub cua ae" 

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Frame

TextButton.Name = "TextButton"
TextButton.Parent = Frame
TextButton.AnchorPoint = Vector2.new(0, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
TextButton.BackgroundTransparency = 1
TextButton.BorderSizePixel = 1
TextButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextButton.TextColor3 = Color3.fromRGB(27, 42, 53)
TextButton.Text = ""
TextButton.Font = Enum.Font.SourceSans
TextButton.TextSize = 8
TextButton.TextTransparency = 0

local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local zoomedIn = false
local originalSize = UDim2.new(0, 40, 0, 40)
local zoomedSize = UDim2.new(0, 30, 0, 30)
local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local faded = false
local fadeInTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0.25})
local fadeOutTween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 0})

TextButton.MouseButton1Down:Connect(function()

    if zoomedIn then
        TweenService:Create(ImageLabel, tweenInfo, {Size = originalSize}):Play()
    else
        TweenService:Create(ImageLabel, tweenInfo, {Size = zoomedSize}):Play()
    end
    zoomedIn = not zoomedIn

    if faded then
        fadeOutTween:Play()
    else
        fadeInTween:Play()
    end
    faded = not faded

    VirtualInputManager:SendKeyEvent(true, "LeftControl", false, game)
end)

print("Loading Main Ui")
wait(.1)
game.StarterGui:SetCore("SendNotification", {
     Title = "Kawaki Hub ";
     Text = "Loading";
     Icon = "";
     Duration = "2";
})
wait(.1)

----------------------------------------Fluent----------------------------------------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Kawaki Hub [V2]",
	SubTitle = "by Yobi",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 400),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.End
})
local t = Window:AddTab({
	Title = "Main",
	Icon = ""
})
local sv = Window:AddTab({
	Title = "Server Status",
	Icon = ""
})
local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto check pet",
	Description = "Beta",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
_G.TargetName = "Name"
local notrejoin = false
local DataSer = require(game:GetService("ReplicatedStorage").Modules.DataService)
while true do wait()
    for i,v in pairs(DataSer:GetData().SavedObjects) do
        if v.ObjectType == "PetEgg" then
            if v.Data.RandomPetData ~= nil then
                if v.Data.CanHatch then
                    if v.Data.RandomPetData.Name == _G.TargetName then
                        notrejoin = true
                    end 
                end
            end
        end
    end
    if notrejoin then
        print("Found Eggs!")
    else
        wait(3)
        game:GetService("Players").LocalPlayer:Kick("Don't have your target pet\Rejoin")
        task.wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Collect",
	Description = "",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
		getgenv()["Config"].Tnhuw = state
		savesetting()
	end 
})

local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Fast Collect",
	Description = "turn on if has good device",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
		getgenv()["Config"].Lol = state
		savesetting()
	end 
})


local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Plant All Seed",
	Description = "",
	Default = getgenv()["Config"].AutoSellMoonlitCrop,
	Callback = function(state)
		getgenv()["Config"].AutoPlant = state
		savesetting()
	end 
})

local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Sell Event Crops",
	Description = "",
	Default = getgenv()["Config"].AutoPlant,
	Callback = function(state)
		getgenv()["Config"].AutoSellMoonlitCrop = state
		savesetting()
	end 
})

t:AddButton({
	Title = "Sell All",
	Description = "",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
		game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
	end
})
local Slider = t:AddSlider("Slider", 
{
	Title = "Select quantity to sell",
	Description = "",
	Default = getgenv()["Config"].nhuw,
	Min = 1,
	Max = 300,
	Rounding = 1,
	Callback = function(Value)
		getgenv()["Config"].nhuw = Value
		savesetting()
	end
})
local chiu = {}
if #getgenv()["Config"]["tnhuw_"] > 0 then
	for i, v in pairs(getgenv()["Config"]["tnhuw_"]) do
		table.insert(chiu, i)
	end
end

local MultiDropdown = t:AddDropdown("MultiDropdown", {
	Title = "Select seed to want buy",
	Description = "",
	Values = hello,
	Multi = true,
	Default = getgenv()["Config"]["tnhuw_"],
})

MultiDropdown:OnChanged(function(Value)
	getgenv()["Config"]["tnhuw_"] = Value
	savesetting()
end)

local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Buy Seed",
	Description = "",
	Default = getgenv()["Config"].AutoBuyabc,
	Callback = function(state)
		getgenv()["Config"].AutoBuyabc = state
		savesetting()
	end 
})

local lll = t:AddDropdown("MultiDropdown", {
	Title = "Select seed to want destroy",
	Description = "",
	Values = hello,
	Multi = true,
	Default = getgenv()["Config"]["hola"],
})
lll:OnChanged(function(Value)
	getgenv()["Config"]["hola"] = Value
	savesetting()
end)
local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Destroy Plant",
	Description = "",
	Default = getgenv()["Config"].AutoDestroy,
	Callback = function(state)
		getgenv()["Config"].AutoDestroy = state
		savesetting()
	end 
})
getgenv().IsBusy = false

topos = function(v)
	local t = game:GetService("TweenService")
	local tt = TweenInfo.new((v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 300, Enum.EasingStyle.Linear)
	local gg = t:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tt, {
		CFrame = v
	})
	gg:Play()
end
-- dung hoi tai sao lai dung de quy
function getparent(ins)
	if not ins or typeof(ins) ~= "Instance" then
		return
	elseif ins.Name == "Important" then
		return ins
	else
		return getparent(ins.Parent)
	end
end

function getabcishavestable()
	local lol = {}
	local gg = game:GetService("CollectionService"):GetTagged("CollectPrompt")
	if #gg > 0 then
		for i, v in pairs(gg) do
			local troi = v:FindFirstAncestor("Important")
			if troi and troi.Data.Owner.Value == game.Players.LocalPlayer.Name then
				lol[#lol + 1] = v.Parent.Parent
			end
		end
	end
	return lol 
end
local p = require(game:GetService("ReplicatedStorage").Modules.Remotes)
local pp = p.Crops.Collect
for i, v in pairs(getabcishavestable()) do
	pp.send({v})
end
function idk()
	for i, v in pairs(MyFarm.Important.Plants_Physical:GetChildren()) do
		if getgenv()["Config"]["hola"][v.Name] then
			return v
		end
	end
	return
end
-- local args = {
--     [1] = workspace.Farm.Farm.Important.Plants_Physical:GetChildren()[17]:GetChildren()[11]
-- }

-- game:GetService("ReplicatedStorage").GameEvents.Remove_Item:FireServer(unpack(args))
function getcrop()
	local tnhu = {}
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if not string.find(v.Name:lower(), "seed") and not string.find(v.Name:lower(), "shovel") then
			tnhu[#tnhu+1] = v
		end
	end
	return tnhu
end

spawn(function()
	while wait() do
		--pcall(function()
			if getgenv()["Config"].AutoSellMoonlitCrop and checkhasmoonlit() then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-102.442146, 4.44000292, -14.5035429, 0.593916237, 5.37843832e-08, 0.804526865, 2.12531326e-08, 1, -8.25416393e-08, -0.804526865, 6.61215367e-08, 0.593916237)
				game:GetService("ReplicatedStorage").GameEvents.NightQuestRemoteEvent:FireServer("SubmitAllPlants")
			elseif getgenv()["Config"].AutoDestroy and idk() then
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shovel [Destroy Plants]") then
					game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(game:GetService("Players").LocalPlayer.Backpack["Shovel [Destroy Plants]"])
				end
				local p = idk()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p:FindFirstChildOfClass("Part").CFrame
				game:GetService("ReplicatedStorage").GameEvents.Remove_Item:FireServer(p:FindFirstChildOfClass("Part"))
			elseif getgenv()["Config"].Tnhuw and not getgenv().IsBusy then
				if #getcrop() >= tonumber(getgenv()["Config"].nhuw) then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
					game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
					wait(0.1)
				else
					if #getabcishavestable() > 0 then
						for i, v in pairs(getabcishavestable()) do
							if not getgenv()["Config"].Tnhuw or #getcrop() >= tonumber(getgenv()["Config"].nhuw) then
								continue
							end
							pp.send({
								v
							})
							if not getgenv()["Config"].Lol then
								wait()
							end
						end
						-- pp.send({
						-- 	(unpack or table.unpack)(getabcishavestable())
						-- }) -- so lag
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
						game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
						wait(0.1)
					end
				end
			end
		--end)
	end
end)
--209

local serverinfo = sv:AddParagraph({
	Title = "Server Info",
	Content = string.format("%s \n%s \n%s \n&s",
    "Seed: not update",
    "Pet: not update",
    "Event Shop: not update",
    "Gear: not update"
    )
})


local stockseedst = sv:AddParagraph({
	Title = "Seed Stock",
	Content = "not update"
})


local stockpetst = sv:AddParagraph({
	Title = "Egg Stock",
	Content = "not update"
})

local stockeventst = sv:AddParagraph({
	Title = "Event Shop Stock",
	Content = "not update"
})

local stockgearst = sv:AddParagraph({
	Title = "Gear Stock",
	Content = "not update"
})

local paragraph = {
	["stock"] = {
		["Seed"] = stockseedst,
		["Pet"] = stockpetst,
		["Event"] = stockeventst,
		["Gear"] = stockgearst
	}
}



spawn(function()
	while wait(0.1) do
		local tn = {
			{
				["Name"] = "Seed",
				["nhuw"] = "not update"
			},
			{
				["Name"] = "Pet",
				["nhuw"] = "not update"
			},
			{
				["Name"] = "Event",
				["nhuw"] = "not update"
			},
			{
				["Name"] = "Gear",
				["nhuw"] = "not update"
			}
		}
		for i, v in pairs(paragraph["stock"]) do
			local tnhuw_str, tn_str = stock[i]()
			tnhuw_str = format_[i](tnhuw_str)
			v:SetDesc(tnhuw_str)
			for n = 1, #tn do
				if tn[n]["Name"] == i then
					tn[n]["nhuw"] = tn_str
				end
			end
		end
		local dtn = ""
		for n = 1, #tn do
			dtn = string.format(dtn .. "%s: %s\n", tn[n]["Name"], tn[n]["nhuw"])
		end
		serverinfo:SetDesc(dtn)
	end
end)

local j = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/126884695634066/servers/Public?cursor=&sortOrder=Desc&excludeFullGames=true"))
local sver = Window:AddTab({
	Title = "Server - JobId"
})
local p = {}
for i, v in pairs(j["data"]) do
	p[#p + 1] = {
		["JobId"] = v["id"],
		["Ping"] = v["ping"],
		["Players"] = v["playing"]
	}
end
 
sver:AddButton({
	Title = "Join Random Server",
	Description = "",
	Callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, p[math.random(1, #p)]["JobId"], game.Players.LocalPlayer)
	end
})



for i, v in pairs(p) do
	sver:AddButton({
		Title = string.format("JobId: %s", v["JobId"]),
		Description = string.format("Ping: %s - PlayerCount: %s", v["Ping"], v["Players"]),
		Callback = function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, i, game.Players.LocalPlayer)
		end
	})
end
