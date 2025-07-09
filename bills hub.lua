local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local GrantFruitRemote = ReplicatedStorage:WaitForChild("GrantFruit")

local function grantFruit(player, fruitName)
    -- Try to find the fruit tool inside ServerStorage
    local fruitTool = ServerStorage:FindFirstChild(fruitName)
    if fruitTool and fruitTool:IsA("Tool") then
        local clone = fruitTool:Clone()
        clone.Parent = player.Backpack
        print(player.Name .. " was granted fruit: " .. fruitName)
    else
        warn("Fruit tool '" .. fruitName .. "' not found or is not a Tool in ServerStorage!")
    end
end

GrantFruitRemote.OnServerEvent:Connect(function(player, fruitName)
    -- Simple authorization: only allow player with this exact name
    if player.Name == "legendary-octo-giggle" then
        grantFruit(player, fruitName)
    else
        warn(player.Name .. " attempted unauthorized fruit grant: " .. fruitName)
        player:Kick("Unauthorized fruit grant attempt.")
    end
end)
