"use strict;";

disableTelemetry();

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
  "at the mountains of madness": "https://manganato.com/manga-ct979576",
  "ooki onna": "https://manganato.com/manga-wb953636",
  "gantz:e": "https://manganato.com/manga-ho984623",
  leviathan: "https://readmanganato.com/manga-pj966444",
  ingoshima: "https://readmanganato.com/manga-ek981919",
  "kangoku kaguen": "https://readmanganato.com/manga-nl952268",
  tenkaichi: "https://manganato.com/manga-mj990344",
  "kaifuku jutsushi": "https://readmanganato.com/manga-ai977917",
  "trash.": "https://readmanganato.com/manga-bs951627",
  satanofani: "https://readmanganato.com/manga-yb975710",
  "murcielago.": "https://manganato.com/manga-vi953465",
  "black joke.": "https://manganato.com/manga-om952769",
  "pinsaro sniper": "https://manganato.com/manga-ig986163",
  jinmen: "https://readmanganato.com/manga-ad978186",
  "hunter x hunter": "https://readmanganato.com/manga-oc955385",
  "baki-dou": "https://readmanganato.com/manga-cc980259",
  "everyone's loose screw'": "https://manganato.com/manga-ga983883",
  "kumo desu": "https://readmanganato.com/manga-zd976712",
  "dungeon sherpa": "https://manganato.com/manga-kt987428",
  gachiakuta: "https://manganato.com/manga-na990935",
  "black lagoon": "https://readmanganato.com/manga-",
  "chainsaw man": "https://readmanganato.com/manga-dn980422",
  "at the mountains of madness": "https://manganato.com/manga-ct979576",
  "resurrection colloseum": "https://manganato.com/manga-qq993573",
  "pumpkin night": "https://chapmanganato.com/manga-br979252",
  "maou no hajemekata": "https://chapmanganato.com/manga-ki952417",
  "savage hero": "https://manganato.com/manga-qb993758",
  "cave of obscenity": "https://manganato.com/manga-pk993067",
  "ataerareta skill wo": "https://chapmanganato.com/manga-or991826",
};

db = connect("192.168.1.109:27117/devi");

const movies_obj = {
  "mad god": "https://www.imdb.com/title/tt15090124/",
};

const stash_obj = {
  step: "https://spankbang.com/7s3ed/video/sharing+my+curvy+girlfriend+with+my+skinny+stepsis",
};

const manga_obj = {
  "hell's tormentor kraken": "https://manganato.com/manga-or992226",
};

function inser_into_db(mongo_collection, object) {
  var entries = mongo_collection.find({});
  Object.keys(entries).forEach((prop) => {
    console.log(prop);
  });
  while (entries.hasNext()) {
    var entry_id = entries.next()._id;
    console.log(entry_id);
  }
  mongo_collection.updateOne(
    { _id: entry_id },
    {
      $set: object,
    }
  );
}

inser_into_db(db.stash, stash_obj);
inser_into_db(db.movies, movies_obj);
inser_into_db(db.mangas, manga_obj);

// var mangas_entry = db.mangas.find({});
// Object.keys(mangas_entry).forEach((prop) => {
//   console.log(prop);
// });
// while (mangas_entry.hasNext()) {
//   var mangas_id = mangas_entry.next()._id;
//   console.log(mangas_id);
// }
// db.mangas.updateOne(
//   { _id: mangas_id },
//   {
//     $set: {},
//   }
// );

// var animes_entry = db.animes.find({});
// Object.keys(animes_entry).forEach((prop) => {
//   console.log(prop);
// });
// while (animes_entry.hasNext()) {
//   var animes_id = animes_entry.next()._id;
//   console.log(animes_id);
// }
// db.animes.updateOne({ _id: animes_id }, { $set: {} });
