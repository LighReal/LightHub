repeat
    pcall(function()
            task.wait()
            if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
                if string.find(tostring(_G.Team), "Pirate") then
                    for r, v in pairs(
                        getconnections(
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated
                        )
                    ) do
                        v.Function()
                    end
                elseif string.find(tostring(_G.Team), "Marine") then
                    for r, v in pairs(
                        getconnections(
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated
                        )
                    ) do
                        v.Function()
                    end
                else
                    for r, v in pairs(
                        getconnections(
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated
                        )
                    ) do
                        v.Function()
                    end
                end
            end
        end)
until game.Players.LocalPlayer.Team ~= nil
local Fluent = loadstring(game:HttpGet("https://envscript.site/api/script/FluentUI.lua"))()
local WScript = {

}
local foldername = "LightReal"
local gamename = "Blox Fruit"
local filename = "Config.json"
function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(WScript)
    if (writefile) then
        if isfolder(foldername) then
            if isfolder(foldername) then
            if isfile(foldername.."\\"..filename) then
                writefile(foldername.."\\"..gamename.."\\"..filename, json)
            else
                writefile(foldername.."\\"..gamename.."\\"..filename, json)
            end
            else
            makefolder(foldername)
            writefile(foldername.."\\"..gamename.."\\"..filename, json)
            end
        else
            makefolder(foldername.."\\"..gamename)
            writefile(foldername.."\\"..gamename.."\\"..filename, json)
        end
    end
end
function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfile(foldername.."\\"..gamename.."\\"..filename) then
        WScript = HttpService:JSONDecode(readfile(foldername.."\\"..gamename.."\\"..filename))
    end
end
loadSettings()
function Notify(TT,DD,WW,CT)
    Fluent:Notify({
        Title = TT,
        Content = DD,
        SubContent = "Script By LightReal", -- Optional
        Duration = WW -- Set to nil to make the notification not disappear
    })
