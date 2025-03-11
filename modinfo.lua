name = "超平坦世界"
description = "生成一个只有单一地皮的超平坦世界，并且这个世界无洞穴无边界；请不要碰任何地图设置选项，否则模组完全失效。"
author = "Va6gn"
version = "1.0"

-- 兼容性
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

-- 客户端/服务器兼容性
client_only_mod = false
server_only_mod = true

-- 图标
icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- 配置选项
configuration_options = {
    {
        name = "ground_type",
        label = "地皮类型",
        options = {
            {description = "草地", data = "GRASS"},
            {description = "森林", data = "FOREST"},
            {description = "岩石", data = "ROCKY"},
            {description = "沙漠", data = "DIRT"},
            {description = "沼泽", data = "MARSH"},
            {description = "蘑菇林", data = "FUNGUS"},
            {description = "洞穴", data = "CAVE"}
        },
        default = "GRASS",
    }
}