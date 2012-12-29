require("base.common")

module("scheduled.gaia", package.seeall)

-- INSERT INTO scheduledscripts VALUES('scheduled.gaia', 10, 10, 'plantdrop');

-- simple gaia until we create a more complex version (postVBU)
function Init()
    
	plnt = {};
    grnd = {};
	local gt = base.common.GroundType
	
	-- normal herbs; collectable with sickle
	AddPlant(144, {gt.rocks})                         -- virgins weed
    AddPlant(137, {gt.sand})                          -- flamegoblet blossom
    AddPlant(135, {gt.grass})                         -- yellow weed
    AddPlant(148, {gt.forest})                        -- firnis blossom
    AddPlant(763, {gt.dirt})                          -- mash flower
    AddPlant(767, {gt.water})                          -- water blossom
	AddPlant(140, {gt.forest})                        -- donf blade
    AddPlant(156, {gt.sand})                          -- steppe fern
    AddPlant(153, {gt.grass})                         -- foot leaf
    AddPlant(752, {gt.rock})                         -- mandrake
	AddPlant(147, {gt.forest})                       -- blackberry
    AddPlant(142, {gt.sand})                         -- sandberry
    AddPlant(143, {gt.grass})                         -- red elder
    AddPlant(136, {gt.dirt})                          -- anger berry
    AddPlant(134, {gt.grass})                         -- fourleafed oneberry
    AddPlant(155, {gt.water})                         -- sibanac leaf
    AddPlant(151, {gt.forest})                        -- strawberry
    AddPlant(141, {gt.rocks})                         -- black thistle
    AddPlant(145, {gt.grass})                         -- heath flower
    AddPlant(151, {gt.forest})                        -- strawberry
    AddPlant(141, {gt.rocks})                         -- black thistle
    AddPlant(145, {gt.grass})                         -- heath flower
    AddPlant(133, {gt.grass})                         -- sun herb
    AddPlant(753, {gt.grass,gt.forest})              -- blue bird's berry
    AddPlant(159, {gt.forest})						-- toadstool
    AddPlant(160, {gt.forest})						-- red head
    AddPlant(161, {gt.grass})						-- herder's mushroom
    AddPlant(162, {gt.grass})						-- birth mushroom
    AddPlant(163, {gt.forest})						-- champignon
	
	-- rar herbs; not collectable with sickle
    AddPlant(138, {gt.dirt})                        -- night angels blossom
	AddPlant(146, {gt.sand})                        -- deser sky capsule
	AddPlant(152, {gt.grass, gt.forest})            -- life root
	AddPlant(754, {gt.grass})                        -- oneleaved fourberry
	AddPlant(755, {gt.rocks})                        -- fire root
	AddPlant(756, {gt.grass,gt.forest})             -- pious berry
	AddPlant(757, {gt.forest})                        -- tybalt star
	AddPlant(758, {gt.rocks})                        -- heart blood
	AddPlant(760, {gt.snow})                        -- ice leaf
	AddPlant(761, {gt.grass})                        -- rain weed
	AddPlant(762, {gt.rocks})                        -- gold crack herb
	AddPlant(764, {gt.forest})                        -- dark moos
	AddPlant(765, {gt.forest})                        -- day tream
	AddPlant(766, {gt.forest})                        -- con blossom
	AddPlant(768, {gt.forest})                        -- wolverine fern
	AddPlant(769, {gt.sand})                         -- desert berry
end

function AddPlant(ItemID,Ground)
    table.insert(plnt,ItemID);
    table.insert(grnd,Ground);
end

