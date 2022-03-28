BEGIN TRANSACTION;
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS monsters;
CREATE TABLE monsters (
    name TEXT NOT NULL PRIMARY KEY,
    category TEXT NOT NULL,
    description TEXT NOT NULL,
    threat_level INTEGER NOT NULL
);

DROP TABLE IF EXISTS body_parts;
CREATE TABLE body_parts (
    monster_name TEXT NOT NULL REFERENCES monsters(name),
    body_part TEXT NOT NULL,
    sever_hitzone INTEGER NOT NULL,
    blunt_hitzone INTEGER NOT NULL,
    shot_hitzone INTEGER NOT NULL,
    fire_hitzone INTEGER NOT NULL,
    water_hitzone INTEGER NOT NULL,
    thunder_hitzone INTEGER NOT NULL,
    ice_hitzone INTEGER NOT NULL,
    dragon_hitzone INTEGER NOT NULL,
    PRIMARY KEY (monster_name, body_part)
);

DROP TABLE IF EXISTS quests;
CREATE TABLE quests (
    quest_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    quest_name TEXT NOT NULL,
    client TEXT NOT NULL,
    objective TEXT NOT NULL,
    quest_rank INTEGER NOT NULL,
    quest_desc TEXT NOT NULL,
    location TEXT NOT NULL,
    reward INTEGER NOT NULL
);



DROP TABLE IF EXISTS leaderboard;
CREATE TABLE leaderboard(
    run_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    quest_id INTEGER NOT NULL REFERENCES quests(quest_id),
    player_name TEXT NOT NULL,
    weapon_used TEXT NOT NULL,
    minutes INTEGER NOT NULL,
    seconds INTEGER NOT NULL,
    milliseconds INTEGER NOT NULL,
    date_submitted TEXT NOT NULL
);

DROP TABLE IF EXISTS quest_monsters;
CREATE TABLE quest_monsters(
    monster TEXT NOT NULL REFERENCES monsters(name),
    quest INTEGER NOT NULL REFERENCES quests(quest_id),
    hitpoints INTEGER NOT NULL,
    target_type TEXT NOT NULL,
    PRIMARY KEY (monster, quest)
);

DROP TABLE IF EXISTS items;
CREATE TABLE items(
    item TEXT NOT NULL PRIMARY KEY,
    description TEXT NOT NULL
);

DROP TABLE IF EXISTS loot_table;
CREATE TABLE loot_table(
    monster TEXT NOT NULL REFERENCES monsters(name),
    item TEXT NOT NULL REFERENCES items(item),
    PRIMARY KEY (monster, item)
);

--insert monsters
INSERT INTO monsters (name, category, description, threat_level)
VALUES('Great Izuchi', 'Bird Wyvern', 
'The alpha Izuchi of its pack, identified by its larger build, upended white fur and scythe-like tail. A Great Izuchi forms a herd of many smaller Izuchi and selects two from the group to accompany it on territory patrols. Once it spots prey or senses danger, the Great Izuchi issues commands to their fellow Izuchi, and coordinates their movements. Take care that you don''t get overwhelmed.',
1);

INSERT INTO monsters (name, category, description, threat_level)
VALUES('Aknosom', 'Bird Wyvern', 
'Tending to stand on one leg, this monster somewhat resembles an umbrella. The Aknosom is highly territorial; it will spread out its wings and show off its characteristic comb to scare off threats. It also bears flammable venom that burns fiercely and lingers on the ground when lit. Draw the beast to water for an easier fight.',
2);

