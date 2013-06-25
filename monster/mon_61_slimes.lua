require("monster.base.drop")
require("monster.base.lookat")
require("monster.base.quests")
require("base.messages");
require("monster.base.kills")
require("scheduled.showGFX")
module("monster.mon_61_slimes", package.seeall)


function ini(Monster)

init=true;
monster.base.quests.iniQuests();
killer={}; --A list that keeps track of who attacked the monster last

--Random Messages
msgs = base.messages.Messages();
msgs:addMessage("#me blubbert.", "#me bubbles.");

end

function enemyNear(Monster,Enemy)
	
    if init==nil then
        ini(Monster);
    end

    if math.random(1,10) == 1 then
        monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
    end
	
    return false
end

function enemyOnSight(Monster,Enemy)
	local MonID=Monster:getMonsterType();
	
    if init==nil then
        ini(Monster);
    end

    monster.base.drop.MonsterRandomTalk(Monster,msgs); --a random message is spoken once in a while
	
	if (MonID==553) then
        return ( monster.base.drop.CastMonMagic(Monster,Enemy,7,{1000,2000},{{4,5}},{},40,1,{35,50}) );
	else
		return false;
	end
	
    if monster.base.drop.DefaultSlowdown( Monster ) then
        return true
    else
        return false
    end
end

function onAttacked(Monster,Enemy)
    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onCasted(Monster,Enemy)

    if init==nil then
        ini(Monster);
    end
    monster.base.kills.setLastAttacker(Monster,Enemy)
    killer[Monster.id]=Enemy.id; --Keeps track who attacked the monster last
end

function onDeath(Monster)

	
    if killer and killer[Monster.id] ~= nil then

        murderer=getCharForId(killer[Monster.id]);
    
        if murderer then --Checking for quests

            monster.base.quests.checkQuest(murderer,Monster);
            killer[Monster.id]=nil;
            murderer=nil;

        end
    end
    
    monster.base.drop.ClearDropping();
    local MonID=Monster:getMonsterType();

if (MonID==611) then --Stinky Slime, Level: 3, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(256,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw emerald

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(255,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw ruby
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(198,5,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --emerald

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(73,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --trout
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(45,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --emerald

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins
		
		elseif (MonID==612) then --Slimey Slime, Level: 3, Armourtype: cloth, Weapontype: wrestling
		
		--Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(2,3)+math.random(22,33)),0,1); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw ruby
        if not done then done=monster.base.drop.AddDropItem(254,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw diamond
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(2,3)+math.random(22,33)),0,1); end --raw topaz

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(251,1,20,(100*math.random(2,3)+math.random(22,33)),0,2); --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,2); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(46,5,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,2); end --topaz

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(355,1,20,(100*math.random(2,3)+math.random(22,33)),0,3); --salmon
        if not done then done=monster.base.drop.AddDropItem(256,1,10,(100*math.random(2,3)+math.random(22,33)),0,3); end --raw emerald
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --ruby
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --diamond
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(2,3)+math.random(22,33)),0,3); end --topaz

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(20,60),100,773,0,4); --copper coins

    elseif (MonID==613) then --Smouldy Slime, Level: 4, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gens

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(3,4)+math.random(33,44)),0,1); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(253,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw topaz
        if not done then done=monster.base.drop.AddDropItem(257,1,1,(100*math.random(3,4)+math.random(33,44)),0,1); end --raw diamond

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(256,1,20,(100*math.random(3,4)+math.random(33,44)),0,2); --raw emerald
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,2); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,2); end --diamond

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(26,1,20,(100*math.random(3,4)+math.random(33,44)),0,3); --clay
        if not done then done=monster.base.drop.AddDropItem(252,1,10,(100*math.random(3,4)+math.random(33,44)),0,3); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(284,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --sapphire
        if not done then done=monster.base.drop.AddDropItem(198,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --topaz
        if not done then done=monster.base.drop.AddDropItem(285,1,1,(100*math.random(3,4)+math.random(33,44)),0,3); end --diamond

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(30,90),100,773,0,4); --copper coins
		
		 elseif (MonID==614) then --Cauterizing Slime, Level: 5, Armourtype: cloth, Weapontype: wrestling

        --Category 1: Raw gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,1); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(251,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw amethyst
        if not done then done=monster.base.drop.AddDropItem(252,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw obsidian
        if not done then done=monster.base.drop.AddDropItem(255,1,1,(100*math.random(4,5)+math.random(44,55)),0,1); end --raw ruby

        --Category 2: Raw gems + cutted gems

        local done=monster.base.drop.AddDropItem(257,1,20,(100*math.random(4,5)+math.random(44,55)),0,2); --raw topaz
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,2); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,2); end --ruby

        --Category 3: Special Loot

        local done=monster.base.drop.AddDropItem(726,1,20,(100*math.random(4,5)+math.random(44,55)),0,3); --coarse sand
        if not done then done=monster.base.drop.AddDropItem(253,1,10,(100*math.random(4,5)+math.random(44,55)),0,3); end --raw sapphire
        if not done then done=monster.base.drop.AddDropItem(197,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --amethyst
        if not done then done=monster.base.drop.AddDropItem(283,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --obsidian
        if not done then done=monster.base.drop.AddDropItem(46,1,1,(100*math.random(4,5)+math.random(44,55)),0,3); end --ruby

        --Category 4: Perma Loot
        monster.base.drop.AddDropItem(3076,math.random(60,180),100,773,0,4); --copper coins

    end
    monster.base.drop.Dropping(Monster);
	
	-- Glutinous Seedling
	local foundEffect, Effect = Monster.effects:find(36)
	if foundEffect then
		local find, slimeNumber = Effect:findValue("GlutinousSeedling")
		if find then
			scheduled.showGFX.SlimeList["Slime"..slimeNumber].Time = world:getTime("unix")
			scheduled.showGFX.SlimeList["Slime"..slimeNumber].Monster = false
		    local effectRemoved = Monster.effects:removeEffect(36)
		end
	end
	-- Glutinous Seedling end
end
