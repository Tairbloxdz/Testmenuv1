-- Gui Script: Đặt script này trong StarterGui
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo GUI chính
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "MainMenu"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Visible = false

local uiCorner = Instance.new("UICorner", mainFrame)
uiCorner.CornerRadius = UDim.new(0, 10)

-- Nút bật/tắt menu có logo
local toggleButton = Instance.new("ImageButton", screenGui)
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0.02, 0, 0.9, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Thêm logo vào nút
toggleButton.Image = "rbxassetid://106634247182342" -- Thay thế ID bằng Asset ID của logo
toggleButton.ScaleType = Enum.ScaleType.Fit

-- Tạo TextLabel trên nút (nếu muốn thêm chữ)
local buttonText = Instance.new("TextLabel", toggleButton)
buttonText.Size = UDim2.new(1, 0, 1, 0)
buttonText.Text = ""
buttonText.TextColor3 = Color3.new(1, 1, 1)
buttonText.BackgroundTransparency = 1

-- Bật/tắt menu khi nhấn nút
toggleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Tabs
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(0, 300, 0, 40)
tabFrame.Position = UDim2.new(0, 0, 0, 0)
tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local uiTabLayout = Instance.new("UIListLayout", tabFrame)
uiTabLayout.FillDirection = Enum.FillDirection.Horizontal
uiTabLayout.Padding = UDim.new(0, 5)

-- Tạo các Tab
local tabs = {"Tab1", "Tab2", "Tab3"}
local tabContents = {}

for _, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton", tabFrame)
    tabButton.Size = UDim2.new(0, 100, 1, 0)
    tabButton.Text = tabName
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabButton.TextColor3 = Color3.new(1, 1, 1)

    local contentFrame = Instance.new("Frame", mainFrame)
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    contentFrame.Visible = false
    tabContents[tabName] = contentFrame

    tabButton.MouseButton1Click:Connect(function()
        for _, content in pairs(tabContents) do
            content.Visible = false
        end
        contentFrame.Visible = true
    end)
end

-- Nội dung ví dụ cho các Tab
local label1 = Instance.new("TextLabel", tabContents["Tab1"])
label1.Size = UDim2.new(1, 0, 1, 0)
label1.Text = "Đây là nội dung Tab 1"
label1.TextColor3 = Color3.new(1, 1, 1)
label1.BackgroundTransparency = 1

local label2 = Instance.new("TextLabel", tabContents["Tab2"])
label2.Size = UDim2.new(1, 0, 1, 0)
label2.Text = "Đây là nội dung Tab 2"
label2.TextColor3 = Color3.new(1, 1, 1)
label2.BackgroundTransparency = 1

local label3 = Instance.new("TextLabel", tabContents["Tab3"])
label3.Size = UDim2.new(1, 0, 1, 0)
label3.Text = "Đây là nội dung Tab 3"
label3.TextColor3 = Color3.new(1, 1, 1)
label3.BackgroundTransparency = 1