INSERT INTO monsters (name, category, description, threat_level)
VALUES('Volvidon', 'Fanged Beast', 
'Fanged beasts with thick red carapaces that are resistant to lava. Their rounded bodies are perfect for rolling across hot surfaces, and their long tongues are ideal for capturing insect prey. Their saliva emits a paralyzing toxin that should be avoided.',
4);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Zinogre', 'Fanged Wyvern',
'Fanged wyverns whose bodies are streaked with electricity. Sharp claws and strong limbs allow them to thrive in mountainous terrain. During hunts, they gather numerous Thunderbugs to boost their power and enter a supercharged state.',
6);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Jagras', 'Fanged Wyvern',
'A smaller monster that travels and hunts in packs. Its hide blends in with its forest environment, and it has characteristic spikes on its back. If you chase a few away, the rest will usually follow suit. They tend to keep their distance when large monsters enter their territory, but sometimes the entire group will attack if they feel particularly threatened.',
0);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Rathalos', 'Flying Wyvern',
'Terrible wyverns called "Kings of the Skies." Along with Rathian, they stake wide territories centered around their nests. Rathalos descend on invaders from the sky, attacking with poison claws and a breath of fire.',
6);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Rathian', 'Flying Wyvern',
'Fire-breathing female wyverns, also known as the "Queens of the Land." With powerful legs and poison-secreting tails, they hunt mainly on the ground. Sometimes seen preying as a couple, Rathian and Rathalos cooperate well.',
5);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Tigrex', 'Flying Wyvern',
'Flying wyverns whose primitive origins are obvious. Prone to violence, they display incredible ferocity with their claws, jaws, and developed limbs. They inhabit a wide area searching for prey, and have even been spotted in regions of harsh cold.',
7);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Khezu', 'Flying Wyvern',
'Loathsome wyverns that dwell in caves and other dark places. All but blind, Khezu hunt by smell. Their tail has evolved to cling to walls and ceilings. After using an electric shock to paralyze their prey, they extend their long neck and pounce.',
2);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Crimson Glow Valstrax', 'Elder Dragon',
'A mutant Valstrax fearsomely dubbed the "Crimson Glow." This elder dragon typically secludes itself in the upper atmosphere, but it has been driven mad by its own rampant energy, causing it to lash out at anything in its sight. Once it sights its prey, it swoops down, trampling them beneath its shifting wingblades. Several have been sighted all over, so be prepared to encounter one at any time.',
10);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Wind Serpent Ibushi', 'Elder Dragon',
'A male elder dragon that exhibits inexplicable behaviors such as floating upside down midair. Research indicates that the emission of a special gas from all over its body, and the modulation of this gas, is what allows it to move freely. It shoots air from gills on its arms and tail to fly, creating its own turbulence and soaring to great heights.',
9);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Rakna-Kadaki', 'Temnoceran', 
'A Rakna-Kadaki is usually seen covered in sticky webbing. Clinging to its abdomen are its offspring, known as Rachnoid, which it controls using the flammable gas that builds up there. Rachnoid spit fire, capture prey, and support the Rakna-Kadaki''s massive body. As their numbers dwindle, the beast will hatch more, at which point it is extremely dangerous.',
7);

INSERT INTO monsters (name, category, description, threat_level)
VALUES ('Rachnoid', 'Temnoceran', 
'The infant form of Rakna-Kadaki. At this stage in their life cycle, they cling to their mother''s abdomen, feeding on scraps of her regurgitated prey. From birth, they are instantly able to spit webs that are just as strong as their mother''s, which they use to bind prey or swiftly move about at her command.',
0);

INSERT INTO monsters (name, category, description, threat_level)
VALUES('Magnamalo', 'Fanged Wyvern', 
'A monster with a carapace like tempered steel armor. The vapor around it is actually the expelling of trapped gases from the hordes of monsters Magnamalo has consumed. This has earned it the moniker "Wyvern of Malice." Its shrouded swings can inflict hellfireblight, which causes one to combust either spontaneously or when hit. Use a Deodorant or a Wirebug to rid yourself of hellfire.',
7);

--monster hitzones

--Great Izuchi
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Great Izuchi', 'Head', 80, 80, 75, 10, 20, 10, 25, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Great Izuchi', 'Torso', 45, 45, 40, 10, 10, 10, 15, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Great Izuchi', 'Legs', 50, 50, 55, 10, 10, 10, 15, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Great Izuchi', 'Tail Base', 55, 50, 35, 10, 15, 10, 20, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Great Izuchi', 'Tail Tip', 75, 80, 75, 15, 20, 15, 25, 10);

--Aknosom
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Head', 63, 80, 80, 0, 15, 5, 10, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Crest', 63, 50, 40, 0, 0, 0, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Neck', 43, 43, 20, 0, 15, 5, 15, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Wings', 63, 50, 40, 0, 20, 15, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Torso', 38, 38, 20, 0, 15, 5, 10, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Tail', 43, 43, 25, 0, 20, 10, 15, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Aknosom', 'Legs', 36, 36, 10, 0, 35, 25, 30, 0);

--Volvidon
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Head', 55, 50, 45, 0, 30, 20, 15, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Upper Half', 45, 45, 35, 0, 20, 15, 10, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Forelegs', 38, 30, 30, 0, 10, 5, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Rear', 30, 30, 25, 0, 15, 10, 10, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Abdomen/Hind Leg', 36, 36, 20, 0, 10, 10, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Body (Spinning)', 75, 75, 10, 0, 0, 0, 0, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Volvidon', 'Back', 45, 45, 40, 0, 20, 15, 10, 0);

--Zinogre
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Head', 65, 65, 70, 10, 10, 15, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Head (Charged)', 65, 65, 70, 10, 10, 15, 0, 10);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Body', 25, 25, 30, 5, 5, 5, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Body (Charged)', 30, 30, 35, 5, 10, 10, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Back', 45, 40, 35, 10, 20, 25, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Back (Charged)', 70, 65, 55, 15, 25, 30, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Hip', 44, 44, 30, 5, 5, 10, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Hip (Charged)', 45, 45, 35, 10, 10, 15, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Foreleg', 25, 30, 30, 5, 5, 10, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Foreleg (Charged)', 43, 46, 30, 5, 5, 15, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Hind leg', 45, 45, 30, 5, 5, 10, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Hind leg (Charged)', 50, 50, 40, 10, 10, 15, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Tail', 30, 25, 25, 5, 5, 5, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Tail (Charged)', 30, 25, 25, 5, 5, 5, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Tail Tip', 21, 19, 10, 10, 15, 20, 0, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Zinogre', 'Tail Tip (Charged)', 21, 19, 10, 10, 15, 20, 0, 5);

