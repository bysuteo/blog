---
slug: "squabble"
title: "Squabble"
summary: "A word game for friends that runs on your own server — real rules, real dictionaries, no one else's analytics."
kind: "Game"
period: "2026–"
status: "In development"
group: "Games"
weight: 40
featured: true
date: 2026-10-09
stack: ["TypeScript", "React", "Vite", "Node.js", "server-sent events", "progressive web app"]
licence: "MIT"
---

Squabble has the shape of Scrabble or Wordfeud: a fifteen-by-fifteen board, a hundred tiles, one move at a time, days between turns if that is how your friends play. The difference is where it lives. Whoever runs it owns it — the rules run on their server, the database is a file on their disk, and nobody's analytics are watching the game.

- **The server is the referee.** Every move is validated and scored on the server against the full board. The browser only displays the game, so nothing a player does in developer tools can invent a word or a score.
- **Real dictionaries.** Nine languages, built from openly licensed word lists — from about 195,000 English words to 2.4 million Italian ones. British spellings count.
- **Proper scoring.** Cross-words, premium squares that count only on the turn a tile lands, blanks worth nothing, fifty points for using all seven tiles.
- **Invite-only without a shared password.** The first account on a fresh install closes the door behind it. Every account after that needs a single-use invite, dead the moment it is used — there is no standing code to leak.
- **A computer opponent at three strengths.** It considers every place a word could go and every subset of the rack that could fill it, and puts each candidate through the same validator the humans face. About fifteen milliseconds a move.
- **Built for slow games.** Install it on a phone from the browser, play a move, put the phone away. Live updates arrive while the game is open.

The source will be published under the MIT licence.
