local module = {}

-- Função para aumentar a velocidade do jogador
function module.aumentarVelocidade(ativado)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")

    if humanoid then
        if ativado then
            humanoid.WalkSpeed = 500 -- Velocidade aumentada
        else
            humanoid.WalkSpeed = 16 -- Velocidade padrão
        end
    else
        warn("Humanoid não encontrado no jogador.")
    end
end

return module