--Jagras
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Jagras', 'Body', 80, 80, 80, 40, 0, 10, 20, 5);

--Rathalos
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Head', 65, 70, 60, 0, 15, 15, 20, 30);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Neck', 35, 40, 30, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Back', 25, 25, 20, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Abdomen', 25, 25, 20, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Tail', 45, 40, 35, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Wings', 50, 45, 40, 0, 10, 10, 15, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathalos', 'Legs', 35, 35, 30, 0, 0, 0, 5, 15);

--Rathian
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Head', 70, 75, 65, 0, 15, 15, 20, 30);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Neck', 40, 45, 35, 0, 0, 0, 5, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Back', 35, 30, 25, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Abdomen', 35, 30, 25, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Tail', 45, 40, 35, 0, 5, 5, 10, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Wings', 45, 45, 35, 0, 10, 10, 15, 25);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rathian', 'Legs', 40, 40, 35, 0, 0, 0, 5, 15);

--Tigrex
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Head', 65, 70, 55, 0, 10, 5, 25, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Back', 25, 25, 20, 0, 5, 5, 15, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Abdomen', 30, 30, 25, 0, 5, 0, 15, 10);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Foreleg', 50, 45, 35, 0, 15, 10, 20, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Back Leg', 30, 30, 25, 0, 5, 0, 15, 10);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Tail', 40, 35, 30, 0, 5, 0, 10, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Tigrex', 'Tail Base', 45, 35, 30, 0, 5, 0, 10, 15);

--Khezu
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Khezu', 'Head', 75, 75, 80, 30, 5, 0, 5, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Khezu', 'Neck', 75, 50, 50, 25, 5, 0, 5, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Khezu', 'Torso', 45, 45, 25, 25, 5, 0, 5, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Khezu', 'Wings', 25, 25, 25, 25, 5, 0, 5, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Khezu', 'Legs', 36, 20, 35, 25, 5, 0, 5, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Khezu', 'Legs (Broken)', 46, 30, 35, 25, 5, 0, 5, 5);

--Valstrax
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Head', 55, 60, 35, 25, 25, 25, 25, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Neck', 40, 30, 15, 25, 25, 25, 25, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Body', 30, 25, 10, 20, 20, 20, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Wings', 22, 45, 10, 25, 25, 25, 25, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Wings (glowing)', 64, 70, 45, 0, 0, 0, 0, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Tail', 45, 24, 20, 20, 20, 20, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Chest (Breathing)', 80, 90, 50, 15, 25, 25, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Crimson Glow Valstrax', 'Chest', 35, 25, 10, 20, 20, 20, 20, 0);

--Ibushi
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Head', 65, 70, 45, 20, 10, 5, 10, 25);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Neck', 35, 30, 25, 15, 5, 5, 5, 20);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Torso', 30, 30, 25, 10, 5, 5, 5, 10);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Chest (Windsac)', 80, 80, 75, 15, 15, 5, 15, 25);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Chest (Windsac Broken)', 25, 25, 15, 10, 5, 5, 5, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Arms', 35, 30, 35, 5, 5, 0, 5, 5);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Arms (Windsac)', 65, 60, 40, 25, 10, 5, 5, 25);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Arms (Windsac Broken)', 25, 25, 10, 15, 10, 0, 5, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Back (Windsac)', 65, 55, 45, 20, 10, 5, 5, 25);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Back (Windsac Broken)', 25, 25, 25, 15, 5, 5, 5, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Fins', 25, 25, 15, 15, 5, 5, 5, 15);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Tail', 30, 25, 10, 5, 5, 5, 5, 10);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Tail tip (Windsac)', 50, 45, 40, 25, 15, 5, 15, 35);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Wind Serpent Ibushi', 'Tail tip (Windsac Broken)', 25, 25, 15, 15, 5, 5, 5, 15);

--Rakna-Kadaki
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Head', 65, 70, 45, 0, 10, 0, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Chest', 25, 25, 10, 0, 5, 0, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Pedipalps', 20, 20, 10, 0, 15, 0, 30, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Pedipalps (Broken)', 20, 20, 10, 0, 5, 0, 20, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Abdomen', 35, 35, 15, 0, 5, 0, 10, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Abdomen (Sac)', 50, 50, 28, 0, 0, 0, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Legs', 25, 25, 15, 0, 5, 0, 15, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rakna-Kadaki', 'Legs (Broken)', 43, 43, 35, 0, 0, 0, 5, 0);

--Rachnoid
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Rachnoid', 'Body', 45, 45, 35, 0, 40, 30, 10, 10);

