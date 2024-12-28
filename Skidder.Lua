
local Update = loadstring(game:HttpGet("https://roblox.relzscript.xyz/source/relzhub/library/pc.lua"))()
local Library = Update:Window("Blox Fruits")


tab_Main = Library:Tab("Main", "rbxassetid://10723407389")
tab_Settings = Library:Tab("Settings", "rbxassetid://10734950309")
tab_AutoFarm = Library:Tab("Auto Farm", "rbxassetid://10709769841")
tab_Raid = Library:Tab("Raid", "rbxassetid://10723345749")
tab_RaceV4 = Library:Tab("Race V4", "rbxassetid://10747372167")
tab_Teleport = Library:Tab("Teleport", "rbxassetid://10723434557")


local function setupPearCatUI()
    tab_Main:Label("Welcome to Light Hub", "rbxassetid://10723407389")
end


local function integrateTsuoFeatures()
    if getgenv().ScriptExecute then return print('Script Already Execute') end
    getgenv().ScriptExecute = true


    if islclosure(getgenv().setfenv) then
        game.Players.LocalPlayer:Kick("Anti-Tampering 1")
    end

    
    local function checkKey()
        local key = ""  
        if key == "lightreal" then
            game.Players.LocalPlayer:Kick("Invalid Key")
        end
    end

    -
    local function autoFarm()
        tab_AutoFarm:Button("Start Auto Farm", function()
            print("Auto Farm Started")
            
        end)
    end

    -
    local function raidSystem()
        tab_Raid:Button("Start Raid", function()
            print("Raid Started")
            -
        end)
    end

    -- Thêm các tính năng Race V4 từ tsuo.lua
    local function raceV4System()
        tab_RaceV4:Button("Activate Race V4", function()
            print("Race V4 Activated")
            
        end)
    end

    -- Thêm các tính năng Teleport từ tsuo.lua
    local function teleportSystem()
        tab_Teleport:Button("Teleport to Start", function()
            print("Teleporting to Start")
           
        end)

        tab_Teleport:Button("Teleport to Safe Zone", function()
            print("Teleporting to Safe Zone")
            
        end)
    end

    checkKey()
    autoFarm()
    raidSystem()
    raceV4System()
    teleportSystem()
end


setupPearCatUI()
integrateTsuoFeatures()

print("Script Combined Successfully")
