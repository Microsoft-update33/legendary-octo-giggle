-- FruitTestClient.lua
-- Client-side script to display UI buttons for requesting various fruits
-- Usage: Put this in StarterGui as a LocalScript or run via executor for testing

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local GrantFruitRemote = ReplicatedStorage:WaitForChild("GrantFruit")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FruitTestUI"
ScreenGui.Parent = playerGui

-- List of fruit names to request
local fruits = {
    "Leopard", "Dragon", "Dough", "Flame", "Dark", "Light",
    "Ice", "Bomb", "Rubber", "Sand", "Chop", "Bird",
    "Smoke", "Spin", "Barrier", "Love"
}

for i, fruitName in ipairs(fruits) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = UDim2.new(0, 10, 0, 45 * i)
    button.Text = "Get " .. fruitName
    button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    button.TextColor3 = Color3.new(1,1,1)
    button.Parent = ScreenGui

    button.MouseButton1Click:Connect(function()
        GrantFruitRemote:FireServer(fruitName)
        print("Requested fruit:", fruitName)
    end)
end