--Magnamalo
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Head', 55, 55, 30, 0, 15, 10, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Head (Hellfire)', 60, 60, 45, 0, 10, 15, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Torso', 25, 25, 5, 0, 20, 15, 10, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Foreleg', 38, 38, 20, 0, 20, 15, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Foreleg (Hellfire)', 48, 48, 45, 0, 10, 15, 0, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Armblade', 45, 45, 45, 0, 10, 10, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Armblade (Hellfire)',48, 48, 45, 0, 10, 15, 0, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Back', 30, 43, 15, 0, 15, 10, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Back (Hellfire)', 63, 63, 50, 0, 5, 10, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Hind Legs', 38, 38, 20, 0, 25, 25, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Tail', 43, 30, 10, 0, 15, 10, 5, 0);
INSERT INTO body_parts (monster_name, body_part, sever_hitzone, blunt_hitzone, shot_hitzone, fire_hitzone, water_hitzone, thunder_hitzone, ice_hitzone, dragon_hitzone)
VALUES ('Magnamalo', 'Tailblade', 45, 45, 45, 0, 10, 10, 5, 0);


--Items and loot tables

--Great Izuchi
INSERT INTO items (item, description)
VALUES ('Great Izuchi Pelt', 'Hair that grows on an Izuchi''s neck and head. Fades from white to orange.');
INSERT INTO items (item, description)
VALUES ('Great Izuchi Tail', 'A crescent-bladed tail. A flick of the herd leader''s tail brings its prey down.');
INSERT INTO items (item, description)
VALUES ('Bird Wyvern Gem', 'A valuable gem that can be harvested from bird wyverns. Said to fetch a high price on the market.');
INSERT INTO items (item, description)
VALUES ('Great Izuchi Pelt+', 'Great Izuchi hair. On top of being gorgeous, it''s smooth as a gentle breeze.');
INSERT INTO items (item, description)
VALUES ('Great Izuchi Tail+', 'Crescent-bladed tail. Its edge has been honed by the wind to be razor sharp.');

INSERT INTO loot_table(monster, item)
VALUES ('Great Izuchi', 'Great Izuchi Pelt');
INSERT INTO loot_table(monster, item)
VALUES ('Great Izuchi', 'Great Izuchi Pelt+');
INSERT INTO loot_table(monster, item)
VALUES ('Great Izuchi', 'Great Izuchi Tail');
INSERT INTO loot_table(monster, item)
VALUES ('Great Izuchi', 'Great Izuchi Tail+');
INSERT INTO loot_table(monster, item)
VALUES ('Great Izuchi', 'Bird Wyvern Gem');

--Aknosom
INSERT INTO items (item, description)
VALUES ('Aknosom Feather', 'Feathered Aknosom scale treasured for its use in umbrellas. Sturdy yet light.');
INSERT INTO items (item, description)
VALUES ('Aknosom Beak', 'Aknosom beak that appears to be wearing lipstick. Used in arts and crafts.');
INSERT INTO items (item, description)
VALUES ('Flame Sac', 'A monster organ filled with flammable powder. Handle with extreme care.');
INSERT INTO items (item, description)
VALUES ('Aknosom Feather+', 'Quality Aknosom feather. Swing it like a blade or layer it into a shield.');
INSERT INTO items (item, description)
VALUES ('Inferno Sac', 'A monster organ filled with powder that ignites if it so much as touches air. Danger!');

INSERT INTO loot_table(monster, item)
VALUES ('Aknosom', 'Aknosom Feather');
INSERT INTO loot_table(monster, item)
VALUES ('Aknosom', 'Flame Sac');
INSERT INTO loot_table(monster, item)
VALUES ('Aknosom', 'Aknosom Beak');
INSERT INTO loot_table(monster, item)
VALUES ('Aknosom', 'Inferno Sac');
INSERT INTO loot_table(monster, item)
VALUES ('Aknosom', 'Aknosom Feather+');
INSERT INTO loot_table(monster, item)
VALUES ('Aknosom', 'Bird Wyvern Gem');

--Rathalos
INSERT INTO items (item, description)
VALUES ('Rathalos Scale', 'A Rathalos scale. Wyvern scales like this one are fundamental materials.');
INSERT INTO items (item, description)
VALUES ('Rathalos Tail', 'A severed Rathalos tail. It has any number of uses.');
INSERT INTO items (item, description)
VALUES ('Rath Wingtalon', 'Claws that are moderately difficult to work with. A blacksmith''s first test.');
INSERT INTO items (item, description)
VALUES ('Rathalos Scale+', 'An extraordinarily durable scale carved from the body of a Rathalos.');
INSERT INTO items (item, description)
VALUES ('Rath Wingtalon+', 'Razor-sharp wing talons. Could slice through a tree trunk with ease.');
INSERT INTO items (item, description)
VALUES ('Rathalos Ruby', 'A rare, precious gem from inside a wyvern. Almost too nice to use.');

INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Rathalos Scale');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Rathalos Tail');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Rath Wingtalon');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Rathalos Scale+');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Rath Wingtalon+');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Flame Sac');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Inferno Sac');
INSERT INTO loot_table(monster, item)
VALUES ('Rathalos', 'Rathalos Ruby');

--Rathian
INSERT INTO items (item, description)
VALUES ('Rathian Scale', 'Scales of a Rathian. Their dark emerald hue exudes a feminine grace.');
INSERT INTO items (item, description)
VALUES ('Rathian Spike', 'Needle-like hair found on a Rathian''s back and wings. They contain poison.');
INSERT INTO items (item, description)
VALUES ('Rathian Scale+', 'A superior Rathian scale. Looks like a normal Rathian scale, but is much harder.');
INSERT INTO items (item, description)
VALUES ('Rathian Spike+', 'As sharp as the keenest blade. It is longer and sturdier than other spikes.');
INSERT INTO items (item, description)
VALUES ('Rathian Ruby', 'A rare, precious gem from inside a wyvern. Almost too nice to use.');

INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rathian Scale');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rathian Spike');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Flame Sac');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rath Wingtalon');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rathian Scale+');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rathian Spike+');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Inferno Sac');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rath Wingtalon+');
INSERT INTO loot_table(monster, item)
VALUES ('Rathian', 'Rathian Ruby');

--Rakna-Kadaki
INSERT INTO items(item, description)
VALUES ('Rakna-Kadaki Silk', 'Quality Rakna-Kadaki silk. A garb woven from this silk is sure to cushion any blow.');
INSERT INTO items(item, description)
VALUES ('Rakna-Kadaki Glowgut', 'A Rakna-Kadaki organ that glows alluringly, but burns with magmatic heat.');
INSERT INTO items(item, description)
VALUES ('Rakna-Kadaki Carapace', 'Hard, heavy Rakna-Kadaki carapace sometimes used in weapons and armor.');
INSERT INTO items(item, description)
VALUES ('Rakna-Kadaki Spike', 'A spike that has a charming curve. Used in weapons as well as for decoration.');
INSERT INTO items(item, description)
VALUES ('Monster Broth', 'A broth made from only the thickest of a monster''s juices. Quite rich.');

INSERT INTO loot_table(monster, item)
VALUES('Rakna-Kadaki', 'Rakna-Kadaki Silk');
INSERT INTO loot_table(monster, item)
VALUES('Rakna-Kadaki', 'Rakna-Kadaki Glowgut');
INSERT INTO loot_table(monster, item)
VALUES('Rakna-Kadaki', 'Rakna-Kadaki Carapace');
INSERT INTO loot_table(monster, item)
VALUES('Rakna-Kadaki', 'Rakna-Kadaki Spike');
INSERT INTO loot_table(monster, item)
VALUES('Rakna-Kadaki', 'Monster Broth');

--Rachnoid
INSERT INTO items(item, description)
VALUES ('Rachnoid Silk', 'Silk shot by Rachnoid. Its high tensile strength makes it stronger than it looks.');
INSERT INTO items(item, description)
VALUES ('Sharp Claw', 'A shining black claw. Unlike wyvern claws, this is shaped to grip objects.');

INSERT INTO loot_table(monster, item)
VALUES('Rachnoid', 'Rachnoid Silk');
INSERT INTO loot_table(monster, item)
VALUES('Rachnoid', 'Sharp Claw');
INSERT INTO loot_table(monster, item)
VALUES('Rachnoid', 'Monster Broth');

INSERT INTO loot_table(monster, item)
VALUES('Jagras', 'Sharp Claw');

--Volvidon
INSERT INTO items(item, description)
VALUES ('Volvidon Shell', 'The heat-resistant shell of a Volvidon. Unaffected even by boiling lava.');
INSERT INTO items(item, description)
VALUES ('Volvidon Carapace', 'A thick Volvidon carapace. The elasticity means forging it requires severe pressure.');
INSERT INTO items(item, description)
VALUES('Volvidon Claw', 'A claw from a Volvidon''s foreleg. Dramatically raises the power of a wide swing.');
INSERT INTO items(item, description)
VALUES('Volvidon Claw+', 'A hard, sharp Volvidon claw. Constant exposure to heat has tempered it like steel.');
INSERT INTO items(item, description)
VALUES('Volvidon Rickrack', 'The jagged shell of a Volvidon''s back. Its high elasticity makes it ideal for crafting flexible gear.');

INSERT INTO loot_table(monster, item)
VALUES('Volvidon', 'Volvidon Shell');
INSERT INTO loot_table(monster, item)
VALUES('Volvidon', 'Volvidon Carapace');
INSERT INTO loot_table(monster, item)
VALUES('Volvidon', 'Volvidon Claw');
INSERT INTO loot_table(monster, item)
VALUES('Volvidon', 'Volvidon Claw+');
INSERT INTO loot_table(monster, item)
VALUES('Volvidon', 'Volvidon Rickrack');
INSERT INTO loot_table(monster, item)
VALUES('Volvidon', 'Monster Broth');

