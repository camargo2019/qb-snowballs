# Snowball Script

This script allows players to collect and use snowballs during snowy weather in your FiveM server. The script is configurable and integrates seamlessly with the QBCore framework and the inventory system.

## Features
- **Snowball Collection**: Players can interact with snow to collect snowballs.
- **Inventory Integration**: Adds snowballs as items to the player's inventory.
- **Custom Keybinding**: Configurable keybinding for actions.

## Installation
1. **Download and Extract**: Place the script in your `resources` folder.
2. **Add to Server Config**: Add the following line to your `server.cfg`:
   ```
   ensure qb-snowballs
   ```
3. **Configure**: Edit the `config.lua` file to suit your server's needs.

## Configuration
Modify the `config.lua` file to adjust settings:

```lua
Config = {
    Key = 38, -- Keybinding for actions (Default: E key). Reference: https://docs.fivem.net/docs/game-references/controls/
    SnowBall = {
        ItemName = "weapon_snowball", -- Name of the snowball item in the inventory system.
        Quantity = 20 -- Quantity of snowballs delivered per collection.
    }
}
```

## How to Use
1. Ensure the weather is set to `XMAS` (snowy).
2. Players can press the configured key (default: **E**) near a snowpile or snowy area to collect snowballs.
3. Snowballs will be added to the player's inventory in batches of the configured quantity (default: 20).

## Dependencies
- [QBCore Framework](https://github.com/qbcore-framework/qb-core)
- [QBCore Inventory](https://github.com/qbcore-framework/qb-inventory)

## Notes
- Ensure that the snowball item (`weapon_snowball`) is properly configured in your inventory system.
- Adjust the weather using server-side weather control scripts if needed.

## Support
If you encounter any issues or have suggestions for improvement, feel free to contact us or open an issue on our GitHub repository.

## License
This script is licensed under the MIT License. See the `LICENSE` file for details.

