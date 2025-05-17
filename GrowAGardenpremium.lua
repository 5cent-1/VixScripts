-- Create a basic loading screen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GrowLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = game:GetService("CoreGui") -- Using CoreGui so it stays persistent

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
background.BorderSizePixel = 0
background.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 300, 0, 50)
textLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
textLabel.Font = Enum.Font.Code
textLabel.TextScaled = true
textLabel.Text = "Loading Grow A Garden Script..."
textLabel.Parent = background

-- Animate dots
local run = true
task.spawn(function()
	local dots = 0
	while run do
		dots = (dots + 1) % 4
		textLabel.Text = "Loading Grow A Garden Script" .. string.rep(".", dots)
		task.wait(0.4)
	end
end)

-- Load external script
local success, result = pcall(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/5cent-1/VixScripts/refs/heads/main/GrowAGardenUpdated.lua"))()
end)

-- Remove loading screen
run = false
screenGui:Destroy()

-- Optional: Notify if it failed
if not success then
	warn("Failed to load Grow A Tree script:", result)
end