--Magnamalo
INSERT INTO items(item, description)
VALUES ('Magnamalo Scale', 'Sturdy and small Magnamalo scale that is flexible and resistant to fangs.');
INSERT INTO items(item, description)
VALUES ('Magnamalo Scale+', 'Glows a piercing purple, imbued with the beast''s infinite fighting spirit.');
INSERT INTO items(item, description)
VALUES ('Magnamalo Blade', 'A claw that has grown into a blade shape on Magnamalo''s forearm. Already very sharp.');
INSERT INTO items(item, description)
VALUES ('Magnamalo Blade+', 'Honed by blood, these arm blades cut prey in two with a single swipe.');
INSERT INTO items(item, description)
VALUES ('Magna Soulprism', 'A crystal of condensed gas. Its quiet exterior belies its savage explosive power.');
INSERT INTO items(item, description)
VALUES ('Purple Magna Orb', 'This jewel glows a sinister purple as though holding many unfortunate souls.');

INSERT INTO loot_table(monster, item)
VALUES('Magnamalo', 'Magnamalo Scale');
INSERT INTO loot_table(monster, item)
VALUES('Magnamalo', 'Magnamalo Scale+');
INSERT INTO loot_table(monster, item)
VALUES('Magnamalo', 'Magnamalo Blade');
INSERT INTO loot_table(monster, item)
VALUES('Magnamalo', 'Magnamalo Blade+');
INSERT INTO loot_table(monster, item)
VALUES('Magnamalo', 'Magna Soulprism');
INSERT INTO loot_table(monster, item)
VALUES('Magnamalo', 'Purple Magna Orb');

--Valstrax
INSERT INTO items(item, description)
VALUES ('Shimmering Scale', 'Valstrax scale slightly tinged by the crimson eclipse. Portends disaster.');
INSERT INTO items(item, description)
VALUES ('Valstrax Claw+', 'This piece of Valstrax claw is remarkably hard and sharp. It''s torn up countless peacetimes.');
INSERT INTO items(item, description)
VALUES ('Crimson Liquid', 'Merely touching this boiling hot draconic fluid fills your mind with catastrophe.');
INSERT INTO items(item, description)
VALUES ('Red Dragon Orb', 'The source of evil heavenly omens. Fly fleetly, as a comet ''cross the skies.');
INSERT INTO items(item, description)
VALUES ('Rouge Spikewing', 'Touched by the crimson eclipse, this wing phases in an otherwordly fashion.');

INSERT INTO loot_table(monster, item)
VALUES('Crimson Glow Valstrax', 'Shimmering Scale');
INSERT INTO loot_table(monster, item)
VALUES('Crimson Glow Valstrax', 'Valstrax Claw+');
INSERT INTO loot_table(monster, item)
VALUES('Crimson Glow Valstrax', 'Crimson Liquid');
INSERT INTO loot_table(monster, item)
VALUES('Crimson Glow Valstrax', 'Red Dragon Orb');
INSERT INTO loot_table(monster, item)
VALUES('Crimson Glow Valstrax', 'Rouge Spikewing');


INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (1, 'Jumped In The Frost Islands', 'Hunter Hiding Behind A Bush', 'Hunt a Great Izuchi', 1, 
'Psst! Hey, pal. I just got ruffed up by a gang of Izuchi and their "great" bozo leader. They took my pouch, my zenny—even my pants! Think ya could do me a solid and take care of ''em for me? And maybe, uh, get me some pants too, huh?'
, 'Frost Islands', 1800);
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Great Izuchi', 1, 5160, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Aknosom', 1, 6120, 'Other');


INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (2, 'The Swirling Gale', 'Woman Living By the Ruins', 'Hunt a Great Izuchi', 4,
'For crying out loud! I moved near the Shrine Ruins because it was a nice and quiet neighborhood... Now there''s a Great Izuchi and its little gang making a ruckus. I tried to give ''em a piece of my mind but they pulled their blades on me! Hunter, please get rid of ''em!'
, 'Shrine Ruins', 3240);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Great Izuchi', 2, 8700, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Aknosom', 2, 11700, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (3, 'Shady Monster', 'Creepy Old Lady', 'Hunt an Aknosom', 1, 
'SAy tHeRe, hUNter~ eVEr sEeN A mOnSTeR tHAt hOPs oN One lEg? i hAvE...aND i''Ve nEveR bEen tHe sAMe sINcE—Hahaha! *hack* Those old ghost stories don''t scare me none. HOW ABOUT YOU!?'
, 'Shrine Ruins', 3240);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Aknosom', 3, 6795, 'Hunt');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (4, 'Study the Sword & Shield', 'Master Utsushi', 'Capture an Aknosom', 4,
'Alright, Ace, lesson time! An Aknosom makes clever use of its big crest to fight, right? Understand how to maneuver around these kinds of attacks and you''ll learn the very essence of the sword & shield!'
, 'Frost Islands', 5760);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Aknosom', 4, 13050, 'Capture');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Khezu', 4, 10920, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Great Izuchi', 4, 7800, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (5, 'Red Skies At Night', 'Chic Firework-Maker', 'Hunt a Rathalos', 6,
'I saw it one night: a stunning firework rising up above the Caverns, so bright, the night looked like day. If that was the doing of a monster, it''s got to be a pro at using fire. I need to know what it was.'
, 'Lava Caverns', 10800);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Rathalos', 5, 15360, 'Hunt');
--This is inaccurate and only for the sake of filler
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Volvidon', 5, 10260, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Khezu', 5, 10920, 'Other');


INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (6, 'Learn the Lance', 'Master Utsushi', 'Capture a Rathian', 5, 
'Alright, Ace, lesson time! A knight wields their lance to protect the weak—just like a Rathian fiercely protects her young! Capture the queen and you''ll acquire some new Skills for your lance!'
, 'Sandy Plains', 9360);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Rathian', 6, 13500, 'Capture');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Volvidon', 6, 10260, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (7, 'Skies Flash, Clouds Boom', 'Jittery Felyne', 'Hunt a Zinogre', 6, 
'Eep! WH-WHAT WAS THAT!? Don''t sneak up on me, Hunter! I-I''ve been on edge ever since a Zinogre j-jumped out on me! Brr...my fur''s still on end from the fear...a-and static! Could y-you help me-me-meow-t?',
'Shrine Ruins', 10800);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Zinogre', 7, 14400, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathalos', 7, 14800, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 7, 13950, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (8, 'Zin and Yang', 'Research Airship Gal', 'Hunt a Zinogre and a Khezu', 7,
'Oh, great! JUST GREAT. Where''d that stupid paper go!? No need to panic— why should I panic? *ahem* Could you, um, maybe take care of the quest for me? I''ll give you some materials to make layered armor if you do! And... could you keep this just between us?'
, 'Arena', 14040);
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Zinogre', 8, 13050, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Khezu', 8, 10500, 'Hunt');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (9, 'Wavering Moon and Thunder', 'Well-dressed Youth', 'Hunt a Zinogre', 3, 
'My guards have turned craven after hearing of a Zinogre in the area. Nonetheless, I must press on through the Forest, no matter what... Which is why I implore you, brave Hunter, to vanquish the beast instead.',
'Flooded Forest', 8280);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Zinogre', 9, 7605, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 9, 8415, 'Other');


INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (10, 'A Resounding Roar', 'Sandy Plains Trader', 'Hunt a Tigrex', 7, 
'Did you hear that? It was that Tigrex! That monster''s invaded the Plains and has been hollerin'' up a storm ever since. Now all our Popo are spooked and won''t budge. Can''t blame ''em...they are a Tigrex''s favorite snack. Please, Hunter. You gotta help us out!'
, 'Sandy Plains', 12240);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Tigrex', 10, 16200, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 10, 15300, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Volvidon', 10, 12290, 'Other');
--Inaccurate for the sake of this assignment
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Crimson Glow Valstrax', 10, 20220, 'Invader');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (11, 'The Evil Star from Beyond', 'Scarred Old Woman', 'Slay a Crimson Glow Valstrax', 7,
'The Valstrax has returned. If you plan on takin'' it on, beware its wings! If they don''t burn you to a crisp, they''ll dang sure poke you full of holes. Be quick and stay on your toes out there! Got it? Well, good luck to ya!'
, 'Sandy Plains', 21600);
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Crimson Glow Valstrax', 11, 20210, 'Slay');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Tigrex', 11, 17100, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 11, 16300, 'Other'); -- probably inaccurate
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Rakna-Kadaki', 11, 20900, 'Other'); 

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (12, 'The Evil Star from Beyond', 'Scarred Old Woman', 'Slay a Crimson Glow Valstrax', 7,
'The Valstrax has returned. If you plan on takin'' it on, beware its wings! If they don''t burn you to a crisp, they''ll dang sure poke you full of holes. Be quick and stay on your toes out there! Got it? Well, good luck to ya!'
, 'Lava Caverns', 21600);
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Crimson Glow Valstrax', 12, 20210, 'Slay');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Tigrex', 12, 17100, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathalos', 12, 18240, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Rakna-Kadaki', 12, 20900, 'Other'); 

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (13, 'Most Certainly a Legitimate Quest', 'Who Knows?', 'Slay all target monsters', 7,
'How did we get here?'
, 'Infernal Springs', 12345);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Zinogre', 13, 13050, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Crimson Glow Valstrax', 13, 20210, 'Slay');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Tigrex', 13, 16200, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type) 
VALUES ('Rathian', 13, 13500, 'Capture');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathalos', 13, 18240, 'Other');


INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (14, 'Hellfire', 'Guild Master Hojo', 'Hunt Magnamalo', 3,
'That dreadful Magnamalo has been spotted! Quick, Hunter, you must leap into action at once! We cannot allow it to feed on the hordes or it may become too powerful to defeat! No time to waste! Hop to it-to it!',
'Lava Caverns', 8640);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Magnamalo', 14, 8415, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 14, 7605, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Volvidon', 14, 6422, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (15, 'Clad in Hellfire', 'Armored Hunter', 'Hunt Magnamalo', 7, 
'What an embarrassment. My best armor was about as effective as wet paper against Magnamalo. I tell ya, that hellfire is a one-way ticket back to camp... I guess I need to hit up the Smithy again. Think you can finish up the quest for me?',
'Shrine Ruins', 12240);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Magnamalo', 15, 16200, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Aknosom', 15, 15300, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathalos', 16, 16320, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (16, 'A Blaze Among Beasts', 'Fugen the Elder', 'Hunt all Target Monsters', 7,
'Got a real challenge here for ya, Squirt! Bwahaha! Look at those ears perk up! I knew it''d be right up your alley! Best these beasties and ol'' Fugen will give ya a new Petalace. Sounds good, don''t it!? Now go get to it!',
'Lava Caverns', 22320);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 16, 11115, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Tigrex', 16, 10575, 'Hunt');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rakna-Kadaki', 16, 12595, 'Hunt'); 

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (17, 'Can''t Kill It with Fire', 'Guild Master Hojo', 'Hunt a Rakna-Kadaki', 7, 
'Rakna-Kadaki inhabit a select few regions, and yet one has just been sighted in the Lava Caverns... I just don''t get it-get it! All of this strange activity around the region. And now Minoto is acting strange as well...',
'Lava Caverns', 12240);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rakna-Kadaki', 17, 19800, 'Hunt'); 
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathalos', 17, 16320, 'Other'); 

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (18, 'Advanced: The Fallen Comet', 'Amateur Stargazer', 'Hunt a Rakna-Kadaki and Slay a Crimson Glow Valstrax', 7,
'Oh, wow! I just saw a comet fall into the Lava Caverns! While I really wanna check it out, I''m also not trying to go there by myself. Not with all the creepy crawly things that live there. Hey, what if it wasn''t a comet but that legendary elder dragon!? C''mon! Let''s go!',
'Lava Caverns', 27360);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rakna-Kadaki', 18, 15950, 'Hunt'); 
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Crimson Glow Valstrax', 18, 13630, 'Slay'); 
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 18, 17100, 'Other');
INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Tigrex', 18, 17100, 'Other');

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (19, 'Roly-Poly Lanterns', 'Girly Village Maiden', 'Deliver 8 Firelanterns', 1,
'Firelanterns are, like, so pretty! So red. So round. Something about them is simply magical. I totally wanna see them all the time so maybe I should put ''em in my room? What do you say? Think you can get me some?',
'Shrine Ruins', 240);

INSERT INTO quests (quest_id, quest_name, client, objective, quest_rank, quest_desc, location, reward)
VALUES (20, 'The Path to Royalty', 'Aspiring Monarch', 'Hunt a Rathian', 2, 
'Oh, what I wouldn''t give to be a queen! "Queen of the Land"? Who wouldn''t love a title like that!? Perhaps I may learn a thing or two from the queen herself! Valiant Knight of Kamura! I order you to hunt a Rathian!',
'Flooded Forest', 5400);

INSERT INTO quest_monsters (monster, quest, hitpoints, target_type)
VALUES ('Rathian', 20, 7605, 'Hunt');

INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Chad', 'Great Sword', 4, 3, 91, '2022-03-20');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Lyra', 'Hunting Horn', 4, 3, 90, '2022-03-20');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Lyra', 'Hunting Horn', 4, 4, 02, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Lyra', 'Bow', 5, 2, 21, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Eric', 'Insect Glaive', 4, 4, 6, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'lati', 'Dual Blades', 4, 20, 69, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Altair', 'Gunlance', 6, 9, 8, '2022-03-23');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (7, 'Eric', 'Light Bowgun', 2, 52, 56, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (7, 'Altair', 'Lance', 3, 21, 11, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (7, 'lati', 'Great Sword', 3, 25, 1, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (7, 'Altair', 'Heavy Bowgun', 2, 21, 72, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (12, 'Someone', 'Switch Axe', 4, 32, 2, '2022-03-20');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted)  
VALUES (12, 'Larza', 'Long Sword', 4, 3, 90, '2022-03-20');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (11, 'Altair', 'Charge Blade', 4, 35, 32, '2022-03-19');
INSERT INTO leaderboard (quest_id, player_name, weapon_used, minutes, seconds, milliseconds, date_submitted) 
VALUES (13, 'Lyra', 'Hunting Horn', 8, 2, 44, '2022-03-20');



COMMIT;