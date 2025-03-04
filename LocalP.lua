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

return module