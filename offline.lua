-- Services
local Players = game:GetService("Players")

-- 🔑 Set your key here
local VALID_KEY = "LUNARHUB=12"

-- UI
local player = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local KeyBox = Instance.new("TextBox", Frame)
KeyBox.Size = UDim2.new(0, 250, 0, 40)
KeyBox.Position = UDim2.new(0.5, -125, 0.5, -40)
KeyBox.PlaceholderText = "Enter your key"
KeyBox.Text = ""
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.TextColor3 = Color3.new(1, 1, 1)
KeyBox.ClearTextOnFocus = false

local VerifyBtn = Instance.new("TextButton", Frame)
VerifyBtn.Size = UDim2.new(0, 250, 0, 40)
VerifyBtn.Position = UDim2.new(0.5, -125, 0.5, 20)
VerifyBtn.Text = "Verify Key"
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
VerifyBtn.Font = Enum.Font.SourceSansBold
VerifyBtn.TextSize = 20

-- ✅ Verify function
local function verifyKey()
	local key = KeyBox.Text
	if key == "" then return end

	if key == VALID_KEY then
		VerifyBtn.Text = "✅ Verified!"
		wait(1)
		ScreenGui:Destroy()
		-- 🔓 Unlock your script here
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ToRie-Ro/lunarhub/refs/heads/main/lunarhub.lua"))()
	else
		VerifyBtn.Text = "❌ Invalid Key"
	end
end

VerifyBtn.MouseButton1Click:Connect(verifyKey)
