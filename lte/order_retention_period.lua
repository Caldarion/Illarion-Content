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
require("base.orders")

module("lte.order_retention_period", package.seeall)

--[[
    Sperrfristeffekt: Falls ein Char zu viele offene Auftr�ge hat ohne diese zu erf�llen
    wird eine Sperrfrist angelegt. Innerhalb dieser Zeit kann der Char
    keine neuen Auftr�ge annehmen
    ]]--



function callEffect(eff, User)
   --nach dem ersten Aufruf entfernen
   return false;
end

function addEffect (eff, User)
    --eff.nextCalled = OrderRetentationPeriod * 600;
end

function removeEffect (eff,User)
    --beim entfernen die Vertrauensw�rdigkeit erh�hen aber wert f�r gute Auftr�ge senken
    base.orders.setThrustWorthyness(User,
        base.orders.ThrustworthynessChangeAfterRetentionPeriod,
        base.orders.GoodOrderChangeAfterRetentionPeriod);
end

function loadEffect (eff, User)
end

