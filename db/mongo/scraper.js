#!/usr/bin/env node
"use strict";

const x = require("x-ray")();

async function getHTML(url) {
  const response = await fetch(url, {
    credentials: "include",
    headers: {
      "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; WOW64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.5666.197 Safari/537.36",
      Accept:
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
      "Accept-Language": "en-US,en;q=0.5",
      "Upgrade-Insecure-Requests": "1",
      "Sec-Fetch-Dest": "document",
      "Sec-Fetch-Mode": "navigate",
      "Sec-Fetch-Site": "none",
      "Sec-Fetch-User": "?1",
      "Sec-GPC": "1",
      "sec-ch-ua-platform": '"Windows"',
      "sec-ch-ua":
        '"Google Chrome";v="113", "Chromium";v="113", "Not=A?Brand";v="24"',
      "sec-ch-ua-mobile": "?0",
      Pragma: "no-cache",
      "Cache-Control": "no-cache",
    },
    method: "GET",
    mode: "cors",
  });

  if (response.ok) {
    console.log(response.body);
    const chunks = [];

    for await (const chunk of response.body) {
      chunks.push(Buffer.from(chunk));
    }

    return Buffer.concat(chunks).toString("utf-8");
  }
}

async function main() {
  const resultHTML = await getHTML("https://chapmanganato.com/manga-kd987838");

  x(
    resultHTML,
    "a.chapter-name.text-nowrap"
  )(function (err, lastChapter) {
    console.log(lastChapter);
    return lastChapter;
  });
}

main();
