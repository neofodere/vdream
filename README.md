# V.Dream
<img src="images/logo_vdream.png" width="600" height="450"><br>
V.Dream is a V.Smile emulator developed by **Néo Foderé de Frutos** under the **FODSOFT™** brand and written in `C`, `C#`, and `XAML`. The V.Dream core is based on V.Frown, an emulator originally developed by **Ian (Schnert0)** and other contributors.<br>

With V.Dream, you can play and relive the games from your childhood or discover them for the first time, develop your own software with instructions for the emulated hardware, among other features. It should be noted that neither FODSOFT™ nor V.Dream provide ROMs or any other means that facilitate piracy; the only thing FODSOFT™ offers is software that simulates the hardware of that era so the games can run on modern devices.<br>

## Downloads `from resources.fodsoft.com`
[Download the installer](https://resources.fodsoft.com/downloads/vdream_installer.exe)<br>
[Download the portable version (x64)](https://resources.fodsoft.com/downloads/vdream_portable_x64.7z)<br>
[Download the portable version (x86)](https://resources.fodsoft.com/downloads/vdream_portable_x86.7z)

## Installation and Setup guide
***First, download and install the .NET Desktop Runtime from the Microsoft website if you don’t already have it.***

1. Download and install the **vdream_installer.exe** file.

    1.1. Run it and select an installation folder, or use the default one. **(If you select a folder that requires elevated write permissions, you will need to run V.Dream as an administrator whenever you want to use it)**.

2. Or download and extract the **vdream_portable_{architecture}.7z** file and run **vdream.exe**.

3. Open V.Dream and press the center button to select a folder, or go to `System -> Select folder`.<br> <img src="images/vdream_tuto_01.png" width="432" height="328"><br>
4. Or go to `System -> Run cartridge` to launch a game directly.<br> <img src="images/vdream_tuto_02.png" width="432" height="328"><br>
5. Now you can play, but some games require an official BIOS file. To import it, go to `Settings -> Paths -> BIOS -> Select BIOS`, or try to launch a game that requires a BIOS file and press `Import BIOS`.<br> <img src="images/vdream_tuto_03.png" width="432" height="328"><br>
6. If you want a smoother output image, change the setting from `Settings -> Graphics -> Image mode -> Smoothing (Linear)`.<br> <img src="images/vdream_tuto_04.png" width="423.5" height="310.5"><br>
7. You can switch the game menu mode between a vertical list view and a customizable cover view from `View -> Covers` and `View -> List`.<br> <img src="images/vdream_tuto_05.png" width="421" height="187.5">

## Game Controls
| Keyboard             | V.Smile          |
|----------------------|------------------|
| [W], [↑]             | ⬆️ Move up       |
| [A], [←]             | ⬅️ Move left     |
| [S], [↓]             | ⬇️ Move down     |
| [D], [→]             | ➡️ Move right    |
| [Space]              | ✔️ ENTER / OK    |
| [Z]                  | 🔴 Red           |
| [X]                  | 🟡 Yellow        |
| [C]                  | 🔵 Blue          |
| [V]                  | 🟢 Green         |
| [E]                  | ❔ Help          |
| [Q]                  | ❌ Exit          |
| [Enter]              | 🔤 ABC           |

## Emulation shortcuts
| Keyboard             | Action           |
|----------------------|------------------|
| [F]                  | Full screen      |
| [Esc]                | Stop emulation   |
| [P]                  | Pause / Resume   |
| [R]                  | Restart          |
| [,]                  | Save state       |
| [.]                  | Load state       |

## Screenshots
<img src="images/vdream_screenshot_01.png" width="400" height="225"><br>
<img src="images/vdream_screenshot_02.png" width="400" height="225"><br>
<img src="images/vdream_screenshot_03.png" width="400" height="225"><br>
<img src="images/vdream_screenshot_04.png" width="400" height="225"><br>

## Videos
`Testing V.Dream emulator with 2 games (YouTube)`:
[![](images/yt_vdream_test.png)](https://www.youtube.com/watch?v=nBWWK4eleDg)

## V.Dream folder structure
`\saves`: Folder with your game savestates.<br>
`\covers`: Folder with your game covers.<br>
`vdream.exe`: The main executable of the emulator.<br>
`vdream_core.exe`: The emulation core executable based on V.Frown.<br>
`bios.bin`: A copy of the BIOS file you have imported.<br>
`vdream.config`: Configuration file for user preferences.<br>
`vdream_core.config`: Configuration file for internal emulation parameters.
### Files created by the installer
`V.Dream.lnk`: The V.Dream shortcut that points to **vdream.exe**.<br>
`unins000.exe`: The V.Dream uninstaller.<br>
`unins000.dat`: Data file used by the uninstaller to track installed files.

## How to use the V.Dream Help Tools
***The default V.Dream directory is:*** `%LOCALAPPDATA%\fodsoft\vdream`

**=>**`V.Dream Shortcut Creator: scripts/VDREAM_SHORTCUT.PS1`
1. Download the file ***VDREAM_SHORTCUT.PS1*** to any folder on your computer.
2. Open Windows PowerShell.
3. Go to the folder where the script is located.
4. Run the script using this command: `powershell -ExecutionPolicy Bypass -File .\VDREAM_SHORTCUT.PS1` **(You can also pass the installation path to the script as an argument if it’s not the default one.)**
5. Wait for the message that confirms the shortcut was created.
6. **Done!** Check your Desktop for the new V.Dream shortcut.

**=>**`V.Dream Integrity Checker: scripts/VDREAM_CHECKER.PS1`
1. Download the file ***VDREAM_CHECKER.PS1*** to any folder on your computer.
2. Open Windows PowerShell.
3. Go to the folder where the script is located.
4. Run the script using this command: `powershell -ExecutionPolicy Bypass -File .\VDREAM_CHECKER.PS1` **(You can also pass the installation path to the script as an argument if it’s not the default one.)**
5. Wait for the message. If it contains ✅ **OK**, your installation is correct. If it contains ❌ **KO**, the installation is corrupted or some files are missing.

<p><strong>V.Dream is an independent project of FODSOFT™ and is not affiliated with, endorsed by, or in any way connected to VTech® or any of its subsidiaries or affiliates. This software is created solely as a tribute to a classic educational console experience and is intended for preservation and educational purposes.</strong></p>
<p><em><strong>V.DREAM DOES NOT ACCEPT DONATIONS.</strong></em></p>
<p><strong>© 2025 FODSOFT™. Néo Foderé de Frutos. All rights reserved.</strong></p>
<!-- FODSOFT(TM). Neo Fodere de Frutos. All rights reserved. -->
