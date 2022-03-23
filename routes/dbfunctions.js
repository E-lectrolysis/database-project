let db = require('better-sqlite3')('database.db', { verbose: console.log });


function findAllMonsters() {
    let stmt = db.prepare("SELECT * FROM monsters");
    return stmt.all();
}

function findMonster(parameter) {
    let stmt = db.prepare("SELECT * FROM monsters WHERE name = ?");
    return stmt.get(parameter);
}

function getAllMonsterNames() {
    let stmt = db.prepare("SELECT name FROM monsters");
    return stmt.all();
}

function findBodyParts(monsterName) {
    let stmt = db.prepare("SELECT * FROM body_parts WHERE monster_name = ?");
    return stmt.all(monsterName);
}

function getLootTable(monsterName) {
    let stmt = db.prepare("SELECT item FROM loot_table WHERE monster = ?");
    return stmt.all(monsterName);
}

function getLootTableFromItem(itemName) {
    let stmt = db.prepare("SELECT monster FROM loot_table WHERE item = ?");
    return stmt.all(itemName);
}

function getItem(itemName) {
    let stmt = db.prepare("SELECT item, description from items WHERE item = ?");
    return stmt.get(itemName);
}

function getAllQuests() {
    let stmt = db.prepare("SELECT quest_id, quest_name, quest_rank from quests");
    return stmt.all();
}

function getQuest(qid) {
    let stmt = db.prepare("SELECT * FROM quests WHERE quest_id = ?");
    return stmt.get(qid)
}

function getTargetQuests(monsterName) {
    let stmt = db.prepare("SELECT quest_id, quest_name, quest_rank, hitpoints, target_type FROM quest_monsters JOIN quests ON quest_id = quest WHERE monster = ? AND (target_type = 'Hunt' OR target_type = 'Slay' OR target_type = 'Capture' )");
    return stmt.all(monsterName); 

}

function getOtherQuests(monsterName) {
    let stmt = db.prepare("SELECT quest_id, quest_name, quest_rank, hitpoints, target_type FROM quest_monsters JOIN quests ON quest_id = quest WHERE monster = ? AND (target_type = 'Other' OR target_type = 'Invader')");
    return stmt.all(monsterName); 
}

function getTargetMonsters(questId) {
    let stmt = db.prepare("SELECT monster, quest_rank, hitpoints, target_type FROM quest_monsters JOIN quests ON quest_id = quest WHERE quest_id = ? AND (target_type = 'Hunt' OR target_type = 'Slay' OR target_type = 'Capture' )");
    return stmt.all(questId); 

}

function getOtherMonsters(questId) {
    let stmt = db.prepare("SELECT monster, quest_rank, hitpoints, target_type FROM quest_monsters JOIN quests ON quest_id = quest WHERE quest_id = ? AND (target_type = 'Other' OR target_type = 'Invader')");
    return stmt.all(questId); 
}

function getLeaderboardForQuest(questId) {
    let stmt = db.prepare("SELECT player_name, weapon_used, time, date_submitted from leaderboard WHERE quest_id = ? ORDER BY length(time) ASC, time ASC");
    return stmt.all(questId);
}

function addLeaderboardEntry(submission) {
    let today = new Date();
    let d = String(today.getDate()).padStart(2, '0');
    let m = String(today.getMonth() + 1).padStart(2, '0'); 
    let y = today.getFullYear();

    let dateString = y + '-' + m + '-' + d;
    console.log(submission.questID);
    console.log(submission.playerName);
    console.log(submission.weapon);
    console.log(submission.totalTime);
    console.log(dateString);
    let stmt = db.prepare("INSERT INTO leaderboard (quest_id, player_name, weapon_used, time, date_submitted) VALUES (?, ?, ?, ?, ?)");
    
    const info = stmt.run(submission.questID, submission.playerName, submission.weapon, submission.totalTime, dateString);

}
module.exports = {
    findAllMonsters,
    findMonster,
    findBodyParts,
    getAllMonsterNames,
    getAllQuests,
    getItem,
    getLootTable,
    getTargetQuests,
    getOtherQuests,
    getLootTableFromItem,
    getTargetMonsters,
    getQuest,
    getLeaderboardForQuest,
    getOtherMonsters,
    addLeaderboardEntry
}