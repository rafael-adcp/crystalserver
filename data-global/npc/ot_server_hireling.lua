local internalNpcName = "OtServer Hireling"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 136,
    lookHead = 97,
    lookBody = 34,
    lookLegs = 3,
    lookFeet = 116,
    lookAddons = 0,
}

npcConfig.flags = {
    floorchange = false,
}

local itemsTable = {
    ["various"] = {
        { itemName = "blue footboard", clientId = 32482, buy = 40 },
        { itemName = "blue headboard", clientId = 32473, buy = 40 },
        { itemName = "cot footboard", clientId = 32486, buy = 40 },
        { itemName = "cot headboard", clientId = 32477, buy = 40 },
        { itemName = "green footboard", clientId = 32483, buy = 40 },
        { itemName = "green headboard", clientId = 32474, buy = 40 },
        { itemName = "hammock foot section", clientId = 32487, buy = 40 },
        { itemName = "hammock head section", clientId = 32478, buy = 40 },
        { itemName = "red footboard", clientId = 32484, buy = 40 },
        { itemName = "red headboard", clientId = 32475, buy = 40 },
        { itemName = "simple footboard", clientId = 32488, buy = 40 },
        { itemName = "simple headboard", clientId = 32479, buy = 40 },
        { itemName = "straw mat foot section", clientId = 32489, buy = 40 },
        { itemName = "straw mat head section", clientId = 32480, buy = 40 },
        { itemName = "yellow footboard", clientId = 32485, buy = 40 },
        { itemName = "yellow headboard", clientId = 32476, buy = 40 },
        { itemName = "amphora", clientId = 2893, buy = 4 },
        { itemName = "armor rack kit", clientId = 6114, buy = 90 },
        { itemName = "bamboo drawer kit", clientId = 2795, buy = 20 },
        { itemName = "bamboo table kit", clientId = 2788, buy = 25 },
        { itemName = "barrel kit", clientId = 2793, buy = 12 },
        { itemName = "big table kit", clientId = 2785, buy = 30 },
        { itemName = "birdcage kit", clientId = 2796, buy = 50 },
        { itemName = "blue pillow", clientId = 2394, buy = 25 },
        { itemName = "blue tapestry", clientId = 2659, buy = 25 },
        { itemName = "bookcase kit", clientId = 6372, buy = 70 },
        { itemName = "box", clientId = 2469, buy = 10 },
        { itemName = "chest", clientId = 2472, buy = 10 },
        { itemName = "chest of drawers", clientId = 2789, buy = 18 },
        { itemName = "chimney kit", clientId = 7864, buy = 200 },
        { itemName = "coal basin kit", clientId = 2806, buy = 25 },
        { itemName = "cookie", clientId = 3598, buy = 2 },
        { itemName = "crate", clientId = 2471, buy = 10 },
        { itemName = "cuckoo clock", clientId = 2664, buy = 40 },
        { itemName = "dresser kit", clientId = 2790, buy = 25 },
        { itemName = "goldfish bowl", clientId = 5928, buy = 50 },
        { itemName = "fireworks rocket", clientId = 6576, buy = 100 },
        { itemName = "flower bowl", clientId = 2983, buy = 6 },
        { itemName = "globe", clientId = 2797, buy = 50 },
        { itemName = "goblin statue kit", clientId = 2804, buy = 50 },
        { itemName = "god flowers", clientId = 2981, buy = 5 },
        { itemName = "green balloons", clientId = 6577, buy = 500 },
        { itemName = "green cushioned chair kit", clientId = 2776, buy = 40 },
        { itemName = "green pillow", clientId = 2396, buy = 25 },
        { itemName = "green tapestry", clientId = 2647, buy = 25 },
        { itemName = "harp kit", clientId = 2808, buy = 50 },
        { itemName = "heart pillow", clientId = 2393, buy = 30 },
        { itemName = "honey flower", clientId = 2984, buy = 5 },
        { itemName = "indoor plant kit", clientId = 2811, buy = 8 },
        { itemName = "ivory chair kit", clientId = 2781, buy = 25 },
        { itemName = "knight statue kit", clientId = 2802, buy = 50 },
        { itemName = "large amphora kit", clientId = 2805, buy = 50 },
        { itemName = "large trunk", clientId = 2794, buy = 10 },
        { itemName = "locker kit", clientId = 2791, buy = 30 },
        { itemName = "minotaur statue kit", clientId = 2803, buy = 50 },
        { itemName = "orange tapestry", clientId = 2653, buy = 25 },
        { itemName = "oven kit", clientId = 6371, buy = 80 },
        { itemName = "party hat", clientId = 6578, buy = 800 },
        { itemName = "party trumpet", clientId = 6572, buy = 500 },
        { itemName = "pendulum clock kit", clientId = 2801, buy = 75 },
        { itemName = "piano kit", clientId = 2807, buy = 200 },
        { itemName = "potted flower", clientId = 2985, buy = 5 },
        { itemName = "present", clientId = 2856, buy = 10 },
        { itemName = "purple tapestry", clientId = 2644, buy = 25 },
        { itemName = "red balloons", clientId = 6575, buy = 500 },
        { itemName = "red cushioned chair kit", clientId = 2775, buy = 40 },
        { itemName = "red pillow", clientId = 2395, buy = 25 },
        { itemName = "red tapestry", clientId = 2656, buy = 25 },
        { itemName = "rocking horse", clientId = 2800, buy = 30 },
        { itemName = "round blue pillow", clientId = 2398, buy = 25 },
        { itemName = "round purple pillow", clientId = 2400, buy = 25 },
        { itemName = "round red pillow", clientId = 2399, buy = 25 },
        { itemName = "round turquoise pillow", clientId = 2401, buy = 25 },
        { itemName = "small blue pillow", clientId = 2389, buy = 20 },
        { itemName = "small green pillow", clientId = 2387, buy = 20 },
        { itemName = "small ice statue", clientId = 7447, buy = 50 },
        { itemName = "small ice statue", clientId = 7448, buy = 50 },
        { itemName = "small orange pillow", clientId = 2390, buy = 20 },
        { itemName = "small purple pillow", clientId = 2386, buy = 20 },
        { itemName = "small red pillow", clientId = 2388, buy = 20 },
        { itemName = "small round table", clientId = 2783, buy = 25 },
        { itemName = "small table kit", clientId = 2782, buy = 20 },
        { itemName = "small trunk", clientId = 2426, buy = 20 },
        { itemName = "small turquoise pillow", clientId = 2391, buy = 20 },
        { itemName = "small white pillow", clientId = 2392, buy = 20 },
        { itemName = "sofa chair kit", clientId = 2779, buy = 55 },
        { itemName = "square table kit", clientId = 2784, buy = 25 },
        { itemName = "stone table kit", clientId = 2786, buy = 30 },
        { itemName = "table lamp kit", clientId = 2798, buy = 35 },
        { itemName = "telescope kit", clientId = 2799, buy = 70 },
        { itemName = "thick trunk", clientId = 2352, buy = 20 },
        { itemName = "treasure chest", clientId = 2478, buy = 1000 },
        { itemName = "trophy stand", clientId = 872, buy = 50 },
        { itemName = "trough kit", clientId = 2792, buy = 7 },
        { itemName = "tusk chair kit", clientId = 2780, buy = 25 },
        { itemName = "tusk table kit", clientId = 2787, buy = 25 },
        { itemName = "vase", clientId = 2876, buy = 3 },
        { itemName = "venorean cabinet", clientId = 17974, buy = 90 },
        { itemName = "venorean drawer", clientId = 17977, buy = 40 },
        { itemName = "venorean wardrobe", clientId = 17975, buy = 50 },
        { itemName = "wall mirror", clientId = 2638, buy = 40 },
        { itemName = "wall mirror", clientId = 2635, buy = 40 },
        { itemName = "wall mirror", clientId = 2632, buy = 40 },
        { itemName = "water pipe", clientId = 2980, buy = 40 },
        { itemName = "weapon rack kit", clientId = 6115, buy = 90 },
        { itemName = "white tapestry", clientId = 2667, buy = 25 },
        { itemName = "wooden chair kit", clientId = 2777, buy = 15 },
        { itemName = "yellow pillow", clientId = 900, buy = 25 },
        { itemName = "yellow tapestry", clientId = 2650, buy = 25 },
        { itemName = "exercise axe", clientId = 28553, buy = 262500, subType = 500 },
        { itemName = "exercise bow", clientId = 28555, buy = 262500, subType = 500 },
        { itemName = "exercise club", clientId = 28554, buy = 262500, subType = 500 },
        { itemName = "exercise rod", clientId = 28556, buy = 262500, subType = 500 },
        { itemName = "exercise sword", clientId = 28552, buy = 262500, subType = 500 },
        { itemName = "exercise wand", clientId = 28557, buy = 262500, subType = 500 },
        { itemName = "durable exercise axe", clientId = 35280, buy = 945000, subType = 1800 },
        { itemName = "durable exercise bow", clientId = 35282, buy = 945000, subType = 1800 },
        { itemName = "durable exercise club", clientId = 35281, buy = 945000, subType = 1800 },
        { itemName = "durable exercise rod", clientId = 35283, buy = 945000, subType = 1800 },
        { itemName = "durable exercise sword", clientId = 35279, buy = 945000, subType = 1800 },
        { itemName = "durable exercise wand", clientId = 35284, buy = 945000, subType = 1800 },
    },
    ["exercise weapons"] = {
        { itemName = "exercise axe", clientId = 28553, buy = 262500, subType = 500 },
        { itemName = "exercise bow", clientId = 28555, buy = 262500, subType = 500 },
        { itemName = "exercise club", clientId = 28554, buy = 262500, subType = 500 },
        { itemName = "exercise rod", clientId = 28556, buy = 262500, subType = 500 },
        { itemName = "exercise sword", clientId = 28552, buy = 262500, subType = 500 },
        { itemName = "exercise wand", clientId = 28557, buy = 262500, subType = 500 },
        { itemName = "durable exercise axe", clientId = 35280, buy = 945000, subType = 1800 },
        { itemName = "durable exercise bow", clientId = 35282, buy = 945000, subType = 1800 },
        { itemName = "durable exercise club", clientId = 35281, buy = 945000, subType = 1800 },
        { itemName = "durable exercise rod", clientId = 35283, buy = 945000, subType = 1800 },
        { itemName = "durable exercise sword", clientId = 35279, buy = 945000, subType = 1800 },
        { itemName = "durable exercise wand", clientId = 35284, buy = 945000, subType = 1800 },
        { itemName = "lasting exercise axe", clientId = 35286, buy = 7560000, subType = 14400 },
        { itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, subType = 14400 },
        { itemName = "lasting exercise club", clientId = 35287, buy = 7560000, subType = 14400 },
        { itemName = "lasting exercise rod", clientId = 35289, buy = 7560000, subType = 14400 },
        { itemName = "lasting exercise sword", clientId = 35285, buy = 7560000, subType = 14400 },
        { itemName = "lasting exercise wand", clientId = 35290, buy = 7560000, subType = 14400 },
    },
    ["equipment"] = {
        { itemName = "axe", clientId = 3274, buy = 20, sell = 7 },
        { itemName = "battle axe", clientId = 3266, buy = 235, sell = 80 },
        { itemName = "battle hammer", clientId = 3305, buy = 350, sell = 120 },
        { itemName = "bone sword", clientId = 3338, buy = 75, sell = 20 },
        { itemName = "brass armor", clientId = 3359, buy = 450, sell = 150 },
        { itemName = "brass helmet", clientId = 3354, buy = 120, sell = 30 },
        { itemName = "brass legs", clientId = 3372, buy = 195, sell = 49 },
        { itemName = "brass shield", clientId = 3411, buy = 65, sell = 25 },
        { itemName = "carlin sword", clientId = 3283, buy = 473, sell = 118 },
        { itemName = "chain armor", clientId = 3358, buy = 200, sell = 70 },
        { itemName = "chain helmet", clientId = 3352, buy = 52, sell = 17 },
        { itemName = "chain legs", clientId = 3558, buy = 80, sell = 25 },
        { itemName = "club", clientId = 3270, buy = 5, sell = 1 },
        { itemName = "coat", clientId = 3562, buy = 8, sell = 1 },
        { itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
        { itemName = "dagger", clientId = 3267, buy = 5, sell = 2 },
        { itemName = "doublet", clientId = 3379, buy = 16, sell = 3 },
        { itemName = "dwarven shield", clientId = 3425, buy = 500, sell = 100 },
        { itemName = "hand axe", clientId = 3268, buy = 8, sell = 4 },
        { itemName = "iron helmet", clientId = 3353, buy = 390, sell = 150 },
        { itemName = "jacket", clientId = 3561, buy = 12, sell = 1 },
        { itemName = "leather armor", clientId = 3361, buy = 35, sell = 12 },
        { itemName = "leather boots", clientId = 3552, buy = 10, sell = 2 },
        { itemName = "leather helmet", clientId = 3355, buy = 12, sell = 4 },
        { itemName = "leather legs", clientId = 3559, buy = 10, sell = 9 },
        { itemName = "longsword", clientId = 3285, buy = 160, sell = 51 },
        { itemName = "mace", clientId = 3286, buy = 90, sell = 30 },
        { itemName = "morning star", clientId = 3282, buy = 430, sell = 100 },
        { itemName = "plate armor", clientId = 3357, buy = 1200, sell = 400 },
        { itemName = "plate shield", clientId = 3410, buy = 125, sell = 45 },
        { itemName = "rapier", clientId = 3272, buy = 15, sell = 5 },
        { itemName = "sabre", clientId = 3273, buy = 35, sell = 12 },
        { itemName = "scale armor", clientId = 3377, buy = 260, sell = 75 },
        { itemName = "short sword", clientId = 3294, buy = 26, sell = 10 },
        { itemName = "sickle", clientId = 3293, buy = 7, sell = 3 },
        { itemName = "soldier helmet", clientId = 3375, buy = 110, sell = 16 },
        { itemName = "spike sword", clientId = 3271, buy = 8000, sell = 240 },
        { itemName = "steel helmet", clientId = 3351, buy = 580, sell = 293 },
        { itemName = "steel shield", clientId = 3409, buy = 240, sell = 80 },
        { itemName = "studded armor", clientId = 3378, buy = 90, sell = 25 },
        { itemName = "studded helmet", clientId = 3376, buy = 63, sell = 20 },
        { itemName = "studded legs", clientId = 3362, buy = 50, sell = 15 },
        { itemName = "studded shield", clientId = 3426, buy = 50, sell = 16 },
        { itemName = "sword", clientId = 3264, buy = 85, sell = 25 },
        { itemName = "throwing knife", clientId = 3298, buy = 25, sell = 2 },
        { itemName = "two handed sword", clientId = 3265, buy = 950, sell = 450 },
        { itemName = "viking helmet", clientId = 3367, buy = 265, sell = 66 },
        { itemName = "viking shield", clientId = 3431, buy = 260, sell = 85 },
        { itemName = "war hammer", clientId = 3279, buy = 10000, sell = 470 },
        { itemName = "wooden shield", clientId = 3412, buy = 15, sell = 5 },
    },
    ["distance"] = {
        { itemName = "arrow", clientId = 3447, buy = 2 },
        { itemName = "bolt", clientId = 3483, buy = 4 },
        { itemName = "bow", clientId = 3350, buy = 400, sell = 100 },
        { itemName = "crossbow", clientId = 3349, buy = 500, sell = 120 },
        { itemName = "crystalline arrow", clientId = 15793, buy = 450 },
        { itemName = "drill bolt", clientId = 16142, buy = 12 },
        { itemName = "diamond arrow", clientId = 35901, buy = 100 },
        { itemName = "earth arrow", clientId = 774, buy = 5 },
        { itemName = "envenomed arrow", clientId = 16143, buy = 12 },
        { itemName = "flaming arrow", clientId = 763, buy = 5 },
        { itemName = "flash arrow", clientId = 761, buy = 5 },
        { itemName = "onyx arrow", clientId = 7365, buy = 7 },
        { itemName = "piercing bolt", clientId = 7363, buy = 5 },
        { itemName = "power bolt", clientId = 3450, buy = 7 },
        { itemName = "prismatic bolt", clientId = 16141, buy = 20 },
        { itemName = "quiver", clientId = 35562, buy = 400 },
        { itemName = "royal spear", clientId = 7378, buy = 15 },
        { itemName = "shiver arrow", clientId = 762, buy = 5 },
        { itemName = "sniper arrow", clientId = 7364, buy = 5 },
        { itemName = "spear", clientId = 3277, buy = 9, sell = 3 },
        { itemName = "spectral bolt", clientId = 35902, buy = 70 },
        { itemName = "tarsal arrow", clientId = 14251, buy = 6 },
        { itemName = "throwing star", clientId = 3287, buy = 42 },
        { itemName = "vortex bolt", clientId = 14252, buy = 6 },
    },
    ["rods"] = {
        { itemName = "exercise rod", clientId = 28556, buy = 236250, subType = 500 },
        { itemName = "hailstorm rod", clientId = 3067, buy = 15000 },
        { itemName = "moonlight rod", clientId = 3070, buy = 1000 },
        { itemName = "necrotic rod", clientId = 3069, buy = 5000 },
        { itemName = "northwind rod", clientId = 8083, buy = 7500 },
        { itemName = "snakebite rod", clientId = 3066, buy = 500 },
        { itemName = "springsprout rod", clientId = 8084, buy = 18000 },
        { itemName = "terra rod", clientId = 3065, buy = 10000 },
        { itemName = "underworld rod", clientId = 8082, buy = 22000 },
    },
    ["wands"] = {
        { itemName = "exercise wand", clientId = 28557, buy = 236250, subType = 500 },
        { itemName = "wand of cosmic energy", clientId = 3073, buy = 10000 },
        { itemName = "wand of decay", clientId = 3072, buy = 5000 },
        { itemName = "wand of draconia", clientId = 8093, buy = 7500 },
        { itemName = "wand of dragonbreath", clientId = 3075, buy = 1000 },
        { itemName = "wand of inferno", clientId = 3071, buy = 15000 },
        { itemName = "wand of starstorm", clientId = 8092, buy = 18000 },
        { itemName = "wand of voodoo", clientId = 8094, buy = 22000 },
        { itemName = "wand of vortex", clientId = 3074, buy = 500 },
    },
    ["potions"] = {
        { itemName = "great health potion", clientId = 239, buy = 225 },
        { itemName = "great mana potion", clientId = 238, buy = 144 },
        { itemName = "great spirit potion", clientId = 7642, buy = 228 },
        { itemName = "health potion", clientId = 266, buy = 50 },
        { itemName = "mana potion", clientId = 268, buy = 56 },
        { itemName = "strong health potion", clientId = 236, buy = 115 },
        { itemName = "strong mana potion", clientId = 237, buy = 93 },
        { itemName = "supreme health potion", clientId = 23375, buy = 625 },
        { itemName = "ultimate health potion", clientId = 7643, buy = 379 },
        { itemName = "ultimate mana potion", clientId = 23373, buy = 438 },
        { itemName = "ultimate spirit potion", clientId = 23374, buy = 438 },
        { itemName = "empty potion flask", clientId = 283, sell = 5 },
        { itemName = "empty potion flask", clientId = 284, sell = 5 },
        { itemName = "empty potion flask", clientId = 285, sell = 5 },
        { itemName = "vial", clientId = 2874, sell = 5 },
    },
    ["runes"] = {
        { itemName = "animate dead rune", clientId = 3203, buy = 375 },
        { itemName = "avalanche rune", clientId = 3161, buy = 57 },
        { itemName = "blank rune", clientId = 3147, buy = 10 },
        { itemName = "chameleon rune", clientId = 3178, buy = 210 },
        { itemName = "convince creature rune", clientId = 3177, buy = 80 },
        { itemName = "cure poison rune", clientId = 3153, buy = 65 },
        { itemName = "destroy field rune", clientId = 3148, buy = 15 },
        { itemName = "disintegrate rune", clientId = 3197, buy = 26 },
        { itemName = "energy bomb rune", clientId = 3149, buy = 203 },
        { itemName = "energy field rune", clientId = 3164, buy = 38 },
        { itemName = "energy wall rune", clientId = 3166, buy = 85 },
        { itemName = "explosion rune", clientId = 3200, buy = 31 },
        { itemName = "fire bomb rune", clientId = 3192, buy = 147 },
        { itemName = "fire field rune", clientId = 3188, buy = 28 },
        { itemName = "fire wall rune", clientId = 3190, buy = 61 },
        { itemName = "fireball rune", clientId = 3189, buy = 30 },
        { itemName = "great fireball rune", clientId = 3191, buy = 57 },
        { itemName = "heavy magic missile rune", clientId = 3198, buy = 12 },
        { itemName = "holy missile rune", clientId = 3182, buy = 16 },
        { itemName = "icicle rune", clientId = 3158, buy = 30 },
        { itemName = "intense healing rune", clientId = 3152, buy = 95 },
        { itemName = "light magic missile rune", clientId = 3174, buy = 4 },
        { itemName = "magic wall rune", clientId = 3180, buy = 116 },
        { itemName = "paralyse rune", clientId = 3165, buy = 700 },
        { itemName = "poison bomb rune", clientId = 3173, buy = 85 },
        { itemName = "poison field rune", clientId = 3172, buy = 21 },
        { itemName = "poison wall rune", clientId = 3176, buy = 52 },
        { itemName = "soulfire rune", clientId = 3195, buy = 46 },
        { itemName = "stalagmite rune", clientId = 3179, buy = 12 },
        { itemName = "stone shower rune", clientId = 3175, buy = 37 },
        { itemName = "sudden death rune", clientId = 3155, buy = 135 },
        { itemName = "thunderstorm rune", clientId = 3202, buy = 47 },
        { itemName = "ultimate healing rune", clientId = 3160, buy = 175 },
        { itemName = "wild growth rune", clientId = 3156, buy = 160 },
    },
    ["supplies"] = {
        { itemName = "brown mushroom", clientId = 3725, buy = 10 },
        { itemName = "ham", clientId = 3582, buy = 10 },
        { itemName = "meat", clientId = 3577, buy = 5 },
        { itemName = "shapeshifter ring", clientId = 907, buy = 5500, subType = 15 },
    },
    ["tools"] = {
        { itemName = "basket", clientId = 2855, buy = 6 },
        { itemName = "bottle", clientId = 2875, buy = 3 },
        { itemName = "bucket", clientId = 2873, buy = 4 },
        { itemName = "candelabrum", clientId = 2911, buy = 8 },
        { itemName = "candlestick", clientId = 2917, buy = 2 },
        { itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
        { itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
        { itemName = "fishing rod", clientId = 3483, buy = 150, sell = 40 },
        { itemName = "machete", clientId = 3308, buy = 35, sell = 6 },
        { itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
        { itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
        { itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
        { itemName = "shovel", clientId = 3457, buy = 50, sell = 8 },
        { itemName = "spellwand", clientId = 651, sell = 299 },
        { itemName = "torch", clientId = 2920, buy = 2 },
        { itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
        { itemName = "worm", clientId = 3492, buy = 1 },
        { itemName = "spellwand", clientId = 651, sell = 299 },
    },
    ["postal"] = {
        { itemName = "label", clientId = 3507, buy = 1 },
        { itemName = "letter", clientId = 3505, buy = 8 },
        { itemName = "parcel", clientId = 3503, buy = 15 },
    },
}

npcConfig.shop = {}
for _, categoryTable in pairs(itemsTable) do
	for _, itemTable in ipairs(categoryTable) do
		table.insert(npcConfig.shop, itemTable)
	end
end

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
    npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
    npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
    npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
    npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
    npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
    npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local playerId = player:getId()

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    local formattedCategoryNames = {}
	for categoryName, _ in pairs(itemsTable) do
		table.insert(formattedCategoryNames, "{" .. categoryName .. "}")
	end

	local categoryTable = itemsTable[message:lower()]

	if categoryTable then
		npcHandler:say("Of course, just browse through my wares.", npc, player)
		npc:openShopWindowTable(player, categoryTable)
	end    

    return true
end
npcHandler:setMessage(
    MESSAGE_GREET, "Oh, please come in, |PLAYERNAME| . \z
    What do you need? \z
    {distance}, {potions}, {runes}, {supplies} as well as some more  things like {postal}, {tools}, {rods}, {wands}, {various}, {exercise weapons}, {equipment}?"
)
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setMessage(
    MESSAGE_SENDTRADE, 
    "Of course, just browse through {distance}, {potions}, {runes}, {supplies} as well as some more  things like {postal}, {tools}, {rods}, {wands}, {various}, {exercise weapons}, {equipment}"
)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
