"use strict;";

const animes = {
  "vampire cosmonaut":
    "https://kissanime.lol/Anime/irina-the-vampire-cosmonaut.wowwo/",
  "platinum end": "https://kissanime.lol/Anime/platinum-end.wo0od/",
  "im quitting heroing":
    "https://kissanime.lol/Anime/im-quitting-heroing.woz89/",
  "dont hurt me": "https://kissanime.lol/Anime/dont-hurt-me-my-healer.woz8u/",
  otome:
    "https://kissanime.lol/Anime/trapped-in-a-dating-sim-the-world-of-otome-games-is-tough-for-mobs.wo6ze/",
  "black rock shooter":
    "https://kissanime.lol/Anime/blackrock-shooter-dawn-fall.wozcz/",
  "skull knight":
    "https://kissanime.lol/Anime/skeleton-knight-in-another-world.wowa0/",
  "dawn of the witch":
    "https://kissanime.lol/Anime/the-dawn-of-the-witch.wozai/",
  "love after world domination":
    "https://kissanime.lol/Anime/love-after-world-domination.wow7w/",
  "the way of the househusband":
    "https://kissanime.lol/Anime/the-way-of-the-househusband-part-2.wow8o/",
};

const mangas = {
  "dai dark": "https://readmanganato.com/manga-en982296",
  "kengan omeg": "https://readmanganato.com/manga-dt980702",
  brutal: "https://readmanganato.com/manga-ia985483",
  "mpd psycho": "https://manganato.com/manga-wp974272",
  gigantis: "https://manganato.com/manga-mv989778",
  "ningyo no kuni": "https://readmanganato.com/manga-uq971373",
  "dead tube": "https://readmanganato.com/manga-pp951398",
  "ooki onna": "https://manganato.com/manga-wb953636",
  ingoshima: "https://readmanganato.com/manga-ek981919",
  "kangoku kaguen": "https://readmanganato.com/manga-nl952268",
  tenkaichi: "https://manganato.com/manga-mj990344",
  "kaifuku jutsushi": "https://readmanganato.com/manga-ai977917",
  "trash.": "https://readmanganato.com/manga-bs951627",
  satanofani: "https://readmanganato.com/manga-yb975710",
  "murcielago.": "https://manganato.com/manga-vi953465",
  "black joke.": "https://manganato.com/manga-om952769",
  "pinsaro sniper": "https://manganato.com/manga-ig986163",
  "baki-dou": "https://readmanganato.com/manga-cc980259",
  "everyone's loose screw'": "https://manganato.com/manga-ga983883",
  "kumo desu": "https://readmanganato.com/manga-zd976712",
};

db = connect("192.168.1.109:27117/devi");
// cursor = db.collection.find();
// while (cursor.hasNext()) {
//   printjson(cursor.next());
// }

db.mangas.insertOne(mangas);
db.animes.insertOne(animes);
