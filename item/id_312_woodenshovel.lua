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

-- UPDATE common SET com_script='item.id_312_woodenshovel' WHERE com_itemid IN (312);

require("base.licence")
require("content.gatheringcraft.graingrinding")
require("content.gatheringcraft.sieving")
require("item.general.wood")

module("item.id_312_woodenshovel", package.seeall)

LookAtItem = item.general.wood.LookAtItem

function getMill(User)

	local targetItem = base.common.GetFrontItem(User);
	if (targetItem ~= nil and targetItem.id == 250) then
		return targetItem;
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (targetItem ~= nil and targetItem.id == 250) then
					return targetItem;
				end
			end
		end
	end
	return nil;
end

function getSieve(User)

	local targetItem = base.common.GetFrontItem(User);
	if (targetItem ~= nil and targetItem.id == 727) then
		return targetItem;
	end

	local Radius = 1;
	for x=-Radius,Radius do
		for y=-Radius,Radius do
			local targetPos = position(User.pos.x + x, User.pos.y + y, User.pos.z);
			if (world:isItemOnField(targetPos)) then
				local targetItem = world:getItemOnField(targetPos);
				if (targetItem ~= nil and targetItem.id == 727) then
					return targetItem;
				end
			end
		end
	end
	return nil;
end

function UseItem(User, SourceItem, ltstate)
	if base.licence.licence(User) then --checks if user is citizen or has a licence
		return -- avoids crafting if user is neither citizen nor has a licence
	end

	local millItem = getMill(User);
	if millItem then
		content.gatheringcraft.graingrinding.StartGathering(User, millItem, ltstate);
		return
	end

	local sieveItem = getSieve(User);
	if sieveItem then
		content.gatheringcraft.sieving.StartGathering(User, sieveItem, ltstate);
		return
	end

	base.common.InformNLS(User,
		"Du musst neben einem M�hlstein oder Sieb stehen um die Holzkelle zu benutzen.",
		"You must stand next to a millstone or a sieve to use the wooden shovel.");
end
