let dbfunctions = require('./dbfunctions.js');
let express = require('express');
let router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('home');
});

router.get('/monsters', function(req, res, next) {
    let results = dbfunctions.getAllMonsterNames();
    res.render('monsters', {results});
});

router.get('/monsters/:monster', function(req, res, next) {
    let monster = dbfunctions.findMonster(req.params.monster);
    let hitzones = dbfunctions.findBodyParts(req.params.monster);
    let drops = dbfunctions.getLootTable(req.params.monster);
    let targetQuests = dbfunctions.getTargetQuests(req.params.monster);
    let otherQuests = dbfunctions.getOtherQuests(req.params.monster);
    res.render('monster', {monster, hitzones, drops, targetQuests, otherQuests});
});

router.get('/quests', function(req, res, next) {
    results = dbfunctions.getAllQuests();
    res.render('quests', {results});
});

router.get('/quests/:quest', function(req, res, next) {
    let quest = dbfunctions.getQuest(req.params.quest);
    let targetMonsters = dbfunctions.getTargetMonsters(req.params.quest);
    let otherMonsters = dbfunctions.getOtherMonsters(req.params.quest);
    let leaderboard = dbfunctions.getLeaderboardForQuest(req.params.quest);
    res.render('quest', {quest, targetMonsters, otherMonsters, leaderboard});
});

router.post('/quests/submit', function(req, res, next) {
    let submission = req.body;
    console.log(submission);
    dbfunctions.addLeaderboardEntry(submission);
    res.sendStatus(200);
});


router.get('/items/:item', function(req, res, next) {
    let item = dbfunctions.getItem(req.params.item);
    let drops = dbfunctions.getLootTableFromItem(req.params.item);
    res.render('item', {item, drops});
});

router.get('/items/', function(req, res, next) {
    let results = dbfunctions.getItems();
    res.render('items', {results});
});

module.exports = router;