function plantdrop()
   if ( plnt==nil ) then
        Init();
    end

	local herbCounter = 0 -- for testing
	for i=1,50 do
	    
		local rndValue = math.random(1,#plnt)
		local myPlant = plnt[rndValue]
	    local myGrndsList = grnd[rndValue]
		local myPos = position( math.random(0,1024), math.random(0,1024), 0 )
		local theTile=world:getField(myPos);
		if theTile then
			local groundType = base.common.GetGroundType( theTile:tile() )
			
			local success = false
			for i=1,#myGrndsList do
				if groundType == myGrndsList[i] then
					success = true
				end
			end			
			
			if success then
				world:createItemFromId(myPlant,1,myPos,false,333,nil)
				herbCounter = herbCounter + 1
			end
		end	
    end
	ScriptVars:set("gaiatest_var_by_merung", tostring(herbCounter)) -- testing, to see how many herbs have been spawned in the last round
	ScriptVars:save()
end

--[[ OLD VERSION !!! this will be used later again. for the time being, we use a much more simple version 
function AddPlant(ItemID,Ground,Region,Season,Datawert)
    table.insert(plnt,ItemID);
    table.insert(grnd,Ground);
    table.insert(reg,Region);
    table.insert(seas,Season);
    table.insert(dataval,Datawert);
end

function AddRegion(RegionID,X,Y,Z)
    table.insert(regID,RegionID);
    table.insert(regX,X);
    table.insert(regY,Y);
    table.insert(regZ,Z);
end

function Init()
    plnt = {};
    grnd = {};
    reg = {}; -- 0 = global, 1,2,... = region
    seas = {};
    dataval= {};
    AddPlant(132,{4},0,{10,10,10,10},0);  -- Kirschsetzling
    AddPlant(139,{4},0,{10,10,10,10},0);  -- Apfelsetzling
	AddPlant(150,{2},0,{10,10,10,10},0);  -- Tannensetzling
	AddPlant(152,{4},0,{10,10,10,10},0);  -- Lebenswurzel
	AddPlant(588,{4},1,{10,10,10,10},0);  -- Cachdernsetzling
	AddPlant(589,{2},5,{10,10,10,10},0);  -- Eldan-Eichensetzling
	AddPlant(590,{2},0,{10,10,10,10},0);  -- Scandrel-Setzling
	AddPlant(591,{4},0,{10,10,10,10},0);  -- Naldorbaumsetzling
	AddPlant(752,{3,4},1,{10,10,10,10},0);  -- Alraune
	AddPlant(756,{2},0,{10,10,10,10},0);  -- Frommbeere
	AddPlant(757,{2},2,{10,10,10,10},0);  -- Gottesblume
	AddPlant(758,{2},0,{10,10,10,10},0);  -- Herzblut
	AddPlant(764,{3},7,{10,10,10,10},0);  -- Tagteufel
	AddPlant(765,{2},2,{10,10,10,10},0);  -- Tagtraum
	AddPlant(766,{7},3,{10,10,10,10},0);  -- Trugbl�te
	AddPlant(769,{3},0,{10,10,10,10},0);  -- W�stenbeere
 	
    -- 0 alle / 1 Acker / 2 Wald / 3 Sand / 4 Wiese / 5 Fels / 6 Wasser / 7 Dreck

    anz_pflanzen = table.getn(plnt);
	
	regID = {};
    regX = {};
    regY = {};
	regZ = {};
	
	-- id
	-- x-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- y-Koord: {From, To} 2 Values!, smaller value must be named first. Take care by neg. values!
	-- z-Koord: {From, To} 2 Values! Use p.E. {0,0} if you want just area 0. smaller value must be named first. Take care by neg. values!
	AddRegion(0,{  0,1024},{  0,1024},{0,0}); -- 0 = global region
	AddRegion(1,{ 93, 191},{727, 834},{0,0}); -- 1 = Katanbi Delta
	AddRegion(2,{520, 672},{664, 800},{0,0}); -- 2 = Sentri Forest
	AddRegion(3,{648, 825},{243, 374},{0,0}); -- 3 = Bounding Stream - The Dead Mash
	AddRegion(4,{518, 770},{ 95, 251},{0,0}); -- 4 = Plain of Silence
	AddRegion(5,{625,1024},{0,237},{0,0}); -- 5 = Northern Wood
	AddRegion(6,{501,1024},{0,1024},{0,0}); -- 6 = Evil Rock
	AddRegion(7,{847,996},{331,484},{0,0}); -- 7 = Pauldron Isle
	AddRegion(8,{501,1024},{0,1024},{0,0}); -- 8 = Elstree Plain
	AddRegion(9,{501,1024},{0,1024},{0,0}); -- 9 = Dewy Swamps
end

function plantdrop()
    if ( plnt==nil ) then
        Init();
    end
	--if (world:isCharacterOnField(position(0,15,0))) then
			--user = world:getCharacterOnField( position(0,15,0) );
		--end

    local season=math.ceil( world:getTime("month") / 4 );
    season = base.common.Limit( season, 1, 4 );
    local spawn_amm = 15;
    if (season == 1) then --Fr�hling
        spawn_amm = 40;
    elseif (season == 2) then --Sommer
        spawn_amm = 40;
    elseif (season == 3) then --Herbst
        spawn_amm = 40;
    elseif (season == 4) then --Winter
        spawn_amm = 40;
    end

    for i=1,spawn_amm do
        ---- Pflanze aussuchen
        auswahl = math.random( anz_pflanzen );

        if( seas[ auswahl ][ season ] >= math.random(10) ) then
            success = true;
        else
            success = false;
        end
        if success then
            check = grnd[auswahl][math.random(1,table.getn(grnd[auswahl]))];
			checkreg = reg[auswahl]+1;
            pflwert = dataval[auswahl];
            ---- Standortbestimmung
            newpos = position( math.random(0,1024), math.random(0,1024), 0 );
			---- liegt newpos in der region?
			if ( regX[checkreg][1] <= newpos.x ) and ( newpos.x <= regX[checkreg][2]) and ( regY[checkreg][1] <= newpos.y ) and ( newpos.y <= regY[checkreg][2] ) then	
				---- bodentile feststellen
				theTile=world:getField(newpos);
				-- DO NOT SPAM THE ERROR LOG WITH THIS SHIT
                -- local bodenart = base.common.GetGroundType( theTile:tile() );
				local bodenart = 0
                if ((bodenart == check) or (check == 0)) then
					-- Kraut setzen
					world:createItemFromId(plnt[auswahl],1,newpos,false,333,pflwert);
					--user:inform("Pflanze: " ..plnt[auswahl].. " Boden: " ..bodenart.. " Position: "..newpos.x.." : " ..newpos.y.." : "..newpos.z.. " Pflreg: " ..reg[auswahl].. "; Region: " ..regID[checkreg] );
				end
			else
			--user:inform("falsche Pos");
			end

        end
    end
end]]