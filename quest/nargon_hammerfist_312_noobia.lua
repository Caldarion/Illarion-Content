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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (312, 'quest.nargon_hammerfist_312_noobia');

require("base.common")
module("quest.nargon_hammerfist_312_noobia", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Einf�hrung - Sammeln"
Title[ENGLISH] = "Tutorial - Gathering"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "An dieser Station lernst du, wie man Rohstoffe abbaut. Der Augenmerk liegt auf Bergbau aber im Prinzip laufen alle Sammelaktionen nach dem selben Schema ab. Nun, wer ist wohl der Richtige, um dir zu zeigen, wie man nach Gold gr�bt? Nat�rlich ein Zwerg wie Nargon Hammerfist!\n\nRohstoffe werden durch das Benutzen eines geeigneten Werkzeuges in der N�he einer Ressourcenquelle gesammelt."
Description[ENGLISH][1] = "At this station, you will learn how to gather resources. This station will focus on mining, though similar principles are applicable to the other gathering actions. Now, who might be the best to teach you how to mine for gold? Why, a dwarf like Nargon Hammerfist of course.\n\nYou can gather resources by using a suitable tool while standing close to a material source."
Description[GERMAN][2] = "Arr, mein Name ist Nargon, Nargon Hammerfist. Wilste 'nen Taler? Harr. Nur mit harter Arbeit kannste reich werden. Geh in die Mine hinter mir und sammel f�nf Brocken Kohle mit deiner Spitzhacke. Um zu sch�rfen, stell dich vor einen Stein und benutze die in der Hand gehaltene Spitzhacke."
Description[ENGLISH][2] = "Arr, the name is Nargon, Nargon Hammerfist. Ye want coin? Harr. Only through hard labour can ye become wealthy. Head into the mine behind me and gather five lumps of coal with your pick axe. To mine, stand in front of a rock and use the pick-axe which must be held in your hands."
Description[GERMAN][3] = "Du hast die Einf�hrung �ber das Sammeln abgeschlossen."
Description[ENGLISH][3] = "You finished the tutorial on gathering."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {42, 55, 100}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
QuestTarget[2] = {position(43, 49, 100), position(50, 50, 100)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    local german = Description[GERMAN][status] or ""
    local english = Description[ENGLISH][status] or ""

    return base.common.GetNLS(user, german, english)
end

function QuestStart()
    return Start
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end