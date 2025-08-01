+++
title = "Fix: "Could not initialise OpenGL support" for GTK Apps on Fedora with NVIDIA/Wayland"
date = "2025-08-01"
tags = [
  "linux",
  "fedora",
  "guide",
  "bugfix",
  "OpenGL",
]
categories = [
  "linux",
]
+++

When using an NVIDIA GPU with proprietary drivers on a GNOME Wayland session, certain GTK-based applications fail to launch. They display an error dialog with the message:
`An error occurred. Could not initialise OpenGL support`

This commonly affects applications like GNOME Videos (Totem), the file previewer (`gnome-sushi`), and other modern GNOME apps.

The issue stems from an incompatibility between how modern GTK applications try to use desktop OpenGL (`gl`) and how NVIDIA's proprietary drivers handle it within a Wayland session. The solution is to force these applications to use OpenGL ES (`gles`), which is fully supported and stable in this configuration.
<!--more-->

#### Solution (System-Wide)

This method sets an environment variable for the entire system, fixing the issue for all affected GTK applications at once.

1.  **Create a new script file.** Open a terminal and use a text editor to create a file in `/etc/profile.d/`. Using `sudo` is required.

    ```bash
    sudo nano /etc/profile.d/nvidia-wayland-gl-fix.sh
    ```

2.  **Add the export command.** Add the following single line to the file:

    ```bash
    export GDK_GL=gles
    ```

3.  **Save and Reboot.** Save the file, exit the editor, and reboot your computer.

After rebooting, the environment variable `GDK_GL=gles` will be set for your session, and the affected applications will launch and function correctly.

---
#### Alternative: Per-Application Fix

If you prefer to only fix a single application, you can edit its `.desktop` launcher file.

1.  Copy the launcher to your user's local directory:
    ```bash
    cp /usr/share/applications/org.gnome.Totem.desktop ~/.local/share/applications/
    ```
2.  Edit the new file and find the line starting with `Exec=`.
3.  Prepend `env GDK_GL=gles` to the command. For example:
  *   **From:** `Exec=totem %U`
  *   **To:** `Exec=env GDK_GL=gles totem %U`
4.  Save the file and log out and back in.
