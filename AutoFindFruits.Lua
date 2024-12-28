-- Tải thư viện từ URL
loadstring(game:HttpGet("https://roblox.relzscript.xyz/source/relzhub/library/pc.lua"))()

-- Tạo giao diện UI với phong cách hiện đại
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Khung chứa giao diện
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.BorderSizePixel = 5
MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Parent = ScreenGui

-- Góc bo tròn cho giao diện
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Tiêu đề Hub
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Light Find Fruits Demo"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.TextAlignment = Enum.TextAlignment.Center
Title.Parent = MainFrame

-- Hình ảnh Sigma Boy (URL của hình ảnh)
local SigmaIcon = Instance.new("ImageLabel")
SigmaIcon.Size = UDim2.new(0, 100, 0, 100)
SigmaIcon.Position = UDim2.new(0.5, -50, 0, 50)
SigmaIcon.BackgroundTransparency = 1
SigmaIcon.Image = "https://www.roblox.com/asset/?id=1234567890"  -- Thay URL này bằng URL của ảnh Sigma Boy
SigmaIcon.Parent = MainFrame

-- Mô tả thêm
local Description = Instance.new("TextLabel")
Description.Size = UDim2.new(1, 0, 0, 50)
Description.Position = UDim2.new(0, 0, 0.5, -25)
Description.BackgroundTransparency = 1
Description.Text = "Find Fruit and hop sever"
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextSize = 16
Description.TextAlignment = Enum.TextAlignment.Center
Description.Parent = MainFrame

-- Nút "Start" để bắt đầu Auto Get Fruits
local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0, 250, 0, 50)
StartButton.Position = UDim2.new(0.5, -125, 0.85, 0)
StartButton.Text = "Start Auto Fruit"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
StartButton.BorderSizePixel = 0
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 18
StartButton.Parent = MainFrame

-- Nút "Stop" để dừng Auto Get Fruits
local StopButton = Instance.new("TextButton")
StopButton.Size = UDim2.new(0, 250, 0, 50)
StopButton.Position = UDim2.new(0.5, -125, 0.92, 0)
StopButton.Text = "Stop Auto Fruit"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
StopButton.BorderSizePixel = 0
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 18
StopButton.Parent = MainFrame

-- Biến điều khiển trạng thái hoạt động
local isFarming = false

-- Tạo một TextLabel để hiển thị thông báo
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 50)
StatusLabel.Position = UDim2.new(0, 0, 0.65, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Idle"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 18
StatusLabel.TextAlignment = Enum.TextAlignment.Center
StatusLabel.Parent = MainFrame

-- Hàm tự động nhặt trái
local function autoGetFruits()
    while isFarming do
        -- Tìm các trái trong game
        local foundFruit = false
        for _, fruit in pairs(game.Workspace:GetChildren()) do
            -- Kiểm tra xem item có phải là trái không
            if fruit:IsA("Model") and fruit:FindFirstChild("Fruit") then
                -- Nếu có, tiến hành nhặt trái
                foundFruit = true

                -- Di chuyển đến vị trí của trái và nhặt nó
                local fruitPosition = fruit.PrimaryPart.Position
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(fruitPosition)

                -- Tạm dừng một chút để "nhặt" trái
                wait(1)

                -- Cập nhật trạng thái
                StatusLabel.Text = "Status: Found and picking up fruit!"
                wait(1)  -- Đợi một chút trước khi tìm trái tiếp
                StatusLabel.Text = "Status: Idle"
            end
        end
        
        -- Nếu không tìm thấy trái, cập nhật thông báo
        if not foundFruit then
            StatusLabel.Text = "Status: No fruit found, searching..."
        end
        
        -- Đợi một chút trước khi tìm tiếp
        wait(3)  -- Kiểm tra lại sau mỗi 3 giây
    end
end

-- Khi nhấn nút "Start Auto Fruit"
StartButton.MouseButton1Click:Connect(function()
    if not isFarming then
        isFarming = true
        StatusLabel.Text = "Status: Starting Auto Fruit collection..."
        autoGetFruits()  -- Gọi hàm tự động nhặt trái
    end
end)

-- Khi nhấn nút "Stop Auto Fruit"
StopButton.MouseButton1Click:Connect(function()
    isFarming = false
    StatusLabel.Text = "Status: Stopped Auto Fruit collection."
end)
