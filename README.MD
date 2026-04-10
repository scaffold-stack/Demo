# Scaffold-Stacks dApp Demo

A high-performance developer interface for building interacting with **Clarity** smart contracts on the Stacks blockchain. This project features a custom-generated debug UI for a Counter, Fungible Token (FT), and Non-Fungible Token (NFT) ecosystem.

##  Contracts Included

### 1. Counter Contract (`counter.clar`)
A simple state-management contract to demonstrate basic read/write functionality.
* **Write:** `increment`, `decrement`, `reset`
* **Read:** `get-count`

### 2. FT Contract (`token.clar`)
A standard SIP-010 compliant fungible token.
* **Write:** `transfer`, `mint`
* **Read:** `get-name`, `get-symbol`, `get-total-supply`

### 3. NFT Contract (`nft.clar`)
A standard SIP-009 compliant non-fungible token for digital collectibles.
* **Write:** `mint`, `transfer`, `set-base-uri`
* **Read:** `get-owner`, `get-last-token-id`

##  Features

* **Auto-Generated UI:** React components generated via Tera templates directly from your Clarity source code.
* **Type-Safe Hooks:** Custom hooks for seamless interaction with `@stacks/transactions`.
* **Responsive Header:** Fully optimized for mobile and desktop, including integrated wallet connection and network badges.
