Settings = {
    -- [[  Basics ]] --
    
    Anticheat_Enabled = true,
    Normal_Walk_Speed = 16,

    -- [[ Checks  ]] --

    -- Speed
    Speed_A = true,
    Speed_A_VL = 0,
    Speed_A_Mag = 50,
    Speed_B = true,
    Speed_B_VL = 0,
    Speed_B_WalkSpeed = 23,

    -- HighJump
    HighJump_A = true,
    HighJump_A_VL = 0,
    HighJump_A_HeightValue = 100,
    HighJump_B = true,
    HighJump_B_VL = 0,
    HighJump_B_Velocity_Value = 150,

    -- Flight
    Flight_A = true,
    Flight_A_VL = 0,
    Flight_A_Time = 500,
    Flight_B = true,
    Flight_B_VL = 0,
    Flight_B_Velocity_Check = -3.3,
    
    -- Invalid Position
    Invalid_Position = true,
    Invalid_Position_VL = 0,
    Invalid_Position_Value = 1000,
    Invalid_Jump = true,
    Invalid_Jump_VL = 0,

    -- Invalid Humanoids
    Invalid_State_A = true,
    Invalid_State_A_VL = 0,
    Invalid_State_B = true,
    Invalid_State_B_VL = 0,
    Invalid_State_C = true,
    Invalid_State_C_VL = 0,
    Invalid_State_D,
    Invalid_State_D_VL,
    Invalid_Gravity = true,
    Invalid_Gravity_Amount = 190,
    Invalid_Gravity_VL = 0,

    -- Checks for 
    Disabler_A = false,
    Disabler_A_Value = 1, --Number of scripts in starterPlayer (NOT STARTER CHARACTER)

    -- GUIs
    Gui_Check = false,
    -- * Example for table *
    Safe_Guis = {
        ["Test"] = game.StarterGui.Test,
    },

    -- Player
    Self_Damage = true,
    Self_Damage_VL = 0,
}

