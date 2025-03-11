-- 获取配置选项
local GROUND_TYPE = GetModConfigData("ground_type")

-- 修改世界生成
AddPrefabPostInit("world", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:DoTaskInTime(0, function()
            -- 移除所有实体（除了必要的世界实体）
            for k, v in pairs(GLOBAL.Ents) do
                if v.prefab and 
                   v.prefab ~= "world" and 
                   v.prefab ~= "cave" and 
                   v.prefab ~= "forest" and
                   v.prefab ~= "player" and
                   not v:HasTag("player") and
                   not v:HasTag("CLASSIFIED") and
                   not v:HasTag("FX") and
                   not v:HasTag("NOCLICK") and
                   not v:HasTag("DECOR") then
                    v:Remove()
                end
            end
            
            -- 将所有地皮设置为选定的类型
            local ground = GLOBAL.TheWorld.Map
            local width, height = ground:GetSize()
            
            for x = 0, width do
                for y = 0, height do
                    ground:SetTile(x, y, GLOBAL.GROUND[GROUND_TYPE])
                end
            end
            
            -- 重新生成地皮贴图
            ground:Finalize()
            ground:RebuildLayer(GLOBAL.GROUND.OCEAN_COASTAL)
            ground:RebuildLayer(GLOBAL.GROUND.OCEAN_SWELL)
            ground:RebuildLayer(GLOBAL.GROUND.OCEAN_ROUGH)
            ground:RebuildLayer(GLOBAL.GROUND.OCEAN_BRINEPOOL)
            ground:RebuildLayer(GLOBAL.GROUND.OCEAN_HAZARDOUS)
            
            -- 通知客户端更新
            GLOBAL.TheWorld:PushEvent("worldmapsetsize")
        end)
    end
end)

-- 修改世界生成设置
GLOBAL.require("map/tasks")
modimport("scripts/map/tasks.lua")