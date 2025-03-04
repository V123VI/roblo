-- Função para carregar módulos
local function loadModule(url)
    local success, err = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Falha ao carregar o módulo: " .. err)
        return nil
    end
end

-- Carregar a biblioteca de interface
local library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ShaddowScripts/Main/main/Library"))()

-- Criar a janela principal
local Main = library:CreateWindow("Main", "Crimson")

-- Criar abas
local tab = Main:CreateTab("Cheats")
local tab2 = Main:CreateTab("Misc")
local tab3 = Main:CreateTab("Player")

-- Carregar os módulos
local modulo1 = loadModule("https://raw.githubusercontent.com/V123VI/roblo/main/module1.lua")
local moduloplayer = loadModule("https://raw.githubusercontent.com/V123VI/roblo/main/LocalP.lua")

-- Verificar se os módulos foram carregados corretamente
if not modulo1 then
    warn("Módulo 1 não foi carregado corretamente.")
end
if not moduloplayer then
    warn("Módulo do Player não foi carregado corretamente.")
end

-- Toggle para ativar/desativar a velocidade
tab3:CreateToggle("Velocidade", function(ativado)
    if moduloplayer then
        moduloplayer.aumentarVelocidade(ativado) -- Chama a função do módulo do player
        if ativado then
            print("Velocidade aumentada ativada!")
        else
            print("Velocidade aumentada desativada!")
        end
    else
        warn("Módulo do Player não foi carregado corretamente.")
    end
end)

-- Outros elementos da interface
tab:CreateButton("Zi", function()
    loadModule("https://raw.githubusercontent.com/V123VI/roblo/main/module1.lua")
end)

tab:CreateToggle("Farm", function(a)
    print(a)
end)

tab:CreateSlider("Wow", 1, 16, function(a)
    print(a)
end)

tab:CreateCheckbox("Aimbot", function(a)
    print(a)
end)

tab:CreateDropdown("Word", {"Sung", "Jin", "Woo"}, function(a)
    print(a)
end)

tab2:CreateButton("Hello", function()
    print("clicked")
end)

-- Mostrar a aba
tab:Show()