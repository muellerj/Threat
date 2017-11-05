# Threat

A World of Warcraft Vanilla (v1.1.12) Addon to simplify Warrior tanking.

## Usage

Provide a single button to generate the maximum available threat on a given
single target. My keybindings have this on a easy-to-reach button, such as `E`.
Other frequently used abilities such as Shield Block or Bloodrage are not
included, since they have different intentions.

## Installation

Clone the repository into your `Addons` folder:

    cd <WOW_BASE_DIR>/Interface/Addons
    git clone https://github.com/muellerj/Threat

Create a macro to call `Threat()` or `/threat`:

    /threat

    # or

    /script Threat();

## Commands

`Threat` can be enabled or disabled and its operation inspected:

    /threat             Cast "best" threat ability
    /threat debug       Toggle debug messages on/off

## Bugtracker

Please create an issue at https://github.com/muellerj/Threat/issues

## Credit

Many of the boilerplate functions are taken directly from `Fury.lua` by Bhaerau
(http://www.vanilla-addons.com/dls/fury/).

## Contributing

1. Fork it (https://github.com/muellerj/Threat/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
