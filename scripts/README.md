# 📜 V.Dream Helper Scripts
![](../images/logo_vdream_helper_scripts.png)

>[!NOTE]
>***The default V.Dream directory path is:*** `%LOCALAPPDATA%\fodsoft\vdream`

>[!TIP]
>You may need to run PowerShell as an administrator for some scripts to work.

## **=>** V.Dream Shortcut Creator `VDREAM_SHORTCUT.PS1`:

### 💡 What is its purpose
Create a V.Dream shortcut on the desktop and in the Start Menu.

### 🛠️ How to use
1. Download the file ***VDREAM_SHORTCUT.PS1*** to any folder on your computer.
   
2. Open Windows PowerShell.
   
3. Go to the folder where the script is located.
   
4. Run the script using this command: `powershell -ExecutionPolicy Bypass -File .\VDREAM_SHORTCUT.PS1` **(You can also pass the installation path to the script as an argument if it’s not the default one.)**

5. Wait for the message that confirms the shortcut was created.

6. **Done!** Check your Desktop for the new V.Dream shortcut.


## **=>** V.Dream Integrity Checker `VDREAM_CHECKER.PS1`:

### 💡 What is its purpose
Verify that your V.Dream installation is not corrupted and that no files or dependencies are missing.

### 🛠️ How to use
1. Download the file ***VDREAM_CHECKER.PS1*** to any folder on your computer.

2. Open Windows PowerShell.

3. Go to the folder where the script is located.

4. Run the script using this command: `powershell -ExecutionPolicy Bypass -File .\VDREAM_CHECKER.PS1` **(You can also pass the installation path to the script as an argument if it’s not the default one.)**

5. Wait for the message. If it contains ✅ **OK**, your installation is correct. If it contains ❌ **KO**, the installation is corrupted or some files are missing.

> [!IMPORTANT]
>If the version shown in the output next to OK does not match your version, it's a bad sign even if it says OK.


## **=>** VTech Signature Inserter for ROMs `INSERT_SIGN.PS1`:

### 💡 What is its purpose
Inserts the "VTECH" signature into unsigned V.Smile ROMs, allowing V.Dream to detect them as valid ROMs.

>[!NOTE]
>The script makes a copy and does not touch the original file.

>[!WARNING]
>Use this script only if you are sure the ROM is correctly dumped and it doesn't corrupted.

### 🛠️ How to use
1. Download the file ***INSERT_SIGN.PS1*** to any folder on your computer.

2. Open Windows PowerShell.

3. Go to the folder wherenthe script is located.

4. Run the script with basic command: `powershell -ExecutionPolicy Bypass -File .\INSERT_SIGN.PS1 -rom "C:\path\to\your\rom.bin"`

- 4.1. If you want to force ASCII explicity: `powershell -ExecutionPolicy Bypass -File .\INSERT_SIGN.PS1 -rom "C:\path\to\your\rom.bin" -encode "ascii"`

- 4.2. If you want to insert the signature in unicode instead: `powershell -ExecutionPolicy Bypass -File .\INSERT_SIGN.PS1 -rom "C:\path\to\your\rom.bin" -encode "unicode"`

- 4.3. Optionally, you can specify an outuput file. If you don't, the script will create a new file with .signed added to the original name: `powershell -ExecutionPolicy Bypass -File .\INSERT_SIGN.PS1 -rom "C:\path\to\your\rom.bin" -output "C:\path\to\signed_rom.bin`

5. The script will search for a free block of **0x00** bytes inside the ROM and insert the string "VTECH" in the chosen encoding (ASCII or Unicode). V.Dream normally accepts both formats.

6. At the end, you will see one of these messages:
- ✅ Done: The signature was inserted and the patched file was saced.

- ❌ No free space: The ROM does not contain enough consecutive **0x00** bytes to insert the signature "VTECH".


## **=>** Corrupted image files Deleter for V.Dream v.1.0 `CORRUPTED_IMAGES_DELETER.PS1`:

### 💡 What is its purpose
Delete corrupted image files that prevent V.Dream from launching in v.1.0.

### 🛠️ How to use
1. Download the file ***CORRUPTED_IMAGES_DELETER.PS1*** to any folder on your computer if you installed V.Dream, or to the V.Dream folder if you are using the portable version.

2. Open Windows PowerShell.

3. Go to the folder where the script is located.

4. Run the script using this command: `powershell -ExecutionPolicy Bypass -File .\CORRUPTED_IMAGES_DELETER.PS1`

5. The script will delete all corrupted images found in your \covers folders (if they exist).


**© 2026 FODSOFT™. Néo Foderé de Frutos. All rights reserved.**
<!-- FODSOFT(TM). Neo Fodere de Frutos. All rights reserved. -->
