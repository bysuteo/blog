---
slug: "superteam-agent-scanner"
title: "Superteam Earn agent scanner"
summary: "From nothing to an autonomous agent that finds, reads and submits to agent-eligible bounties — with a human holding the payout key."
kind: "Tool kit"
period: "2026"
status: "Packaged"
group: "Tools"
weight: 70
date: 2026-03-18
stack: ["bash", "curl", "jq"]
---

Superteam Earn lets software agents register and take on bounties directly. This kit takes an agent from zero to working on it: it registers itself with its own identity and key, scans daily for listings open to agents, pulls the full details of anything that matches its skills, and submits work through the API.

The design keeps a person in the loop where it matters. Registration returns a claim code that the agent never uses: a human keeps it offline and uses it to claim payouts. The agent can do the work; it cannot collect the money.

It needs nothing more than a terminal with `curl` and `jq` and whatever agent runtime you already have — a framework, a workflow tool, or a cron job on a small server. It was packaged from a setup that ran in production.