game.Players.OnPlayerAdded:Connect(function(plr)
    print(plr.Name.." has joined!")
    local oldpos
    local inAirTick = 0
    plr.CharacterAdded:Connect(function(char)
        oldpos = char.PrimaryPart.CFrame

        -- Violation Checker

        task.spawn(function()
            repeat
                spawn(function()
                    if (Settings.Speed_A_VL == 10) then
                        plr:Kick("You have been detected cheating. Violations: Speed_A")
                    end
                end)
                spawn(function()
                    if (Settings.Speed_B_VL == 100) then
                        plr:Kick("You have been detected cheating. Violations: Speed_B")
                    end
                end)
                spawn(function()
                    if (Settings.HighJump_A_VL == 4) then
                        plr:Kick("You have been detected cheating. Violations: HighJump_A")
                    end
                end)
                spawn(function()
                    if (Settings.HighJump_B == 5) then
                        plr:Kick("You have been detected cheating. Violations: HighJump_B")
                    end
                end)
                spawn(function()
                    if (Settings.Flight_A_VL == 5) then
                        plr:Kick("You have been detected cheating. Violations: Flight_A")
                    end
                end)
                spawn(function()
                    if (Settings.Flight_B_VL == 5) then
                        plr:Kick("You have been detected cheating. Violations: Flight_B")
                    end
                end)
                spawn(function()
                    if (Settings.Invalid_Position_VL == 10) then
                        plr:Kick("You have been detected cheating. Violations: Invalid_Position")
                    end
                end)
                spawn(function()
                    if (Settings.Invalid_State_A_VL == 1) then
                        plr:Kick("You have been detected cheating. Violations: Invalid_State_A")
                    end
                end)
                spawn(function()
                    if (Settings.Invalid_State_B_VL == 1) then
                        plr:Kick("You have been detected cheating. Violations: Invalid_State_B")
                    end
                end)
                spawn(function()
                    if (Settings.Invalid_State_C_VL == 1) then
                        plr:Kick("You have been detected cheating. Violations: Invalid_State_C")
                    end
                end)
                spawn(function()
                    if (Settings.Invalid_Jump_VL == 5) then
                        plr:Kick("You have been detected cheating. Violations: Invalid_Jump")
                    end
                end)
                spawn(function()
                    if (Settings.Self_Damage_VL == 10) then
                        plr:Kick("You have been detected cheating. Violations: Self_Damage")
                    end
                end)
                spawn(function()
                    if (Settings.Invalid_Gravity_VL == 1) then
                        plr:Kick("You have been detected cheating. Violations: Self_Damage")
                    end
                end)
                task.wait()
            until (false)
        end)

        -- Saving Position
        task.spawn(function()
            repeat
                oldpos = char.PrimaryPart.CFrame
                task.wait(1)
            until (false)
        end)

        -- Is Air Adding

        task.spawn(function()
            repeat
                if char.Humanoid.FloorMaterial == Enum.Material.Air then
                    inAirTick += 1
                else
                    inAirTick = 0
                end
                task.wait()
            until false()
        end)

        if (Settings.Anticheat_Enabled) then

            -- Speed A Check
            if (Settings.Speed_A == true) then
                task.spawn(function()
                    repeat
                        if (oldpos - char.PrimaryPart.CFrame).Magnitude > Settings.Speed_A_Mag then
                            char.PrimaryPart.CFrame = oldpos
                            Settings.Speed_A_VL += 1
                        end
                        task.wait(1)
                    until (false)
                end)
            end

            -- Speed B Check
            if (Settings.Speed_B == true) then
                task.spawn(function()
                    repeat
                        if char.Humanoid.WalkSpeed > Settings.Speed_B_WalkSpeed then
                            char.PrimaryPart.CFrame = oldpos
                            Speed_B_VL += 1
                            Char.Humanoid.WalkSpeed = Settings.Normal_Walk_Speed
                        end
                        task.wait(1)
                    until (false)
                end)
            end

            -- HighJump A Check
            if (Settings.HighJump_A == true) then
                task.spawn(function()
                    repeat
                        if char.PrimaryPart.Position.Y > Settings.HighJump_A_HeightValue then
                            char.PrimaryPart.CFrame = oldpos
                            HighJump_A_VL += 1
                        end
                        task.wait(1)
                    until (false)
                end)
            end

            -- HighJump B Check
            if (Settings.HighJump_B == true) then
                task.spawn(function()
                    repeat
                        if char.PrimaryPart.Velocity.Y > Settings.HighJump_B_Velocity_Value then
                            char.PrimaryPart.CFrame = oldpos
                            HighJump_B_VL += 1
                        end
                        task.wait(1)
                    until (false)
                end)
            end

            -- Flight A Check
            if (Settings.Flight_A == true) then
                task.spawn(function()
                    repeat
                        if (inAirTick > Settings.Flight_A_Time) then
                            char.PrimaryPart.CFrame = oldpos
                            Flight_A_VL += 1
                        end
                        task.wait()
                    until (false)
                end)
            end

            -- Flight B Check
            if (Settings.Flight_B == true) then
                task.spawn(function()
                    repeat
                        if (inAirTick > Settings.Flight_A_Time) then
                            if (char.PrimaryPart.Velocity < Settings.Flight_B_Velocity_Check) then
                                char.PrimaryPart.CFrame = oldpos
                                Flight_B_VL += 1
                            end 
                        end
                        task.wait()
                    until false
                end)
            end

            -- Invalid Position Check
            if (Settings.Invalid_Position == true) then
                task.spawn(function()
                    repeat
                        if (char.PrimaryPart.Position.Y < Settings.Invalid_Position_Value) then
                            char.PrimaryPart.CFrame = oldpos
                            Invalid_Position_VL += 1
                        end
                        task.wait()
                    until (false)
                end)
            end

            -- Invalid State A Check (RunningNoPhysics)
            if (Settings.Invalid_State_A == true) then
                task.spawn(function()
                    repeat
                        if (char.Humanoid.GetState() == 10) then
                            char.PrimaryPart.CFrame = oldpos
                            Invalid_State_A_VL += 1
                        end
                        task.wait()
                    until false
                end)
            end

            -- Invalid State B Check ()
            if (Settings.Invalid_State_B == true) then
                task.spawn(function()
                    repeat
                        if (char.Humanoid.GetState() == 11) then
                            char.PrimaryPart.CFrame = oldpos
                            Invalid_State_B_VL += 1
                        end
                        task.wait()
                    until false
                end)
            end

            -- Invalid State C Check (Physics)
            if (Settings.Invalid_State_C == true) then
                task.spawn(function()
                    repeat
                        if (char.Humanoid.GetState() == 16) then
                            char.PrimaryPart.CFrame = oldpos
                            Invalid_State_C_VL += 1
                        end
                        task.wait()
                    until false
                end)
            end

            -- Invalid State C Check (Ragdoll)
            if (Settings.Invalid_State_D == true) then
                task.spawn(function()
                    repeat
                        if (char.Humanoid.GetState() == 1) then
                            char.PrimaryPart.CFrame = oldpos
                            Invalid_State_D_VL += 1
                        end
                        task.wait()
                    until false
                end)
            end

            -- Gui Check
            if (Settings.Gui_Check == true) then
                task.spawn(function()
                    repeat
                        for i,v in pairs(plr.PlayerGui:GetChildren()) do
                            if (v.Name ~= Settings.Safe_Guis) then
                                v:Remove()
                                plr:Kick("New Gui Detected")
                            end
                        end
                        task.wait()
                    until (false)
                end)
            end

            -- Invalid Jump Check
            if (Settings.Invalid_Jump == true) then
                task.spawn(function()
                    repeat
                        if (char.Humanoid.FloorMaterial == Enum.Material.Air) then
                            if (char.Humanoid.GetState() == 3) then
                                char.PrimaryPart.CFrame = oldpos
                                Invalid_Jump_VL += 1
                            end
                        end
                        task.wait()
                    until (false)
                end)
            end

            -- Self Damage Check ///////// USE THIS IF YOUR NOT MAKING A PVP GAME !!!
            if (Settings.Self_Damage == true) then

                local oldHp = 100

                -- Saving HP to Var
                task.spawn(function()
                    repeat
                        oldHp = Char.Humanoid.Health
                        task.wait(.1)
                    until (false)
                end)

                -- Comparing OldHp --> NewHp (flags if different)
                task.spawn(function()
                    repeat
                        if (Char.Humanoid.Health < oldHp) then
                            Self_Damage_VL += 1
                            char.PrimaryPart.CFrame = oldpos
                        end
                        task.wait()
                    until (false)
                end)

            end

            -- Invalid Gravity
            if (Settings.Invalid_Gravity == true) then

                task.spawn(function()
                    
                    repeat
                        if (workspace.Gravity < Settings.Invalid_Gravity_Amount) then
                            Invalid_Gravity_VL += 1
                            char.PrimaryPart.CFrame = oldpos
                            workspace.Gravity = 192.6
                        end
                        task.wait()
                    until (false)

                end)

            end

            local scriptvals = 0

            if (Settings.Disabler_A == true) then
                task.spawn(function()
                    repeat
                        for i,v in pairs(plr.StarterPlayerScripts:GetChildren()) do

                            if (v.Name ~= SafePlayerScripts) then

                                scriptvals += 1
                                
                            end

                        end

                        if (scriptvals > Disabler_A_Value) then

                            plr:Kick("You have been detected cheating. Violations: Disabler_A")
                            
                        end

                        scriptvals = 0

                        task.wait()
                    until (false)
                end)
            end

        end
    end)
end)
