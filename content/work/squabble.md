---
slug: "squabble"
title: "Squabble"
summary: "A word game for slow games between friends, played one turn at a time. In closed testing."
kind: "Game"
period: "2026–"
status: "Closed alpha"
group: "Games"
weight: 40
featured: true
date: 2026-10-09
stack: ["TypeScript", "React", "Vite", "Node.js", "server-sent events", "progressive web app"]
licence: "MIT"
---

Squabble is a word game for people who play a move, put the phone down and come back later. Two players build words across a shared board, one turn at a time, and a game can run for days.

It is in a closed alpha: a handful of players on one server while the rules, the dictionaries and the phone experience are worn in.

- **The server is the referee.** Every move is validated and scored on the server against the full board. The browser only displays the game, so nothing a player does in developer tools can invent a word or a score.
- **Real dictionaries.** Nine languages, built from openly licensed word lists, from about 195,000 English words to 2.4 million Italian ones. British spellings count.
- **A computer opponent at three strengths.** It considers every place a word could go and every combination of tiles that could fill it, and puts each candidate through the same validator the humans face. About fifteen milliseconds a move.
- **Built for slow games.** It installs on a phone straight from the browser, no app store needed. Live updates arrive while the game is open.

The source will be published under the MIT licence.
