---
slug: "nox"
title: "Nox"
summary: "An independent publishing house: its catalogue site, and a site for each name it publishes, built to one set of standards."
kind: "Publishing system"
period: "2026–"
status: "Live"
group: "For the house"
weight: 10
featured: true
date: 2026-10-09
stack: ["Hugo", "custom themes", "IPFS hosting via 4EVERLAND", "shell and Python tooling"]
links:
  - label: "arxnox.com"
    url: "https://www.arxnox.com/"
---

[Nox](https://www.arxnox.com/) is an independent publishing house. Its catalogue lives at arxnox.com, and each name it publishes has a site of its own, with its own design: [iacula](https://iacula.com/), [lux](https://www.luxvesper.com/), [lorica](https://www.lorica.press/), [yod](https://www.yods.ink/) and [selador](https://www.selador.art/). All six are built and maintained here, and each has its own entry in this register.

### Static, and kept that way

Every site is plain HTML built with Hugo from Markdown and served over IPFS. There is no database, no admin panel and nothing to patch on a Tuesday. The writing is kept apart from the design, so a new essay never has to pass through a website's code to be published. When one of the names publishes, the catalogue updates itself.

### Deploys that tell the truth

The hosting gateway sometimes drops the connection after an upload has gone through but before it confirms, which looks exactly like a failure. The deploy treats that as *unconfirmed* rather than *failed* and checks again, instead of reporting a false alarm or giving up on a deploy that worked.

### House standards

Every site in the house has a light and a dark mode, the same reading controls (text size, back to top), images capped by height so portrait and square works sit at the same scale, and no analytics, trackers or third-party fonts.
