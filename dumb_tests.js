let db = require('better-sqlite3')('database.db', { verbose: console.log });


function findAllMonsters() {
    let stmt = db.prepare("SELECT * FROM monsters");
    return stmt.all();
}

function findMonster(parameter) {
    let stmt = db.prepare("SELECT * FROM monsters WHERE name = ?");
    return stmt.all(parameter);
}

function findBodyParts(monsterName) {
    let stmt = db.prepare("SELECT * FROM body_parts WHERE monster_name = ?");
    return stmt.all(monsterName);
}

console.log(findAllMonsters());
console.log(findMonster("Rathalos"));
console.log(findBodyParts("Khezu"));

db.close();