

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

-- Variável para armazenar o módulo carregado
----------------------
---MODULUOS PARA CARREGAR 

-- Carregar o módulo ao iniciar o script
modulo1 = loadModule("https://raw.githubusercontent.com/V123VI/roblo/refs/heads/main/module1.lua")

-------Modulo do Player

moduloplayer = loadModule("https://raw.githubusercontent.com/V123VI/roblo/refs/heads/main/LocalP.lua")

------------
local modulo1



-- Toggle para ativar/desativar a velocidade
tab3:CreateToggle("Velocidade", function(ativado)
    if modulo1 then
        modulo1.aumentarVelocidade(ativado) -- Chama a função do módulo
        if ativado then
            print("Velocidade aumentada ativada!")
        else
            print("Velocidade aumentada desativada!")
        end
    else
        warn("Módulo de velocidade não foi carregado corretamente.")
    end
end)

-- Outros elementos da interface
tab:CreateButton("Zi", function()
    loadModule("https://raw.githubusercontent.com/V123VI/roblo/refs/heads/main/module1.lua")
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