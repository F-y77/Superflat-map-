-- 覆盖默认的世界生成任务
local Tasks = require("map/tasks")
local Layouts = require("map/layouts")
local Rooms = require("map/rooms")

-- 创建一个空的任务列表
AddTask("超平坦", {
    locks = {},
    keys_given = {},
    room_choices = {
        ["Plain"] = 1
    },
    room_bg = GROUND.GRASS,
    background_room = "Plain",
    colour = {r=0, g=1, b=0, a=1}
})

-- 覆盖默认的世界生成设置
AddLevelPreInit("SURVIVAL_TOGETHER", function(level)
    level.tasks = {"超平坦"}
    level.numoptionaltasks = 0
    level.optionaltasks = {}
    level.substitutes = {}
    level.overrides = {
        boons = "never",
        roads = "never",
        berrybush = "never",
        carrot = "never",
        flowers = "never",
        grass = "never",
        sapling = "never",
        reeds = "never",
        trees = "never",
        flint = "never",
        rock = "never",
        rock_ice = "never",
        meteorspawner = "never",
        weather = "never",
        lightning = "never",
        hunt = "never",
        alternatehunt = "never",
        houndmound = "never",
        liefs = "never",
        marshbush = "never",
        merm = "never",
        mushroom = "never",
        penguins = "never",
        pigs = "never",
        rabbits = "never",
        tallbirds = "never",
        tentacles = "never",
        walrus = "never",
        world_size = "huge",
        branching = "never",
        loop = "never",
        specialevent = "none",
        autumn = "noseason",
        winter = "noseason",
        spring = "noseason",
        summer = "noseason"
    }
end)

-- 添加一个简单的房间
AddRoom("Plain", {
    colour = {r=0.3, g=0.8, b=0.5, a=0.3},
    value = GROUND.GRASS,
    tags = {"ExitPiece", "Chester_Eyebone"},
    contents = {
        countstaticlayouts = {
            ["DefaultsExit"] = 1
        }
    }
})