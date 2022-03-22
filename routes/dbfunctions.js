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

function getTargetQuests(monsterName) {
    let stmt = db.prepare("SELECT monster, quest_id, quest_name, quest_rank, hitpoints, target_type FROM quest_monsters JOIN quests ON quest_id = quest WHERE monster = ? AND (target_type = 'Hunt' OR target_type = 'Slay' OR target_type = 'Capture' )");
    return stmt.all(monsterName); 

}

function getOtherQuests(monsterName) {
    let stmt = db.prepare("SELECT monster, quest_id, quest_name, quest_rank, hitpoints, target_type FROM quest_monsters JOIN quests ON quest_id = quest WHERE monster = ? AND (target_type = 'Other' OR target_type = 'Invader')");
    return stmt.all(monsterName); 
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
    getLootTableFromItem
}