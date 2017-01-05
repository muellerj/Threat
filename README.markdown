# Prot

A World of Warcraft Vanilla (v1.1.12) Addon to simplify Warrior tanking.

# Usage

Provide a single button to generate the maximum available threat on a given
single target. My keybindings have this on a easy-to-reach button, such as `E`.
Other frequently used abilities such as Shield Block or Bloodrage are not
included, since they have different intentions.

# Installation

Clone the repository into your `Addons` folder:

    cd <WOW_BASE_DIR>
    cd Interface/Addons
    git clone https://github.com/muellerj/Prot

Create a macro to call `Prot()` or `/prot`:

    /prot

# Configuration

`Prot` can be enabled or disabled via `/prot enable`/`/prot disable` and its
operation can be inspected via `/prot debug` (toggles debug messages on/off).
