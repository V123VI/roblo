-- Certifique-se de que o HttpService está ativado
game.HttpService.HttpEnabled = true

-- Função para carregar módulos remotamente
local function loadModule(url)
    
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)

    if success then
        print("Módulo carregado com sucesso:", url)
        return result
    else
        warn("Falha ao carregar o módulo:", url, "Erro:", result)
        return nil
    end
end

-- Carregar a biblioteca de interface
local libraryURL = "https://raw.githubusercontent.com/ShaddowScripts/Main/main/Library"
local library = loadModule(libraryURL)

if not library then
    error("Falha ao carregar a biblioteca de interface. Verifique a URL: " .. libraryURL)
end

-- Criar a janela principal
local Main = library:CreateWindow("Main", "Crimson")

-- Criar abas
local tab = Main:CreateTab("Cheats")
local tab2 = Main:CreateTab("Misc")
local tab3 = Main:CreateTab("Player")

-- URLs dos módulos
local module1URL = "https://raw.githubusercontent.com/V123VI/roblo/main/module1.lua"
local playerModuleURL = "https://raw.githubusercontent.com/V123VI/roblo/main/LocalP.lua"

-- Carregar os módulos
local modulo1 = loadModule(module1URL)
local moduloplayer = loadModule(playerModuleURL)

-- Verificar se os módulos foram carregados corretamente
if not modulo1 then
    warn("Módulo 1 não foi carregado corretamente.")
end
if not moduloplayer then
    warn("Módulo do Player não foi carregado corretamente.")
end

-- Toggle para ativar/desativar a velocidade
tab3:CreateToggle("Velocidade", function(ativado)
    if moduloplayer and moduloplayer.aumentarVelocidade then
        moduloplayer.aumentarVelocidade(ativado) -- Chama a função do módulo do player
        if ativado then
            print("Velocidade aumentada ativada!")
        else
            print("Velocidade aumentada desativada!")
        end
    else
        warn("Módulo do Player não foi carregado corretamente ou a função não existe.")
    end
end)

-- Outros elementos da interface
tab:CreateButton("Zi", function()
    print("Botão Zi pressionado")
end)

tab:CreateToggle("Farm", function(ativado)
    print("Farm:", ativado)
end)

tab:CreateSlider("Wow", 1, 16, function(valor)
    print("Slider Wow:", valor)
end)

tab:CreateCheckbox("Aimbot", function(ativado)
    print("Aimbot:", ativado)
end)

tab:CreateDropdown("Word", {"Sung", "Jin", "Woo"}, function(opcao)
    print("Dropdown selecionado:", opcao)
end)

tab2:CreateButton("Hello", function()
    print("Botão Hello pressionado")
end)

-- Exibir a aba
tab:Show()

print("Script carregado com sucesso!")
