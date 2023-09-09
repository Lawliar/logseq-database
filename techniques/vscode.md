## exclude folder from search
there are two types of settings generally:
1. user-wide setting, which is applied to all workspaces opened by the current user.
2. workspace setting, which is applied only to the workspace opened for the specific folder.

I guess the former writes the specified setting to the user's home directory
the latter writes to .vscode/settings.json in the current folder.

Said these, just open File->Preferences->Settings, and add folder you want to exclude when searching
Remember to specify whether this setting is applied to the user or one specific workspace.

For the current workspace though, you can just type down the folders you want to exluce at the search sidebar.
It will survive even you close that editor(did not see any conf written into .vscode though, not sure how this works)

https://stackoverflow.com/questions/29971600/choose-folders-to-be-ignored-during-search-in-vs-code

## multi screen 
at command exploration, choose duplicate workspace
https://stackoverflow.com/questions/47260995/visual-studio-code-tabs-editors-of-the-same-project-in-multiple-screens

## remote development environment
There are cases where the environments are installed in a localized folder.
For example, although I mapped a folder from my ubuntu machine to my WSL2 through a cable, (e.g., "/home/lcm/github")
but, say, a virtualenv, install a virtual environment into a local folder that is not mapped (e.g., "/home/lcm/.virtualenv"), 
so you cannot use this virtual env from your windows machine, 
What do you do for this case?

So, first, use the remote-ssh plugin to connect the VScode (on windows) to your ubuntu machine through ssh.
Then in the new windows, you open the folder that you want to develop in the ubuntu machine. 
(make sure in your VSCode windows, it's still SSH:xx.xx.xx.xx).
Then everything you do (files you open, configuration you did, are passed to the ubuntu machine, (it is like you are operating on the ubuntu machine)).

Then
`ctrl + ,` search for "venv"
add "~/.virtualenv" to "venv folders" and "venv path", then you are good to go!

"remote-ssh" is really useful!

### remote-ssh promt passphrase multiple times then login failed
1. I tried to delete ~/.vscode-server from the remote machine as suggesteed here, but no good https://github.com/microsoft/vscode-remote-release/issues/2518
2. then I guess, this problem is because, I disabled password login from my remote machine (only allowing pubkey), but I don't have ssh-agent running. So I followed this https://code.visualstudio.com/docs/remote/troubleshooting#_enabling-alternate-ssh-authentication-methods to disable useLocalServer and configure ControlMaster. Then it finally worked.

### Opened tabs for same folder but in different environments
So when you work on some folder, vscode will memorize the opened tabs when you last close the workspace.
But as I mounted a folder from my remote ubuntu machine to my WSL.
When I open the same folder inside the mounted folder, from different host (i.e., one remote ubuntu, another one WSL), the memorized tabs are different, this is pretty amazing.