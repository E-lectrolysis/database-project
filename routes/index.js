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

router.get('/items/:item', function(req, res, next) {
    let item = dbfunctions.getItem(req.params.item);
    let drops = dbfunctions.getLootTableFromItem(req.params.item);
    res.render('item', {item, drops});
});

module.exports = router;
