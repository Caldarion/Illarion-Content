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

require("base.lookat")
require("base.common")
require("item.general.checks")

module("item.general.jewel", package.seeall)

-- Normal Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN (225, 1840, 1858);

-- Priest Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN (62,67,71,82,83,334,463,465);

-- Weapon Items:
-- UPDATE common SET com_script='item.general.jewel' WHERE com_itemid IN ();

function LookAtItem(user, item)
    world:itemInform(user, item, base.lookat.GenerateLookAt(user, item, base.lookat.JEWELLERY));
end;


function UseItem(User, SourceItem, ltstate)
    -- list with jewles and the functions belonging to them
    UseMe={}
	-- UseMe[ITEMID] = function(...) UseJewl_ITEMID(...) end
	
	if not UseMe[SourceItem.id] then -- security check
	    return -- if the jewel is not defined yet, we return
    else
        UseMe[SourceItem.id](User, SourceItem, TargetItem, ltstate)
    end
end

function MoveItemBeforeMove(User,SourceItem,TargetItem)

	if TargetItem:getType() == 4 then --inventory, not belt
	
		return item.general.checks.checkLevel(User,SourceItem);
		
	else
	
		return true;
		
	end
	
	return true; --just in case
end