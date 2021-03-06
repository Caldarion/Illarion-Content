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
-- medicine (since illness will be a postVBU project, this will also be postVBU)
require("base.common")
require("alchemy.base.alchemy")

module("alchemy.item.id_167_yellow_bottle", package.seeall)

-- UPDATE common SET com_script='alchemy.item.id_167_yellow_bottle' WHERE com_itemid = 167;

function DrinkPotion(User,SourceItem)
    User:inform("Der Trank scheint keine Wirkung zu haben.","The potion seems to have no effect.")
end

function UseItem(User, SourceItem, ltstate)
    -- repair potion in case it's broken
	alchemy.base.alchemy.repairPotion(SourceItem)
	-- repair end
	
	if not ((SourceItem:getData("filledWith")=="potion") or (SourceItem:getData("filledWith") =="essenceBrew")) then
		return -- no potion, no essencebrew, something else
	end
	
	local cauldron = alchemy.base.alchemy.GetCauldronInfront(User)
	if cauldron then -- infront of a cauldron?
	    alchemy.base.alchemy.FillIntoCauldron(User,SourceItem,cauldron,ltstate)
	
	else -- not infront of a cauldron, therefore drink!
        if User.attackmode then
		   base.common.InformNLS(User, "Du kannst das Gebr�u nicht nutzen, w�hrend du k�mpfst.", "You cannot use the potion while fighting.")
		else
			User:talk(Character.say, "#me trinkt eine gelbe Fl�ssigkeit.", "#me drinks a yellow liquid.")
			User.movepoints=User.movepoints - 20
			DrinkPotion(User,SourceItem) -- call effect
			alchemy.base.alchemy.EmptyBottle(User,SourceItem)
	    end
	end
end