end
local nGU = Fluent:CreateWindow({
    Title = "Light Hub | Blox Fruit",
    SubTitle = "By @LightReal",
    TabWidth = 140,
    Size = UDim2.fromOffset(560, 370),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Opcc = Fluent.Options
local waits = 0.00000000000000001
local Info = nGU:AddTab({ Title = "About", Icon = "15419741770" })
local Main = nGU:AddTab({ Title = "Main", Icon = "11446825283" })
local MiscFarm = nGU:AddTab({ Title = "Misc Farm", Icon = "11446859498" })
local RaceV4 = nGU:AddTab({ Title = "Race V4", Icon = "9606626034" })
local Teleport = nGU:AddTab({ Title = "Teleport", Icon = "9606628205" })
local Stats = nGU:AddTab({ Title = "Stats", Icon = "11447069304" })
local Raid = nGU:AddTab({ Title = "Raid", Icon = "4483345998" })
local Shop = nGU:AddTab({ Title = "Shop", Icon = "6031265976" })
local DevilFruit = nGU:AddTab({ Title = "Fruit", Icon = "11446965348" })
local Misc = nGU:AddTab({ Title = "Misc", Icon = "7040410130" })
local Settings = nGU:AddTab({ Title = "Settings", Icon = "11446835336" })
nGU:SelectTab(1)
Notify("Annie","Wait Loaded Script",5)
task.wait(2)
function CheckNearestTeleporter(aI)
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    vcspos = aI.Position
    min = math.huge
    min2 = math.huge
    local y = game.PlaceId
    if y == 2753915549 then
        OldWorld = true
    elseif y == 4442272183 then
        NewWorld = true
    elseif y == 7449423635 then
        ThreeWorld = true
    end
    if ThreeWorld then
        TableLocations = {
            ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif NewWorld then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif OldWorld then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if min2 <= min3 then
        return choose
    end
end
function requestEntrance(aJ)
    args = {"requestEntrance", aJ}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    char = game.Players.LocalPlayer.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
    task.wait(0.5)
end
function Noclip()
    for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
            child.CanCollide = false
        end
    end
end
function UnNoclip()
    for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
            child.CanCollide = true
        end
    end
end
function TeleportTopos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/250, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    if Distance <= 5000 then
    tween:Cancel()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
    tween:Cancel()
    _G.Clip = false
    end
    end
function TP(Pos)
    local aM = CheckNearestTeleporter(Pos)
    if aM then
        pcall(function()
                tween:Cancel()
            end)
        requestEntrance(aM)
        print(aM)
    end
        TeleportTopos(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,Pos.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/350, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
    tween:Play()
    Noclip()
    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        Noclip.MaxForce = Vector3.new(100000,100000,100000)
        Noclip.Velocity = Vector3.new(0,0,0)
        end
    if Distance <= 50 then
    tween:Cancel()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    UnNoclip()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
    end
    end
    function BringMob(name,CFrameMon)
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.CFrame = CFrameMon
                        if v.Humanoid:FindFirstChild('Animator') then
                            v.Humanoid.Animator:Destroy()
                        end
                        v.Humanoid:ChangeState(11)
                        v.Humanoid:ChangeState(14)
                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                        end
            end
    end
    function BringMobNear(CFrameMon)
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = CFrameMon
                        if v.Humanoid:FindFirstChild('Animator') then
                            v.Humanoid.Animator:Destroy()
                        end
                        v.Humanoid:ChangeState(11)
                        v.Humanoid:ChangeState(14)
                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                        end
            end
    end
    function GetWeapon(bh)
        s = ""
        for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == bh then
                s = v.Name
            end
        end
        for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == bh then
                s = v.Name
            end
        end
        return s
    end
    function EquipWeapon(ToolSe)
        if gggggg then
            return
        end
        if _G.SelectWeapon == "" or _G.SelectWeapon == nil then
            _G.SelectWeapon = "Melee"
        end
        ToolSe = GetWeapon(_G.SelectWeapon)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            NoClip = true
            local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.4)
            print(bi)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
            NoClip = false
        end
    end
    function EquipWeapon1(m)
        if not m then
            return
        end
        NoClip = true
        ToolSe = m
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.4)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        PlayersServer = i
    end
    Info:AddParagraph({
        Title = "!Hello "..game.Players.LocalPlayer.Name.." Thanks For You Use Annie Script",
        Content = "Current number of players in the server : "..PlayersServer.." "
    })
    Info:AddParagraph({
        Title = "Join Discord To Get Notifications About Latest Scripts",
        Content = "https://discord.gg/Z4BXxMyX"
    })
    Info:AddButton({
        Title = "Copy Link Discord",
        Description = "",
        Callback = function()
            nGU:Dialog({Title = "Light Hub: Complete Copy [Discord Link]",Content = "Join Discord To Get Notifications About Latest Scripts",
            Buttons = {
                    {
                        Title = "Ok",
                        Callback = function()
                            print("discord.gg/annie209")
                            setclipboard("discord.gg/annie209")
                        end
                    }
                }
            })
        end
    })
    Info:AddParagraph({
        Title = "Developer LightReal.21",
        Content = "https://discord.gg/Z4BXxMyX"
    })

    Main:AddParagraph({
        Title = "Farm Mode",
        Content = ""
    })
    if WScript.FarmMode == nil then
        WScript.FarmMode = "Level"
    end
    local FarmMode = Main:AddDropdown("FarmMode", {
        Title = "Farm Mode",
        Values = {"Level","No Quest","Near Mon"},
        Multi = false,
        Default = 1,
    })
    FarmMode:SetValue(WScript.FarmMode)
    FarmMode:OnChanged(function(Value)
        WScript.FarmMode = Value
        saveSettings()
    end)

    local AutoFarmMode = Main:AddToggle("AutoFarmModes", {Title = "Auto Farm Mode", Default = WScript.AutoFarmMode })
    AutoFarmMode:OnChanged(function()
        WScript.AutoFarmMode = Opcc.AutoFarmModes.Value
        saveSettings()
    end)
    local CheckQuest = loadstring(game:HttpGet('https://envscript.site/api/script/CheckQuest.php'))()
    task.spawn(function()
     while task.wait(waits) do
      if WScript.AutoFarmMode then
        CheckQuest()
        if WScript.FarmMode == "Level" then
         if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
         end
         if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            TP(CFrameQuest)
            if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
            end
         elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            CheckQuest()
            if game.Workspace.Enemies:FindFirstChild(NameMon) then 
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                   if v.Name == NameMon then
                    pcall(function()
                    repeat task.wait(waits)
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(8,15,15))
                    EquipWeapon()
                    pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                    if v.Humanoid.Health == 0 then
                        v:Destroy()
                    end
                    until not WScript.AutoFarmMode or WScript.FarmMode ~= "Level" or not v.Parent or not game.Workspace.Enemies:FindFirstChild(NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                end)
                end
                end
            else
                TP(Location[1])
            end
        end
        elseif WScript.FarmMode == "No Quest" then
            CheckQuest()
            if game.Workspace.Enemies:FindFirstChild(NameMon) then 
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                   if v.Name == NameMon then
                    pcall(function()
                    repeat task.wait()
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(8,15,15))
                    EquipWeapon()
                    BringMob(v.Name,v.HumanoidRootPart.CFrame)
                    if v.Humanoid.Health == 0 then
                        v:Destroy()
                    end
                    until not WScript.AutoFarmMode or WScript.FarmMode ~= "No Quest" or v.Humanoid.Health == 0 or not game.Workspace.Enemies:FindFirstChild(NameMon)
                    end)
                end
                end
            else
                TP(Location[1])
            end
        elseif WScript.FarmMode == "Near Mon" then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    pcall(function()
                    repeat task.wait()
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(8,15,15))
                    EquipWeapon()
                    BringMobNear(v.HumanoidRootPart.CFrame)
                    until not WScript.AutoFarmMode or WScript.FarmMode ~= "Near Mon" or v.Humanoid.Health == 0
                end)
                 end
        else
            WScript.FarmMode = "Level"
        end
      end
     end
    end)
    if WScript.MasteryMode == nil then
        WScript.MasteryMode = "Fruit"
    end
    local MasteryMode = Main:AddDropdown("MasteryMode", {
        Title = "Mastery Mode",
        Values = {"Fruit","Gun","Sword"},
        Multi = false,
        Default = 1,
    })
    MasteryMode:SetValue(WScript.MasteryMode)
    MasteryMode:OnChanged(function(Value)
        WScript.MasteryMode = Value
        saveSettings()
    end)

    local AutoMasteryMode = Main:AddToggle("AutoMasteryModes", {Title = "Auto Mastery Mode [Beta]", Default = WScript.AutoMasteryMode })
    AutoMasteryMode:OnChanged(function()
        WScript.AutoMasteryMode = Opcc.AutoMasteryModes.Value
        saveSettings()
    end)
    spawn(function()
        local gg = getrawmetatable(game)
        local old = gg.__namecall
        setreadonly(gg,false)
        gg.__namecall = newcclosure(function(...)
            local method = getnamecallmethod()
            local args = {...}
            if tostring(method) == "FireServer" then
                if tostring(args[1]) == "RemoteEvent" then
                    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                        if UseSkillMasteryDevilFruit and not WScript.AutoMasteryMode then
                            args[2] = PositionSkillMastery
                            return old(unpack(args))
                        elseif AimSkillNearest and not WScript.AutoMasteryMode then
                            args[2] = AimBotSkillPosition
                            return old(unpack(args))
                        end
                    end
                end
            end
            return old(...)
        end)
    end)
    
    function SpamSkillFruit(sss)
            game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = sss
                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                wait(.1)
                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                wait(.1)
                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                wait(.1)
                game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                wait(.1)
                game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
    end
    function EquipWeaponSword(ToolSe)
        if gggggg then
            return
        end
        if _G.SelectWeapon == "" or _G.SelectWeapon == nil then
            _G.SelectWeapon = "Melee"
        end
        ToolSe = GetWeapon("Sword")
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            NoClip = true
            local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(.4)
            print(bi)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
            NoClip = false
        end
    end
    function GetInventoryItem(name)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("LoadItem",name)    
     end
     function CheckPlayerBackpack(c3)
        k = game.Players.LocalPlayer.Backpack
        k2 = game.Players.LocalPlayer.Character
        for r, v in pairs(k:GetChildren()) do
            if v.Name == tostring(c3) then
                return true
            end
        end
        for r, v in pairs(k2:GetChildren()) do
            if v.Name == tostring(c3) then
                return true
            end
        end
    end
    spawn(function()
     while task.wait(waits) do
      if WScript.AutoMasteryMode then
        CheckQuest()
        if WScript.MasteryMode == "Fruit" then
            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
              end
              if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                 TP(CFrameQuest)
                 if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
                 end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(NameMon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                         if v.Name == NameMon then
                            HealthMin = v.Humanoid.MaxHealth * WScript.Select_Health/100
                            if v.Humanoid.Health >= HealthMin then
                            pcall(function()
                                repeat task.wait(waits)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(8,15,15))
                                EquipWeapon()
                                pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                                if v.Humanoid.Health == 0 then
                                    v:Destroy()
                                end
                                until v.Humanoid.Health <= HealthMin  or not WScript.AutoMasteryMode or WScript.MasteryMode ~= "Fruit" or not v.Parent or not game.Workspace.Enemies:FindFirstChild(NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                AimSkillNearest = false
                            end)
                            else
                                pcall(function()
                                    repeat task.wait(waits)
                                    AimBotSkillPosition = v.HumanoidRootPart.Position
                                    AimSkillNearest = true
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                    EquipWeapon1(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                    SpamSkillFruit(v.HumanoidRootPart.CFrame)
                                    if v.Humanoid.Health == 0 then
                                        v:Destroy()
                                    end
                                    until v.Humanoid.Health >= HealthMin  or not WScript.AutoMasteryMode or WScript.MasteryMode ~= "Fruit" or not v.Parent or not game.Workspace.Enemies:FindFirstChild(NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    AimSkillNearest = false
                                end)
                            end
                         end
                        end
                    else
                        AimSkillNearest = false
                        TP(Location[1])
                end
              end
        elseif WScript.MasteryMode == "Gun" then
            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
              end
              if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                 TP(CFrameQuest)
                 if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
                 end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    if game:GetService("Workspace").Enemies:FindFirstChild(NameMon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                         if v.Name == NameMon then
                            HealthMin = v.Humanoid.MaxHealth * WScript.Select_Health/100
                            if v.Humanoid.Health >= HealthMin then
                            pcall(function()
                                repeat task.wait(waits)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(8,15,15))
                                EquipWeapon()
                                pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                                if v.Humanoid.Health == 0 then
                                    v:Destroy()
                                end
                                until v.Humanoid.Health <= HealthMin  or not WScript.AutoMasteryMode or WScript.MasteryMode ~= "Gun" or not v.Parent or not game.Workspace.Enemies:FindFirstChild(NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                AimSkillNearest = false
                            end)
                            else
                                pcall(function()
                                    repeat task.wait(waits)
                                    AimBotSkillPosition = v.HumanoidRootPart.Position
                                    AimSkillNearest = true
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                    EquipWeapon1(game.Players.LocalPlayer.Data.Gun.Value)
                                    SpamSkillFruit(v.HumanoidRootPart.CFrame)
                                    if v.Humanoid.Health == 0 then
                                        v:Destroy()
                                    end
                                    until v.Humanoid.Health >= HealthMin  or not WScript.AutoMasteryMode or WScript.MasteryMode ~= "Gun" or not v.Parent or not game.Workspace.Enemies:FindFirstChild(NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    AimSkillNearest = false
                                end)
                            end
                         end
                        end
                    else
                        AimSkillNearest = false
                        TP(Location[1])
                end
              end
        else
            WScript.MasteryMode = "Fruit"
        end
      end
     end
    end)
    function ChecValue(Type)
        if Type == "FarmNormal" then
        local Bucudb = {}
        local y = game.PlaceId
        if y == 2753915549 then
            Bucudb = {"Not Support Sea 1"}
        elseif y == 4442272183 then
            Bucudb = {"Ectoplasm"}
        elseif y == 7449423635 then
            Bucudb = {"Cake","Bone"}
        end
        return Bucudb
    end
    end
    local FarmNormal = Main:AddDropdown("FarmNormal", {
        Title = "Select Farm Normal",
        Values = ChecValue("FarmNormal"),
        Multi = false,
        Default = 1,
    })
    if WScript.FarmNormal == nil then
        local y = game.PlaceId
        if y == 4442272183 then
            WScript.FarmNormal = "Ectoplasm"
        elseif y == 7449423635 then
        WScript.FarmNormal = "Bone"
        end
    end
    FarmNormal:SetValue(WScript.FarmNormal)
    FarmNormal:OnChanged(function(Value)
        WScript.FarmNormal = Value
        saveSettings()
    end)

    local AutoFarmNormal = Main:AddToggle("AutoFarmNormals", {Title = "Auto Farm Normal", Default = WScript.AutoFarmNormal })
    AutoFarmNormal:OnChanged(function()
        WScript.AutoFarmNormal = Opcc.AutoFarmNormals.Value
        saveSettings()
    end)
    if game.PlaceId == 7449423635 or  game.PlaceId == 4442272183 then
    function AutoCakeQuest()
        if WScript.AutoFarmNormal and WScript.AutoQuestFarmNormal == true then
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Head Baker") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false  then
                TP(CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446))
                if (CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","CakeQuest2",2)
                end
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then   
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                            if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                                repeat wait()
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                    EquipWeapon()
                                    if v.Humanoid.Health <= 0 then
                                        v:Destroy()
                                    end
                                until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0 or  WScript.AutoQuestFarmNormal == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                            end    
                        end    
                    else
                        TP(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875)) 
                    end
                else
                    if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter")  then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
                            if (v.Name == "Baking Staff" or v.Name == "Head Baker" or v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and v.Humanoid.Health > 0 then
                                pcall(function()
                                repeat wait()
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                    EquipWeapon()
                                    if v.Humanoid.Health <= 0 then
                                        v:Destroy()
                                    end
                                    pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                                until WScript.AutoFarmNormal == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or not v.Parent or v.Humanoid.Health <= 0 or  WScript.AutoQuestFarmNormal == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                            end)
                            end
                        end
                    else
                        TP(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
                    end
                end
                end
            end
        end
        function AutoCakeNoQuest()
            if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then   
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                        if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                if v.Humanoid.Health <= 0 then
                                 v:Destroy()
                             end
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0 or WScript.AutoQuestFarmNormal == false
                        end    
                    end    
                else
                    TP(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875)) 
                end
            else
                if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
                        if (v.Name == "Baking Staff" or v.Name == "Head Baker" or v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and v.Humanoid.Health > 0 then
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                if v.Humanoid.Health <= 0 then
                                    v:Destroy()
                                end
                                pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                            until WScript.AutoFarmNormal == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or not v.Parent or v.Humanoid.Health <= 0 or WScript.AutoQuestFarmNormal == false
                        end
                    end
                else
                    TP(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
                end
                end
        end
        function AutoCakeQuest1()
            if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then   
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                        if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                if v.Humanoid.Health <= 0 then
                                    v:Destroy()
                                end
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0
                        end    
                    end    
                else
                    TP(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875)) 
                end
            else
                if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
                        if (v.Name == "Baking Staff" or v.Name == "Head Baker" or v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and v.Humanoid.Health > 0 then
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                if v.Humanoid.Health <= 0 then
                                    v:Destroy()
                                end
                                pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                            until WScript.AutoFarmNormal == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    TP(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
                end
                end
        end
        function AutoBone()
            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                        if v.Humanoid.Health > 0 then
                         pcall(function()
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                if v.Humanoid.Health <= 0 then
                                    v:Destroy()
                                end
                                pcall(function()BringMob(v.Name,v.HumanoidRootPart.CFrame )end)
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0
                        end)
                        end
                    end
                end
            else
                TP(CFrame.new(-9627.919921875, 109.22917938232422, 6063.572265625))
            end
        end
    task.spawn(function()
     while task.wait(waits) do
      if WScript.AutoFarmNormal then
        if WScript.FarmNormal == "Cake" then
            if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then   
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                        if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" or v.Name == "Cake Prince" then
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                if v.Humanoid.Health <= 0 then
                                    v:Destroy()
                                end
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0
                        end    
                    end    
                else
                    TP(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875)) 
                end
            else
                if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
                        if (v.Name == "Baking Staff" or v.Name == "Head Baker" or v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and v.Humanoid.Health > 0 then
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                BringMobNear(v.HumanoidRootPart.CFrame)
                            until WScript.AutoFarmNormal == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                else
                    TP(CFrame.new(-1820.0634765625, 210.74781799316406, -12297.49609375))
                end
                end
        elseif WScript.FarmNormal == "Bone" then
            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                        if v.Humanoid.Health <= 0 then
                            v:Destroy()
                        end
                         pcall(function()
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                BringMobNear(v.HumanoidRootPart.CFrame)
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0
                        end)
                    end
                end
            else
                TP(CFrame.new(-9627.919921875, 109.22917938232422, 6063.572265625))
            end
        elseif WScript.FarmNormal == "Ectoplasm" then
            if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer" then
                        if v.Humanoid.Health > 0 then
                         pcall(function()
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                BringMobNear(v.HumanoidRootPart.CFrame)
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0 or WScript.FarmNormal ~= "Ectoplasm"
                        end)
                        end
                    end
                end
            else
                TP(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
            end
        else
            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                        if v.Humanoid.Health > 0 then
                         pcall(function()
                            repeat wait()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                                EquipWeapon()
                                BringMobNear(v.HumanoidRootPart.CFrame)
                            until WScript.AutoFarmNormal == false or not v.Parent or v.Humanoid.Health <= 0
                        end)
                        end
                    end
                end
            else
                TP(CFrame.new(-9627.919921875, 109.22917938232422, 6063.572265625))
            end
        end
      end
     end
    end)
end
    MiscFarm:AddParagraph({
        Title = "Auto Chest",
        Content = "Auto Collect Chest"
    })
    if WScript.SelectChestTw == nil then
        WScript.SelectChestTw = "Tween"
    end
    local SelectChestTw = MiscFarm:AddDropdown("SelectChestTw", {
        Title = "Select Teleport",
        Values = {"TP","Tween"},
        Multi = false,
        Default = 2,
    })
    SelectChestTw:SetValue(WScript.SelectChestTw)
    SelectChestTw:OnChanged(function(Value)
    WScript.SelectChestTw = Value
    saveSettings()
    end)
    local AutoCollectChest = MiscFarm:AddToggle("AutoCollectsChest", {Title = "Auto Chest [Beta]", Default = Opcc.AutoCollectsChest })
    AutoCollectChest:OnChanged(function()
    WScript.AutoCollectChest = Opcc.AutoCollectsChest.Value
    saveSettings()
    end)
task.spawn(function()
 while task.wait(waits) do
  if WScript.AutoCollectChest then
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        repeat wait()
      if string.find(v.Name,"Chest") then
         if WScript.SelectChestTw == "TP" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
         elseif WScript.SelectChestTw == "Tween" then
            TP(v.CFrame)
         end
      end
    until WScript.AutoCollectChest == false or not v
    end
  end
 end
end)
if game.PlaceId == 7449423635 then
local AutoElite = MiscFarm:AddToggle("AutoElites", {Title = "Auto Elite", Default = Opcc.AutoElite })
AutoElite:OnChanged(function()
WScript.AutoElite = Opcc.AutoElites.Value
saveSettings()
end)
function CheckMob(bk, bl)
    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if
            table.find(bk, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                v.Humanoid.Health > 0
         then
            return v
        end
    end
    if bl then
        for r, v in pairs(game.ReplicatedStorage:GetChildren()) do
            if
                table.find(bk, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                    v.Humanoid.Health > 0
             then
                return v
            end
        end
    end
end
Elites = {"Deandre [Lv. 1750]", "Urban [Lv. 1750]", "Diablo [Lv. 1750]","Deandre", "Urban", "Diablo"}
function CheckElite()
return CheckMob(Elites, true)
end
spawn(function()
    while wait() do 
        if WScript.AutoElite then
           if CheckElite() then
           zmobElite = CheckElite()
           if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,CheckElite().Name:gsub(" %pLv. %d+%p", "")) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
           end
           if game.Workspace.Enemies:FindFirstChild(zmobElite.Name) then
               pcall(function()
                   repeat task.wait()
                       TP(zmobElite.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                       EquipWeapon()
               until WScript.AutoElite == false or not zmobElite.Parent or zmobElite.Humanoid.Health <= 0
           end)
           else
               spawn(TP(zmobElite.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)), 1)
           end
           else
               TP(CFrame.new(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188)))
           end
        end 
      end
   end)

   
local AutoHallowScytle = MiscFarm:AddToggle("AutoHallowScytles", {Title = "Auto Hallow Scytle", Default = Opcc.AutoHallowScytle })
AutoHallowScytle:OnChanged(function()
WScript.AutoHallowScytle = Opcc.AutoHallowScytles.Value
saveSettings()
end)
local BoneMob = {
"Reborn Skeleton [Lv. 1975]",
"Living Zombie [Lv. 2000]",
"Demonic Soul [Lv. 2025]",
"Posessed Mummy [Lv. 2050]",
"Reborn Skeleton",
"Living Zombie",
"Demonic Soul",
"Posessed Mummy"
}
local HallowScytheBossName = {"Soul Reaper [Lv. 2100] [Raid Boss]","Soul Reaper"}

spawn(function()
while wait() do
if WScript.AutoHallowScytle then
if CheckMob(HallowScytheBossName, true) then
    HallowBoss = CheckMob(HallowScytheBossName, true)
    if game.Workspace.Enemies:FindFirstChild(HallowBoss.Name) then
        pcall(function()
            repeat task.wait()
                TP(HallowBoss.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                EquipWeapon()
        until WScript.AutoHallowScytle == false or not HallowBoss.Parent or HallowBoss.Humanoid.Health <= 0
        end)
       else
        spawn(TP(HallowBoss.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)), 1)
    end
elseif CheckPlayerBackpack("Hallow Essence") then
    EquipWeaponName("Hallow Essence")
    TP(CFrame.new(-8932.83789, 144.098709, 6059.34229, -0.999290943, 7.95623478e-09, -0.0376505218, 4.4684243e-09, 1, 9.27205832e-08, 0.0376505218, 9.24866086e-08, -0.999290943))
    EquipWeaponName("Hallow Essence")
else
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
    if CheckMob(BoneMob,true) and not CheckPlayerBackpack("Hallow Essence") and not CheckMob(HallowScytheBossName, true) then
    BoneMon = CheckMob(BoneMob, true)
     if game.Workspace.Enemies:FindFirstChild(BoneMon.Name) then
        pcall(function()
            repeat task.wait()
                TP(BoneMon.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                EquipWeapon()
                BringMob(BoneMon.Name,BoneMon.HumanoidRootPart.CFrame)
        until WScript.AutoHallowScytle == false or not BoneMon.Parent or BoneMon.Humanoid.Health <= 0 and not CheckPlayerBackpack("Hallow Essence") and not CheckMob(HallowScytheBossName, true)
        end)
       else
        spawn(TP(BoneMon.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)), 1)
     end
    end
end
end
end
end)
end

if game.PlaceId == 4442272183 then
    local RaidBoss = {"Darkbeard [Lv. 1000] [Raid Boss]","Darkbeard"}
    local AutoDarkCoat = MiscFarm:AddToggle("AutoDarkCoats", {Title = "Auto Kill Darkbeard", Default = Opcc.AutoDarkCoat })
    AutoDarkCoat:OnChanged(function()
    WScript.AutoDarkCoat = Opcc.AutoDarkCoats.Value
    saveSettings()
    end)
    spawn(function()
     while wait(waits) do
       if  WScript.AutoDarkCoat then
         if CheckMob(RaidBoss,true) then
            local FarmRaidBoss = CheckMob(RaidBoss,true)
            if game.Workspace.Enemies:FindFirstChild(FarmRaidBoss.Name) then
                pcall(function()
                    repeat task.wait()
                        TP(FarmRaidBoss.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                        EquipWeapon()
                until WScript.AutoDarkCoat == false or not FarmRaidBoss.Parent or FarmRaidBoss.Humanoid.Health <= 0
            end)
            else
                spawn(TP(FarmRaidBoss.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)), 1)
            end
        else
            TP(CFrame.new(3777.564697265625, 14.876824378967285, -3499.460205078125))
         end
       end
     end
    end)
    local BossSwan = {"Don Swan [Lv. 1000] [Boss]","Don Swan"}
    local AutoSwanGlasses = MiscFarm:AddToggle("AutoSwanGlassess", {Title = "Auto Swan Glasses", Default = Opcc.AutoSwanGlasses })
    AutoSwanGlasses:OnChanged(function()
    WScript.AutoSwanGlasses = Opcc.AutoSwanGlassess.Value
    saveSettings()
    end)
    spawn(function()
     while wait(waits) do
       if  WScript.AutoSwanGlasses then
         if CheckMob(BossSwan,true) then
            local FarmBossSwan = CheckMob(BossSwan,true)
            if game.Workspace.Enemies:FindFirstChild(FarmBossSwan.Name) then
                pcall(function()
                    repeat task.wait()
                        TP(FarmBossSwan.HumanoidRootPart.CFrame * CFrame.new(0,15,15))
                        EquipWeapon()
                until WScript.AutoDarkCoat == false or not FarmBossSwan.Parent or FarmBossSwan.Humanoid.Health <= 0
            end)
            else
                spawn(TP(FarmBossSwan.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)), 1)
            end
        else
            TP(CFrame.new(2284.912109375, 15.537666320801, 905.48291015625))
         end
       end
     end
    end)
end
RaceV4:AddParagraph({
    Title = "Race V4",
    Content = "Update Auto Pull Level Soon"
})
function CheckAndTweenTemple()
TempleOfTimeCFrame = CFrame.new(28734.3945,14888.2324,-109.071777,-0.650207579,4.1780531e-08,-0.759756625,1.97876595e-08,1,3.80575109e-08,0.759756625,9.71147784e-09,-0.650207579)
    if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
        TweenTemple()
    end
    if (TempleOfTimeCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1200 then
        TweenTemple()
    end
end
function PullLever()
    local bn = CFrame.new(28576.4688,14939.2832,76.5164413,-1,0,0,0,0.707134247,-0.707079291,-0,-0.707079291,-0.707134247)
    local bo = CFrame.new(28576.4688,14935.9512,75.469101,-1,-4.22219593e-08,1.13133396e-08,0,-0.258819044,-0.965925813,4.37113883e-08,-0.965925813,0.258819044)
    local bp = 0.2
    if game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp then
        CheckAndTweenTemple()
        Tweento(game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
        for r, v in pairs(game:GetService("Workspace").Map["Temple of Time"].Lever:GetDescendants()) do
            if v.Name == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
    end
end
RaceV4:AddButton({
    Title = "Pull Level",
    Description = "",
    Callback = function()
        PullLever()
    end
})

local BypassTrial_Mink = RaceV4:AddToggle("BypassTrial_Minks", {Title = "Auto Trial Mink", Default = false })
BypassTrial_Mink:OnChanged(function()
WScript.BypassTrial_Mink = Opcc.BypassTrial_Minks.Value
end)
spawn(function()
        while task.wait() do
            task.wait()
            if WScript.BypassTrial_Mink then
                pcall(
                    function()
                        local c0 = game:GetService("Workspace").StartPoint
                        if
                            (c0.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                500
                         then
                            TP(c0.CFrame)
                            for r, v in pairs(game:GetDescendants()) do
                                if v:IsA("TouchInterest") or v.Name == "TouchInterest" then
                                    if
                                        (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                            50
                                     then
                                        firetouchinterest(v)
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    end)


    local BypassTrial_Sky = RaceV4:AddToggle("BypassTrial_Skys", {Title = "Auto Trial Sky", Default = false })
    BypassTrial_Sky:OnChanged(function()
    WScript.BypassTrial_Sky = Opcc.BypassTrial_Skys.Value
    end)
    task.spawn(function()
            while wait() do
                task.wait()
                if WScript.BypassTrial_Sky then
                    pcall(
                        function()
                            local c1 = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
                            if
                                (c1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    2000
                             then
                                wait(2)
                                TP(c1.CFrame)
                                wait(3)
                            end
                        end
                    )
                end
            end
        end)

        local BypassTrial_Cybord = RaceV4:AddToggle("BypassTrial_Cybords", {Title = "Auto Trial Cybord", Default = false })
        BypassTrial_Cybord:OnChanged(function()
        WScript.BypassTrial_Cybord = Opcc.BypassTrial_Cybords.Value
        end)

        CyborgBypassCFrame =
        CFrame.new(
        -20021.8691,
        10090.4893,
        -16.37994,
        -0.976144373,
        6.71342875e-08,
        -0.217122361,
        8.46145412e-08,
        1,
        -7.1212007e-08,
        0.217122361,
        -8.78849065e-08,
        -0.976144373
    )

    spawn(
        function()
            while wait() do
                if WScript.BypassTrial_Cybord then
                    pcall(
                        function()
                            if
                                (CyborgBypassCFrame.Position -
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
                             then
                                TP(CyborgBypassCFrame)
                                wait(3)
                            end
                        end
                    )
                end
            end
        end
    )

    local BypassTrial_Ghoul = RaceV4:AddToggle("BypassTrial_Ghouls", {Title = "Auto Trial Ghoul", Default = false })
    BypassTrial_Ghoul:OnChanged(function()
    WScript.BypassTrial_Ghoul = Opcc.BypassTrial_Ghouls.Value
    end)
    function BringMobGhoul()
        if
            game:GetService("Workspace").Map:FindFirstChild("GhoulTrial") and
                game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Carnage")
         then
            GhoulhPart2 =
                CFrame.new(
                -11706.6777,
                10011.5615,
                11.6579161,
                0.54723686,
                -2.79323835e-08,
                -0.83697778,
                2.69866494e-08,
                1,
                -1.57283679e-08,
                0.83697778,
                -1.3980082e-08,
                0.54723686
            )
            if GhoulhPart2 then
                for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if
                        GhoulhPart2 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                            (v.HumanoidRootPart.Position - GhoulhPart2.Position).magnitude <= 1500
                     then
                        pcall(
                            function()
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                v.Humanoid.Health = 0
                            end
                        )
                    end
                end
            end
        end
    end
    task.spawn(
    function()
        while task.wait() do
            task.wait()
            if WScript.BypassTrial_Ghoul then
                if
                    game:GetService("Workspace").Map:FindFirstChild("GhoulTrial") and
                        game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Carnage")
                 then
                    GhoulhPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].CFrame
                    if
                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GhoulhPart.Position).Magnitude <=
                            1000
                     then
                        BringMobGhoul()
                        if
                            GhoulhPart2 and
                                (GhoulhPart2.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    500
                         then
                            TP(GhoulhPart2 * CFrame.new(0, math.random(-15, 30), 0))
                        end
                    end
                end
            end
        end
    end
)

local BypassTrial_Human = RaceV4:AddToggle("BypassTrial_Humans", {Title = "Auto Trial Human", Default = false })
BypassTrial_Human:OnChanged(function()
WScript.BypassTrial_Human = Opcc.BypassTrial_Humans.Value
end)
task.spawn(
    function()
        while task.wait() do
            task.wait()
            if WScript.BypassTrial_Human then
                if
                    game:GetService("Workspace").Map:FindFirstChild("HumanTrial") and
                        game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Strength")
                 then
                    StrengthPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].CFrame
                    if
                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <=
                            1000
                     then
                        for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if
                                v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                    (v.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 200
                             then
                                repeat
                                    wait()
                                    pcall(
                                        function()
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                            v.Humanoid.Health = 0
                                        end
                                    )
                                until not v or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end
        end
    end
)
Raid:AddParagraph({
    Title = "Raid",
    Content = "Auto Raid Not UnStore Fruit Buy Chip"
})
Raidslist = {}
RaidsModule = require(game.ReplicatedStorage.Raids)
for r, v in pairs(RaidsModule.raids) do
    if v.Name ~= " " then
        table.insert(Raidslist, v)
    end
end
for r, v in pairs(RaidsModule.advancedRaids) do
    if v.Name ~= " " then
        table.insert(Raidslist, v)
    end
end
local ChoseRaid = Raid:AddDropdown("ChoseRaid", {
    Title = "Chose Raid",
    Values = Raidslist,
    Multi = false,
    Default = 1,
})
ChoseRaid:SetValue("Flame")
ChoseRaid:OnChanged(function(Value)
WScript.ChoseRaid = Value
end)

local AutoRaid = Raid:AddToggle("AutoRaids", {Title = "Auto Raid", Default = false })
AutoRaid:OnChanged(function()
WScript.AutoRaid = Opcc.AutoRaids.Value
end)
function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
             then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
             then
                return v
            end
        end
    end
end
function getNextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if
            IsIslandRaid(v) and
                (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                    4500
         then
            return IsIslandRaid(v)
        end
    end
end
function CheckIsRaiding()
    checkraid1 = game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true
    checkraid2 = getNextIsland()
    if checkraid1 then
        return checkraid1
    end
    return checkraid2
end
function CheckTool(cJ)
    lol = {game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Backpack}
    for r, v in pairs(lol) do
        if v:FindFirstChild(cJ) then
            return v:FindFirstChild(cJ)
        end
    end
end
local y = game.PlaceId
if y == 2753915549 then
    Sea1 = true
elseif y == 4442272183 then
    Sea2 = true
elseif y == 7449423635 then
    Sea3 = true
end
spawn(function()
 while wait(waits) do
    if (Sea2 or Sea3) and WScript.AutoRaid and (CheckTool("Special Microchip") or CheckIsRaiding()) then
  if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then
    wait(10)
elseif CheckTool("Special Microchip") then
    if Sea2 then
        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        wait(5)
    elseif Sea3 then
        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        wait(5)
    end
elseif not CheckTool("Special Microchip") then
    v282 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", WScript.ChoseRaid)
    wait(2)
end
end
 end
end)
spawn(function()
        while task.wait() do
            if (Sea2 or Sea3) and WScript.AutoRaid and CheckIsRaiding() then
                pcall(function()
                        if getNextIsland() then
                            spawn(TP(getNextIsland().CFrame * CFrame.new(0, 60, 0)), 1)
                        end
                        spawn(
                            function()
                                for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if v:FindFirstChild("Humanoid") then
                                        spawn(function()
                                                repeat wait(waits)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                                until not v or not v:FindFirstChild("Humanoid") or v.Humanoid.Health == 0
                                            end)
                                    end
                                end
                            end)
                    end)
            elseif (Sea2 or Sea3) and WScript.AutoRaid then
                local cv =
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", WScript.ChoseRaid) == 1
                task.wait(20)
            end
        end
    end)

Teleport:AddParagraph({
    Title = "Teleport Sea",
    Content = ""
})
function CheckSea(e)
    if game.PlaceId == 2753915549 then
        if e == 1 then
            return true
        end
    elseif game.PlaceId == 4442272183 then
        if e == 2 then
            return true
        end
    elseif game.PlaceId == 7449423635 then
        if e == 3 then
            return true
        end
    end
    return false
end
function TeleportSea(Sea)
    if Sea == 1 then
        if not CheckSea(Sea) then
            local args = {[1] = "TravelMain"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait()
        else
            Notify("[Annie] Teleport Sea","Your you were in Sea 1",3,"[W-Script]")
        end
    elseif Sea == 2 then
        if not CheckSea(Sea) then
            local args = {[1] = "TravelDressrosa"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        else
            Notify("[Annie] Teleport Sea","Your you were in Sea 2",3,"[W-Script]")
        end
    elseif Sea == 3 then
        if not CheckSea(Sea) then
            local args = {[1] = "TravelZou"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        else
            Notify("[Annie] Teleport Sea","Your you were in Sea 3",3,"[W-Script]")
        end
    end
end
Teleport:AddButton({
    Title = "Teleport Sea",
    Description = "",
    Callback = function()
        nGU:Dialog({
            Title = "Select Sea",
            Content = "",
            Buttons = {
                {
                    Title = "Sea 1",
                    Callback = function()
                        print("1")
                        TeleportSea(1)
                    end
                },
                {
                    Title = "Sea 2",
                    Callback = function()
                        print("2")
                        TeleportSea(2)
                    end
                },
                {
                    Title = "Sea 3",
                    Callback = function()
                        print("3")
                        TeleportSea(3)
                    end
                }
            }
        })
    end
})

if CheckSea(3) then
    Teleport:AddParagraph({
        Title = "Teleport Mystic",
        Content = ""
    })
function TweenMirage()
    repeat
        wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        AllNPCS = getnilinstances()
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                TP(v.HumanoidRootPart.CFrame)
            end
        end
    end
end
function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
end
function getHighestPoint()
    if not game.workspace.Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for r, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://6745037796" then
                return v
            end
        end
    end
end
function TwenetoHighestPoint()
    HighestPoint = getHighestPoint()
    if HighestPoint then
        TP(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
    end
end
function TPBlueGear()
    BlueGear = getBlueGear()
    if BlueGear then
        TP(BlueGear.CFrame)
    end
end
Teleport:AddButton({
    Title = "Teleport Mystic Island",
    Description = "Teleport to Mystic Island",
    Callback = function()
        TweenMirage()
    end
})
Teleport:AddButton({
    Title = "Teleport Highest Point",
    Description = "Teleport to Highest Pos Mystic Island",
    Callback = function()
        TwenetoHighestPoint()
    end
})
Teleport:AddButton({
    Title = "Teleport Blue Gear",
    Description = "Teleport to Bule Gear in Mystic Island",
    Callback = function()
        TPBlueGear()
    end
})

Teleport:AddParagraph({
    Title = "Teleport Temple",
    Content = ""
})

function TweenTemple()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
        "requestEntrance",
        Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
    )
end
function TweenRaceDoor()
    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
        wait(1)
        TP(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
        wait(1)
        TP(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
        wait(1)
        TP(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
        wait(1)
        TP(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
        wait(1)
        TP(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
        elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
        wait(1)
        TP(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
    end
end
Teleport:AddButton({
    Title = "Teleport Temple",
    Description = "",
    Callback = function()
        TweenTemple()
    end
})
Teleport:AddButton({
    Title = "Teleport to Race Door",
    Description = "",
    Callback = function()
        TweenRaceDoor()
    end
})

end

Shop:AddParagraph({
    Title = "Melee Shop",
    Content = ""
})
local Melee = {"BlackLeg","Electro","Fishman Karate","Dragon Claw","Sanguine Art","Superhuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","GodHuman"}
function BuyMelee(f1)
if f1 == "BlackLeg" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
elseif f1 == "Electro" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
elseif f1 == "Fishman Karate" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
elseif f1 == "Dragon Claw" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
elseif f1 == "Sanguine Art" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt",false)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt",true)
elseif f1 == "Superhuman" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
elseif f1 == "Death Step" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
elseif f1 == "Sharkman Karate" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
elseif f1 == "Electric Claw" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
elseif f1 == "Dragon Talon" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
elseif f1 == "GodHuman" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
end
end
local SelectMeleeShop = Shop:AddDropdown("SelectMeleeShop", {
    Title = "Select Melee",
    Values = Melee,
    Multi = false,
    Default = 1,
})
SelectMeleeShop:SetValue(WScript.SelectMeleeShop)
SelectMeleeShop:OnChanged(function(Value)
    WScript.SelectMeleeShop = Value
    saveSettings()
end)

Shop:AddButton({
    Title = "Buy Melee",
    Description = "",
    Callback = function()
BuyMelee(WScript.SelectMeleeShop)
    end
})

Shop:AddParagraph({
    Title = "Acient Shop",
    Content = ""
})

Shop:AddButton({
    Title = "Buy Acient Quest",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
    end
})
local BuyAcientQuest = Shop:AddToggle("AutoBuyAcient", {Title = "Auto Buy Acient Quest", Default = false })
BuyAcientQuest:OnChanged(function()
    WScript.BuyAcientQuest = Opcc.AutoBuyAcient.Value 
end)
spawn(function()
    while wait() do
            if WScript.BuyAcientQuest then
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
            end
        end
    end)

    Shop:AddParagraph({
        Title = "Bone Shop",
        Content = ""
    })
    Shop:AddButton({
        Title = "Random Bone",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    })
    local AutoRandomBone = Shop:AddToggle("AutoRandomBones", {Title = "Auto Random Bone", Default = false })
    AutoRandomBone:OnChanged(function()
        WScript.AutoRandomBones = Opcc.AutoRandomBones.Value 
    end)
spawn(function()
    while wait() do
        if WScript.AutoRandomBones then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end)
    Shop:AddParagraph({ 
    Title = "Race Shop",
    Content = ""
    })

    Shop:AddButton({
        Title = "Buy Race Ghoul",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
        end
    })

    Shop:AddButton({
        Title = "Buy Race Cyborg",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Buy")
        end
    })

    Shop:AddButton({
        Title = "Random Race",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll",2)
        end
    })

    Shop:AddButton({
        Title = "Reset Stats",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund",2)
        end
    })

    DevilFruit:AddParagraph({ 
        Title = "Fruit Sniper",
        Content = ""
        })
        Table_DevilFruitSniper = {}
        ShopDevilSell = {}
        local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
        for i,v in next,Remote_GetFruits do
            table.insert(Table_DevilFruitSniper,v.Name)
            if v.OnSale then 
                table.insert(ShopDevilSell,v.Name)
            end
        end
    
        local SelectFruitSniper = DevilFruit:AddDropdown("SelectFruitSniper", {
            Title = "Select Fruit Sniper",
            Values = Table_DevilFruitSniper,
            Multi = false,
            Default = 1,
        })
        SelectFruitSniper:SetValue(WScript.SelectFruitSniper)
        SelectFruitSniper:OnChanged(function(Value)
        WScript.SelectFruitSniper = Value
        end)
        local AutoBuyFruitSniper = DevilFruit:AddToggle("AutoBuyFruitSnipers", {Title = "Auto Buy Fruit Sniper", Default = false })
        AutoBuyFruitSniper:OnChanged(function()
            WScript.AutoBuyFruitSniper = Opcc.AutoBuyFruitSnipers.Value 
        end)
        spawn(function()
            while wait() do
                if WScript.AutoBuyFruitSniper then
                    pcall(function()
                        local string_1 = "PurchaseRawFruit";
                        local string_2 = WScript.SelectFruitSniper;
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                    end)
                end                              
            end
        end)
        
        DevilFruit:AddButton({
            Title = "Check Devil Fruit Seller",
            Description = "",
            Callback = function()
                ShopDevilSell = {}
                for i,v in next,Remote_GetFruits do
                    if v.OnSale then 
                        table.insert(ShopDevilSell,v.Name)
                    end
                end
                local ShopDevilSell1 = table.concat(ShopDevilSell, ",")
                nGU:Dialog({
                    Title = "Devil Fruit Sell",
                    Content = "Fruit : "..ShopDevilSell1.." ",
                    Buttons = {
                        {
                            Title = "Ok",
                            Callback = function()
                            end
                        },
                    }
                })
            end
        })
        DevilFruit:AddButton({
            Title = "Random Fruit",
            Description = "",
            Callback = function()
                local args = {
                    [1] = "Cousin",
                    [2] = "Buy"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        })
        local AutoRandomFruit = DevilFruit:AddToggle("AutoRandomFruits", {Title = "Auto Random Fruits", Default = false })
        AutoRandomFruit:OnChanged(function()
            WScript.AutoRandomFruits = Opcc.AutoRandomFruits.Value 
        end)
        spawn(function()
            while wait() do
                if WScript.AutoRandomFruits then	
                    local args = {
                        [1] = "Cousin",
                        [2] = "Buy"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)

        Misc:AddButton({
            Title = "Join Team",
            Description = "",
            Callback = function()
                nGU:Dialog({
                    Title = "Join Team",
                    Content = "",
                    Buttons = {
                        {
                            Title = "Pirates",
                            Callback = function()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress")
                            end
                        },
                        {
                            Title = "Marines",
                            Callback = function()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress")
                            end
                        }
                    }
                })
            end
        })
        local function Hop()
            for r = 1, 100 do
                if ChooseRegion == nil or ChooseRegion == "" then
                    ChooseRegion = "Singapore"
                else
                    game:GetService("Players").LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                        ChooseRegion
                end
                local bP = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(r)
                for k, v in pairs(bP) do
                    if k ~= game.JobId and v["Count"] < bO then
                        if not bM[k] or tick() - bM[k].Time > 60 * 10 then
                            bM[k] = {Time = tick()}
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible then
                                Notify("Script Status", "Founded Server But InCombat", 15,"[W-Script]")
                                repeat
                                    wait()
                                    AntiLowHealth(math.random(8500, 10000))
                                until not game:GetService("Players").LocalPlayer or
                                    not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible
                                Notify("Script Status", "Joining Server ID: " .. k .. "\nRegion: " .. v["Region"], 15,"[W-Script]")
                            else
                                Notify("Script Status", "Joining Server ID: " .. k .. "\nRegion: " .. v["Region"], 15,"[W-Script]")
                            end
                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", k)
                            return true
                        elseif tick() - bM[k].Time > 60 * 60 then
                            bM[k] = nil
                        end
                    end
                end
            end
            return false
        end
        function Rejoin()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
        end
        Misc:AddButton({
            Title = "Server",
            Description = "",
            Callback = function()
                nGUS:Dialog({
                    Title = "Server",
                    Content = "",
                    Buttons = {
                        {
                            Title = "Rejoin",
                            Callback = function()
                                Rejoin()
                            end
                        },
                        {
                            Title = "Hop",
                            Callback = function()
                                Hop()
                            end
                        }
                    }
                })
            end
        })

        local SelectUI = Misc:AddDropdown("SelectUI", {
            Title = "Select UI",
            Values = {"Devil Fruit Shop","Titles","Haki Color","Awakening Toggler"},
            Multi = false,
            Default = 1,
        })
        SelectUI:SetValue(WScript.SelectUI)
        SelectUI:OnChanged(function(Value)
        WScript.SelectUI = Value
        saveSettings()
        end)
        Misc:AddButton({
            Title = "Open UI",
            Description = "",
            Callback = function()
            if WScript.SelectUI == "Devil Fruit Shop" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
            elseif WScript.SelectUI == "Titles" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getTitles")
                game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
            elseif WScript.SelectUI == "Haki Color" then
                game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
            elseif WScript.SelectUI == "Awakening Toggler" then
                game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
            end
            end
        })
        
        local WhiteScreen = Misc:AddToggle("WhiteScreens", {Title = "White Screen", Default = false })
        WhiteScreen:OnChanged(function()
            WScript.WhiteScreen = Opcc.WhiteScreens.Value 
        end)
spawn(function()
while wait() do
        if WScript.WhiteScreen then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
end)

        local Remove_Fogs = Misc:AddToggle("Remove_Fog", {Title = "Remove Fog", Default = false })
        Remove_Fogs:OnChanged(function()
            _G.Remove_Fog = Opcc.Remove_Fog.Value 
            if not _G.Remove_Fog then return end
            while _G.Remove_Fog do wait()
                game.Lighting.FogEnd = 9e9
                if not _G.Remove_Fog then
                    game.Lighting.FogEnd = 2500
                end
            end
        end)
function FpsBoost()
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end
function WaterRemvoe()
    for i,v in pairs(workspace:GetDescendants()) do
        if string.find(v.Name,"Water") then
            v:Destroy()
        end
    end
end
function ObjectRemvoe()
    for i,v in pairs(workspace:GetDescendants()) do
        if string.find(v.Name,"Tree") or string.find(v.Name,"House") or string.find(v.Name,"BoatFlower_FlowerBoat") or string.find(v.Name,"LavaParts") or string.find(v.Name,"bloxfruits_bossarea_Cylinder") or string.find(v.Name,"bloxfruits_skull2_Cone") then
            v:Destroy()
        end
    end
end
function InvisibleObject()
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if  (v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart")) and v.Transparency then
            v.Transparency = 1
        end
    end
end
Misc:AddButton({
    Title = "Fps Boost",
    Description = "",
    Callback = function()
        FpsBoost()
    end
})

Misc:AddButton({
    Title = "Fps Boost 1",
    Description = "",
    Callback = function()
        WaterRemvoe()
        ObjectRemvoe()
        InvisibleObject()
    end
})
local Plr = game.Players.LocalPlayer
local Connection = {}
local Highlight_Folder = Instance.new("Folder")
Highlight_Folder.Name = "Highlight_Folder"
Highlight_Folder.Parent = game.CoreGui
local Highlight = function(Target)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = Target.Name
    Highlight.FillColor = Color3.fromRGB(255, 255, 0)
    Highlight.DepthMode = "AlwaysOnTop"
    Highlight.FillTransparency = 0.7
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    Highlight.Parent = Highlight_Folder
    if Target.Character then
        Highlight.Adornee = Target.Character
    end
    Connection[Target] = Target.CharacterAdded:Connect(function(Characters)
        Highlight.Adornee = Characters
    end)
end
Misc:AddButton({
    Title = "Players Higlith",
    Description = "",
    Callback = function()
        Highlight(game.Players.LocalPlayer)
    end
})
Misc:AddButton({
    Title = "All Players Higlith",
    Description = "",
    Callback = function()
        game.Players.PlayerAdded:Connect(Highlight)
        for i, v in next, game.Players:GetPlayers() do
            Highlight(v)
        end
    end
})


    if WScript.Select_Health == nil then
        WScript.Select_Health = 50
    end
    if WScript.DelayAttack == nil then
        WScript.DelayAttack = 7
    end
    local MasterySettingsHealth = Settings:AddSlider("MasterySettingsHealth", {
        Title = "Mastery Health Settings",
        Description = "",
        Default = WScript.Select_Health,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            WScript.Select_Health = Value
        saveSettings()
        end
    })

    local FasAttackSettings = Settings:AddSlider("FasAttackSettings", {
        Title = "Fast Attack Settings",
        Description = "",
        Default = WScript.DelayAttack,
        Min = 2,
        Max = 10,
        Rounding = 1,
        Callback = function(Value)
            WScript.DelayAttack = Value
            saveSettings()
        end
    })

local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

require(game.ReplicatedStorage.Util.CameraShaker):Stop()

function GetBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then 
        return 
    end
    while ret.Parent ~= game.Players.LocalPlayer.Character do 
        ret = ret.Parent 
    end
    return ret
end

function AttackNoCD(Num)
    if Num == 1 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        AC.animator.anims.basic[1]:Play(0.001,0.001,0.001)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end)
            end
        end
    elseif Num == 0 then
        local AC = CbFw2.activeController
        for i = 1,1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                55
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        for i,CombatFrameworkR in pairs(CbFw) do
                            pcall(function()
                                if i == 2 then
                                    CombatFrameworkR.activeController.increment = 4
                                    CombatFrameworkR.activeController.hitboxMagnitude = 55
                                    CombatFrameworkR.activeController.timeToNextAttack = tick()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760))
                                end
                            end)
                        end
                    end
                end)
            end
        end
    end
end

local STOP = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)

if not shared.orl then
    shared.orl = STOPRL.wrapAttackAnimationAsync
end

if not shared.cpc then
    shared.cpc = STOP.play 
end

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end         
            if Hits then
                STOP.play = function() end
                a:Play(15.25,15.25,15.25)
                func(Hits)
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end      
        end
    end
end)

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = function() end
                a:Play(0.01,0.01,0.01)
                func(Hits)                
                STOP.play = shared.cpc
                wait(0.5)
                a:Stop()
            end             
        end
    end
end)

spawn(function()
    while task.wait() do
        STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = STOPRL.getBladeHits(b,c,d)
            if Hits then
                STOP.play = shared.cpc
                func(Hits)   
            end             
        end
    end
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if true or false then
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    AttackNoCD(0)
                end
            end
        end)
    end
end)

b2 = tick()
spawn(function()
    while wait(0.1/WScript.DelayAttack) do
        if b2 - tick() > 1.5 then
            wait(0.01)
            b2 = tick()
        end
        pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                AttackNoCD(1)
            end
        end)
    end
end)

local AutoStatsMelee = Stats:AddToggle("AutoStatsMelees", {Title = "Auto Stats Melee", Default = false })
AutoStatsMelee:OnChanged(function()
    print("Toggle changed:", Opcc.AutoStatsMelees.Value)
    repeat wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",100)
    until Opcc.AutoStatsMelees.Value == false
end)
local AutoStatsDefense = Stats:AddToggle("AutoStatsDefenses", {Title = "Auto Stats Defense", Default = false })
AutoStatsDefense:OnChanged(function()
    print("Toggle changed:", Opcc.AutoStatsDefenses.Value)
    repeat wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",100)
    until Opcc.AutoStatsDefenses.Value == false
end)
local AutoStatsSword = Stats:AddToggle("AutoStatsSword", {Title = "Auto Stats Sword", Default = false })
AutoStatsSword:OnChanged(function()
    print("Toggle changed:", Opcc.AutoStatsSword.Value)
    repeat wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",100)
    until Opcc.AutoStatsSword.Value == false
end)
local AutoStatsGuns = Stats:AddToggle("AutoStatsGun", {Title = "Auto Stats Gun", Default = false })
AutoStatsGuns:OnChanged(function()
    print("Toggle changed:", Opcc.AutoStatsGun.Value)
    repeat wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",100)
    until Opcc.AutoStatsGun.Value == false
end)
local AutoStatsFruit = Stats:AddToggle("AutoStatsFruits", {Title = "Auto Stats Fruit", Default = false })
AutoStatsFruit:OnChanged(function()
    print("Toggle changed:", Opcc.AutoStatsFruits.Value)
    repeat wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",100)
    until Opcc.AutoStatsFruits.Value == false
end)

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
ScreenGui.Name = ""
ScreenGui.Parent = game.CoreGui or game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "https://www.roblox.com/asset/?id=10716032293"
UICorner.Parent = ImageButton
ImageButton.MouseButton1Down:connect(function()
       game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
       game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
pcall(function()
local request = http_request or request or HttpPost or syn.request
if game.PlaceId == 7449423635 and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
    urlMystic = ""
    for i,v in pairs(game.Players:GetPlayers()) do
        CheckPlayerMystic = i
		print(CheckPlayerMystic)
    end
	local Moon = {
['8'] = "http://www.roblox.com/asset/?id=9709149431", -- 🌕
['7'] = "http://www.roblox.com/asset/?id=9709149052", -- 🌖
['6'] = "http://www.roblox.com/asset/?id=9709143733", -- 🌗
['5'] = "http://www.roblox.com/asset/?id=9709150401", -- 🌘
['4'] = "http://www.roblox.com/asset/?id=9709135895",  -- 🌑
['3'] = "http://www.roblox.com/asset/?id=9709139597", -- 🌒
['2'] = "http://www.roblox.com/asset/?id=9709150086", -- 🌓
['1'] = "http://www.roblox.com/asset/?id=9709149680", -- 🌔
};

    if game:GetService("Lighting").Sky.MoonTextureId == Moon['1'] then
        MoonIcon = '🌔'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['2'] then
        MoonIcon = '🌓'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['3'] then
        MoonIcon = '🌒'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['4'] then
        MoonIcon = '🌑'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['5'] then
        MoonIcon = '🌘'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['6'] then
        MoonIcon = '🌗'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['7'] then
        MoonIcon = '🌖'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['8'] then
        MoonIcon = '🌕'
    end

    for i,v in pairs(Moon) do
        if game:GetService("Lighting").Sky.MoonTextureId == v then
            MysticMoonPercent = i / 8 * 100
			print(MysticMoonPercent)
        end
    end
MysticScriptJoinServer = 'game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,'..'\''..tostring(game.JobId)..'\''..')'
local MysticHook = {
	["embeds"] = {
        {
            ["title"] = "<:meofmeca:1158419480276389949>** KAY Webhooks Status**",
            ["description"] = "",
            ["color"] = 16250357,
            ["type"] = "rich",
            ["fields"] =  {
                                {
                                    ["name"] = "🏝️ **Spawn**",
                                    ["value"] = '```🟢```',
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "🔹Player Server🎄",
                                    ["value"] = '```yaml\n'..CheckPlayerMystic..'/12```',
                                    ["inline"] = false
                                },
                                {
                                    ["name"] = "**Job ID :**",
                                    ["value"] = '```lua\n'..game.JobId..'```',
                                    ["inline"] = false
                                },
                                {
                                    ["name"] = "**Script :**",
                                    ["value"] = '```lua\n'..MysticScriptJoinServer..'```',
                                    ["inline"] = true
                                }
            },
                ["image"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/1120720323147481121/1158393704667693117/anh-bia-facebook-cute-cap-doi.jpg?ex=651c15b5&is=651ac435&hm=3ecffa3b5fe67e2a23040d3fd870e41d25707a425afd9a7037b3784d5189682a&",
                },
            ["footer"] = {
                ["text"] = "Yesterday at "..os.date("%H:%M")
            }
        }
},
}
local newdata = game:GetService("HttpService"):JSONEncode(MysticHook)
local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost or syn.request
local Send = {Url = urlMystic, Body = newdata, Method = "POST", Headers = headers}
request(Send)
end
if game.PlaceId == 7449423635 and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
    urlMystic = ""
    for i,v in pairs(game.Players:GetPlayers()) do
        CheckPlayerMystic = i
		print(CheckPlayerMystic)
    end
	local Moon = {
['8'] = "http://www.roblox.com/asset/?id=9709149431", -- 🌕
['7'] = "http://www.roblox.com/asset/?id=9709149052", -- 🌖
['6'] = "http://www.roblox.com/asset/?id=9709143733", -- 🌗
['5'] = "http://www.roblox.com/asset/?id=9709150401", -- 🌘
['4'] = "http://www.roblox.com/asset/?id=9709135895",  -- 🌑
['3'] = "http://www.roblox.com/asset/?id=9709139597", -- 🌒
['2'] = "http://www.roblox.com/asset/?id=9709150086", -- 🌓
['1'] = "http://www.roblox.com/asset/?id=9709149680", -- 🌔
};

    if game:GetService("Lighting").Sky.MoonTextureId == Moon['1'] then
        MoonIcon = '🌔'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['2'] then
        MoonIcon = '🌓'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['3'] then
        MoonIcon = '🌒'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['4'] then
        MoonIcon = '🌑'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['5'] then
        MoonIcon = '🌘'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['6'] then
        MoonIcon = '🌗'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['7'] then
        MoonIcon = '🌖'
    elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['8'] then
        MoonIcon = '🌕'
    end

    for i,v in pairs(Moon) do
        if game:GetService("Lighting").Sky.MoonTextureId == v then
            MysticMoonPercent = i / 8 * 100
			print(MysticMoonPercent)
        end
    end
MysticScriptJoinServer = 'game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,'..'\''..tostring(game.JobId)..'\''..')'
urlMystic1 = ""
local MysticHook1 = {
	["embeds"] = {
{
    ["title"] = "<:meofmeca:1158419480276389949>** KAY Webhooks Status**",
    ["description"] = "",
    ["color"] = 16250357,
    ["type"] = "rich",
	["fields"] =  {
                        {
							["name"] = "🏝️ **Spawn**",
							["value"] = '```🟢```',
							["inline"] = true
                        },
						{
							["name"] = "🔹Player Server🎄",
							["value"] = '```yaml\n'..CheckPlayerMystic..'/12```',
							["inline"] = false
                        },
                        {
							["name"] = "**Job ID :**",
							["value"] = '```lua\n'..game.JobId..'```',
							["inline"] = false
                        },
						{
							["name"] = "**Script :**",
							["value"] = '```lua\n'..MysticScriptJoinServer..'```',
							["inline"] = true
                        }
	},
        ["image"] = {
        ["url"] = "https://cdn.discordapp.com/attachments/1120720323147481121/1158393704667693117/anh-bia-facebook-cute-cap-doi.jpg?ex=651c15b5&is=651ac435&hm=3ecffa3b5fe67e2a23040d3fd870e41d25707a425afd9a7037b3784d5189682a&",
        },
    ["footer"] = {
        ["text"] = "Yesterday at "..os.date("%H:%M")
    }
}
},
}
local newdata = game:GetService("HttpService"):JSONEncode(MysticHook1)
local headers = {["content-type"] = "application/json"}
local SendMystic = {Url = urlMystic1, Body = newdata, Method = "POST", Headers = headers}
request(SendMystic)
end

if game.PlaceId == 7449423635 then
local CMoon = {
	['8'] = "http://www.roblox.com/asset/?id=9709149431", -- 🌕
	['7'] = "http://www.roblox.com/asset/?id=9709149052", -- 🌖
	['6'] = "http://www.roblox.com/asset/?id=9709143733", -- 🌗
	['5'] = "http://www.roblox.com/asset/?id=9709150401", -- 🌘  
	['4'] = "http://www.roblox.com/asset/?id=9709135895",  -- 🌑
	['3'] = "http://www.roblox.com/asset/?id=9709139597", -- 🌒
	['2'] = "http://www.roblox.com/asset/?id=9709150086", -- 🌓
	['1'] = "http://www.roblox.com/asset/?id=9709149680", -- 🌔
	};

if game.PlaceId == 7449423635 and game:GetService("Lighting").Sky.MoonTextureId == CMoon['6'] or game:GetService("Lighting").Sky.MoonTextureId == CMoon['7'] or game:GetService("Lighting").Sky.MoonTextureId == CMoon['8']then
--https://discord.com/api/webhooks/1150237198571024434/uVdOl_XqkdyAIleuS2WsrEp6MtB_UxPG61jgF2doPIJVBk8W-rE9FG6tHwrc1eF4HysD

urlFullMoon = ""
for i,v in pairs(game.Players:GetPlayers()) do
    CheckPlayerMoon = i
end
local Moon = {
['8'] = "http://www.roblox.com/asset/?id=9709149431", -- 🌕
['7'] = "http://www.roblox.com/asset/?id=9709149052", -- 🌖
['6'] = "http://www.roblox.com/asset/?id=9709143733", -- 🌗
['5'] = "http://www.roblox.com/asset/?id=9709150401", -- 🌘
['4'] = "http://www.roblox.com/asset/?id=9709135895",  -- 🌑
['3'] = "http://www.roblox.com/asset/?id=9709139597", -- 🌒
['2'] = "http://www.roblox.com/asset/?id=9709150086", -- 🌓
['1'] = "http://www.roblox.com/asset/?id=9709149680", -- 🌔
};

if game:GetService("Lighting").Sky.MoonTextureId == Moon['1'] then
    MoonIcon = '🌔'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['2'] then
    MoonIcon = '🌓'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['3'] then
    MoonIcon = '🌒'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['4'] then
    MoonIcon = '🌑'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['5'] then
    MoonIcon = '🌘'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['6'] then
    MoonIcon = '🌗'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['7'] then
    MoonIcon = '🌖'
elseif game:GetService("Lighting").Sky.MoonTextureId == Moon['8'] then
    MoonIcon = '🌕'
end

for i,v in pairs(Moon) do
    if game:GetService("Lighting").Sky.MoonTextureId == v then
        FullMoonPercent = i / 8 * 100
    end
end
MysticScriptJoinServer = 'game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,'..'\''..tostring(game.JobId)..'\''..')'
local MysticHook = {
["embeds"] = {
{
["title"] = "<:meofmeca:1158419480276389949>** KAY Webhooks Status**",
["description"] = "",
["color"] = 16250357,
["type"] = "rich",
["fields"] =  {
                    {
                        ["name"] = "⏲ Time Of Day :",
                        ["value"] = '```Full Moon :  '..FullMoonPercent..'%```',
                        ["inline"] = true
                    },
                    {
                        ["name"] = "** Players : **",
                        ["value"] = '```yaml\n'..CheckPlayerMoon..'/12```',
                        ["inline"] = true
                    },
                                            {
                        ["name"] = "**Job ID :**",
                        ["value"] = '```lua\n'..game.JobId..'```',
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**Script :**",
                        ["value"] = '```lua\n'..MysticScriptJoinServer..'```',
                        ["inline"] = true
                    }
},
    ["image"] = {
    ["url"] = "https://cdn.discordapp.com/attachments/1120720323147481121/1158387424506949652/hinh-anh-bia-cute.jpg?ex=651c0fdb&is=651abe5b&hm=049a2f6dd0d3a6ea7c018eb341a95e5203ab4cea93bc9269eaf769a25aea43fb&",
    },
["footer"] = {
        ["text"] = "Yesterday at "..os.date("%H:%M")
}
}
},
}
local newdata = game:GetService("HttpService"):JSONEncode(MysticHook)
local headers = {["content-type"] = "application/json"}
local Send = {Url = urlFullMoon, Body = newdata, Method = "POST", Headers = headers}
request(Send)
else
    print("Not Full Moon")
end
end

HakiCheck = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1")

url = ""
    for i,v in pairs(game.Players:GetPlayers()) do
        CheckPlayerMystic = i
    end

HakiScriptJoinServer = 'game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,'..'\''..tostring(game.JobId)..'\''..')'
local MysticHook = {
	["embeds"] = {
        {
            ["title"] = "<:meofmeca:1158419480276389949>** KAY Webhooks Status**",
            ["description"] = "",
            ["color"] = 16250357,
            ["type"] = "rich",
            ["fields"] =  {
                                {
                                    ["name"] = "🍁** Colors Name **",
                                    ["value"] = '```diff\n - '..HakiCheck..' ```',
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "🔹Player Server🎄",
                                    ["value"] = '```yml\n'..CheckPlayerMystic..'/12\n```',
                                    ["inline"] = false
                                },
                                {
                                    ["name"] = "**Job ID :**",
                                    ["value"] = '```yml\n'..game.JobId..'```',
                                    ["inline"] = false
                                },
                                                                                {
                                    ["name"] = "**Script :**",
                                    ["value"] = '```lua\n'..HakiScriptJoinServer..'\n```',
                                    ["inline"] = true
                                },
            },
                ["image"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/1120720323147481121/1158391970142634054/anh-bia-facebook-dang-yeu_081147791.png?ex=651c1417&is=651ac297&hm=074437c6c3d74b777ce461a6588af0822c2d2539e18d72a6b1fdd96090ced5af&",
                },
            ["footer"] = {
                ["text"] = "Yesterday at "..os.date("%H:%M")
            }
        }
},
}
local newdata = game:GetService("HttpService"):JSONEncode(MysticHook)
local headers = {["content-type"] = "application/json"}
local Send = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(Send)

urhaki1 = ""
local hakiHook1 = {
	["embeds"] = {
{
    ["title"] = "<:meofmeca:1158419480276389949>** KAY Webhooks Status**",
    ["description"] = "",
    ["color"] = 16250357,
    ["type"] = "rich",
	["fields"] =  {
                        {
							["name"] = "🍁** Colors Name **",
							["value"] = '```diff\n - '..HakiCheck..' ```',
							["inline"] = true
                        },
						{
							["name"] = "🔹Player Server🎄",
							["value"] = '```yml\n'..CheckPlayerMystic..'/12\n```',
							["inline"] = false
                        },
                        {
							["name"] = "**Job ID :**",
							["value"] = '```yml\n'..game.JobId..'```',
							["inline"] = false
                        },
																		{
							["name"] = "**Script :**",
							["value"] = '```lua\n'..HakiScriptJoinServer..'\n```',
							["inline"] = true
                        },
	},
        ["image"] = {
        ["url"] = "https://cdn.discordapp.com/attachments/1120720323147481121/1158391970142634054/anh-bia-facebook-dang-yeu_081147791.png?ex=651c1417&is=651ac297&hm=074437c6c3d74b777ce461a6588af0822c2d2539e18d72a6b1fdd96090ced5af&",
        },
    ["footer"] = {
        ["text"] = "Yesterday at "..os.date("%H:%M")
    }
}
},
}
local newdata = game:GetService("HttpService"):JSONEncode(hakiHook1)
local headers = {["content-type"] = "application/json"}
local SEndHaki = {Url = urhaki1, Body = newdata, Method = "POST", Headers = headers}
request(SEndHaki)
end)