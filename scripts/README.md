# V.Dream Helper Scripts
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
