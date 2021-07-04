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
