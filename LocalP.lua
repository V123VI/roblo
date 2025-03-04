-- LocalP.lua
local module = {}

-- Função para alterar a velocidade do jogador
function module.aumentarVelocidade(ativado)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")

    if humanoid then
        if ativado then
            humanoid.WalkSpeed = 500 -- Velocidade aumentada
            print("Velocidade aumentada ativada! WalkSpeed:", humanoid.WalkSpeed)
        else
            humanoid.WalkSpeed = 16 -- Velocidade padrão
            print("Velocidade aumentada desativada! WalkSpeed:", humanoid.WalkSpeed)
        end
    else
        warn("Humanoid não encontrado no jogador.")
    end
end

-- Função para voar
-- LocalP.lua
local module = {}

-- Função para voar
local flying = false
local flySpeed = 50 -- Velocidade do voo
local bodyVelocity = nil
local bodyGyro = nil

function module.voar(ativado)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")

    if not humanoidRootPart or not humanoid then
        warn("HumanoidRootPart ou Humanoid não encontrado no jogador.")
        return
    end

    if ativado then
        -- Ativar voo
        if flying then return end -- Evitar múltiplas ativações

        flying = true

        -- Criar BodyVelocity para movimento
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.P = 1000
        bodyVelocity.Parent = humanoidRootPart

        -- Criar BodyGyro para rotação
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bodyGyro.P = 1000
        bodyGyro.D = 50
        bodyGyro.Parent = humanoidRootPart

        -- Conectar evento para mover o jogador
        game:GetService("RunService").Heartbeat:Connect(function()
            if not flying then return end

            local direction = Vector3.new(0, 0, 0)

            -- Verificar teclas pressionadas
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                direction = direction + humanoidRootPart.CFrame.LookVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                direction = direction - humanoidRootPart.CFrame.LookVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                direction = direction - humanoidRootPart.CFrame.RightVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                direction = direction + humanoidRootPart.CFrame.RightVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                direction = direction - Vector3.new(0, 1, 0)
            end

            -- Aplicar movimento
            bodyVelocity.Velocity = direction * flySpeed
            bodyGyro.CFrame = humanoidRootPart.CFrame
        end)

        print("Voar ativado!")
    else
        -- Desativar voo
        if not flying then return end

        flying = false

        -- Remover BodyVelocity e BodyGyro
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        if bodyGyro then
            bodyGyro:Destroy()
            bodyGyro = nil
        end

        print("Voar desativado!")
    end
end


return module