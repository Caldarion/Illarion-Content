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
-- INSERT INTO "quests" ("qst_id", "qst_script") VALUES (230, 'quest.explorerguild_320_questlog');

require("base.common")
require("quest.explorersguild")

module("quest.explorerguild_320_questlog", package.seeall)

GERMAN = Player.german
ENGLISH = Player.english

-- Insert the quest title here, in both languages
Title = {}
Title[GERMAN] = "Abenteurergilde"
Title[ENGLISH] = "Explorers' Guild"

-- For each status insert a list of positions where the quest will continue, i.e. a new status can be reached there
QuestTarget = {}

-- Insert the quest status which is reached at the end of the quest
FINAL_QUEST_STATUS = 3


function QuestTitle(user)
    return base.common.GetNLS(user, Title[GERMAN], Title[ENGLISH])
end

function QuestDescription(user, status)
    
	local german = "Du hast bereits ".. quest.explorersguild.CountStones(user) .." Markierungssteine der Abenteurergilde gefunden. Weiter so!"
    local english = "You have already found ".. quest.explorersguild.CountStones(user) .." marker stones of the Explorers' Guild. Keep it up!"

    return base.common.GetNLS(user, german, english)
end

function QuestTargets(user, status)
    return QuestTarget[status]
end

function QuestFinalStatus()
    return FINAL_QUEST_STATUS
end