# DepthUI

**DepthUI** is a configurable holographic UI system for FiveM, providing immersive, in-game 3D text prompts and guides. Ideal for tutorials, interaction zones, or any situation where you want to deliver context-aware instructions without cluttering the screen.

---

## Features

- **Location-Based Activation**: Display UI only when players enter defined zones.  
- **Customizable Styling**: Adjust colors, sizes, padding, borders, and transitions via a single configuration file.  
- **Dynamic Text Lines**: Support for titles, subtitles, and multiple description lines.  
- **Smooth Transitions**: Fade-in and fade-out effects for seamless in-game integration.  
- **Zero Dependencies**: Lightweight vanilla HTML, CSS, and JavaScript (with optional jQuery snippet).  

---

## Installation

1. Download this repository as a ZIP file.  
2. Extract the **DepthUI** folder into your server’s `resources` directory.  
3. Add `ensure DepthUI` to your `server.cfg` (or equivalent resource manifest) and restart the server.  

---

## Configuration

All visual parameters are managed in `config.js`, including:

- Background and border colors  
- Font sizes and line heights  
- Padding and container width  
- Transition durations  

For defining your hologram zones—coordinates, display ranges, and the actual `textLines` content—open and edit the **client.lua** file in the DepthUI folder. This is where you specify each zone’s `vector3` coordinates, `displayRange`, and the lines of text to display in-game.

You can tweak these values to match your server’s theme and UI guidelines.

---

## Usage

1. Define hologram zones in your **client.lua**, specifying world coordinates, display range, and an array of text lines for each zone.  
2. Send hologram updates via NUI messages whenever players move into or out of these zones.  
3. The UI will render 3D-rotated floating containers at the specified screen positions.  

---

## Use Cases

- **Tutorial Areas**: Guide new players through mission objectives.  
- **Roleplay Interactions**: Provide job instructions, menu hints, or dispatch controls.  
- **Informational Markers**: Highlight shop locations, event zones, or points of interest.  

---

## License

This project is released under the MIT License. Feel free to modify and redistribute.  

---

## Credits

Developed and maintained by the DepthUI team. Contributions and improvements are welcome via GitHub pull requests.  
