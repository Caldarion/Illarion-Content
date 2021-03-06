--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]
-- mining mit Spitzhacke

-- UPDATE common SET com_script='item.id_2763_pickaxe' WHERE com_itemid=2763;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1246 WHERE com_itemid = 1246;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1246 WHERE com_itemid = 915;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1245 WHERE com_itemid = 1245;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1245 WHERE com_itemid = 1254;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 232  WHERE com_itemid = 232;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 232  WHERE com_itemid = 233;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 914  WHERE com_itemid = 914;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 914  WHERE com_itemid = 1265;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1273 WHERE com_itemid = 1273;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1273 WHERE com_itemid = 1257;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1276 WHERE com_itemid = 1276;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1276 WHERE com_itemid = 1278;

-- UPDATE common SET com_agingspeed = 255, com_objectafterrot = 1250 WHERE com_itemid = 1250;
-- UPDATE common SET com_agingspeed =  10, com_objectafterrot = 1250 WHERE com_itemid = 1251;

require("base.common")
require("base.treasure")
require("content.gatheringcraft.mining")
require("item.general.metal")

module("item.id_2763_pickaxe", package.seeall)

LookAtItem = item.general.metal.LookAtItem

function UseItem(User, SourceItem, ltstate)

	local toolItem = User:getItemAt(5);
	if ( toolItem.id ~=2763 ) then
		toolItem = User:getItemAt(6);
		if ( toolItem.id ~= 2763 ) then
			base.common.HighInformNLS( User,
			"Du musst die Spitzhacke in der Hand haben!",
			"You have to hold the pick-axe in your hand!" );
			return
		end
	end

	if not base.common.FitForWork( User ) then -- check minimal food points
		return
	end

	if DigForTreasure(User) then
		return;
	end

	local areaId = content.gatheringcraft.mining.GetAreaId(User.pos);
	if (areaId == nil) then
		base.common.HighInformNLS(User,
		"Die Gegend sieht nicht so aus, als k�nnte man hier etwas finden.",
		"The area doesn't look like a good place to mine.");
		return;
	end

	local rock = content.gatheringcraft.mining.getRock(User, areaId);
	if (rock == nil) then
		base.common.HighInformNLS(User,
		"Du musst neben einem Felsen stehen um Bergbau zu betreiben.",
		"You have to stand next to a rock to mine.");
		return
	end

	content.gatheringcraft.mining.StartGathering(User, rock, ltstate);
end

-- @return  True if found a treasure.
function DigForTreasure(User)
	local TargetPos = base.common.GetFrontPosition(User);
	local groundTile = world:getField( TargetPos ):tile();
	local groundType = base.common.GetGroundType( groundTile );

	if ( (groundType == base.common.GroundType.rocks) and
		base.treasure.DigForTreasure(User, TargetPos, (User:getSkill(Character.mining)/10)+1,
			base.common.GetNLS( User,
			"Du schwingst deine Spitzhacke gegen den steinigen Boden und st��t auf etwas das noch h�rter ist als der Boden. Das muss er sein! Der Schatz. Noch einmal graben und der grenzenlose Reichtum ist dein!",
			"You swing your pick-axe against the stony ground and hit something that is even harder then the ground. That must it be! The treasure! Another swing and it is yours!" ),
			false) ) then
		return true;
	end
	return false;
end
