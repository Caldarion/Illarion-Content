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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (311, 'quest.groknar_311_noobia');

require("base.common")
module("quest.groknar_311_noobia", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Einf�hrung - K�mpfen"
Title[ENGLISH] = "Tutorial - Fighting"

-- Insert an extensive description of each status here, in both languages
-- Make sure that the player knows exactly where to go and what to do
Description = {}
Description[GERMAN] = {}
Description[ENGLISH] = {}
Description[GERMAN][1] = "Diese Station lehrt dich, wie man k�mpft. Groknar, der Lehrmeister, ist ein stolzer und m�chtiger Orkkrieger. Stell dich ihm vor - vorsichtig.\n\nMonster und auch andere Spielercharaktere (PvP) kannst du mit einem Rechtsklick angreifen."
Description[ENGLISH][1] = "At the next station, you will learn how to fight. Groknar, the instructor, is a proud and mighty Orc warrior. Just speak up to him - carefully.\n\nTo attack monsters and also other player characters (PvP), click on them once with the right mouse button."
Description[GERMAN][2] = "Hurr! Frischfleisch! Ich bin Groknar, der m�chtigste J�ger meines Clans. Ich bring dir bei, erb�rmliche Kreaturen zu erschlagen. Nimm diesen Kn�ppel in die Hand und erschlage drei dieser Schweine dort dr�ben. Du kannst erb�rmliche Kreaturen angreifen, indem du sie mit der rechten Maustaste einmal anklickst."
Description[ENGLISH][2] = "Hurr! Fresh meat! I be Groknar, mightiest hunter of my clan. I will teach you how to smash puny creatures. Equip this club and crush three of those pigs over there. You can attack puny creatures by clicking them once with the right mouse button."
Description[GERMAN][3] = "T�te noch zwei Schweine. Klicke hierzu ein Schwein einmal mit der rechten Maustaste an."
Description[ENGLISH][3] = "Kill two pigs. Attack a pig by clicking it once with the right mouse button."
Description[GERMAN][4] = "T�te noch ein Schwein. Klicke hierzu ein Schwein einmal mit der rechten Maustaste an."
Description[ENGLISH][4] = "Kill another pig. Attack a pig by clicking it once with the right mouse button."
Description[GERMAN][5] = "Kehre zu Groknar zur�ck, um deine Belohnung zu erhalten."
Description[ENGLISH][5] = "Return to Groknar to claim your reward."
Description[GERMAN][6] = "Du hast die Einf�hrung �ber das K�mpfen abgeschlossen."
Description[ENGLISH][6] = "You finished the tutorial on fighting."

-- Insert the position of the quest start here (probably the position of an NPC or item)
Start = {41, 44, 100}

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}
--QuestTarget[1] = {position(x, y, 100), position(x, y, 100)}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 6


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