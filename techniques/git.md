## git add/git commit
https://medium.com/@shalithasuranga/how-does-git-work-internally-7c36dcb1f2cf
## git rm without deleting file

So, for a single file:
```
git rm --cached mylogfile.log
```
and for a single directory:
```
git rm --cached -r mydirectory
```

## git reset

### undo git commit
git reset HEAD~
### undo git add
git reset <file added wrongfully>

The arose from a mistak I had the other day, when I was "git commit" without "git add".
Then when I diff, I saw no change, then I just "git add" then "git commit --amend".
Then "git push" complained that,"Your branch and 'origin/master' have diverged,".

Then I realized, the "git commit --amend" seems to screw up the last commit (which overwrites the HEAD in github), 
I found this out because when I "git log", I didn't see the commit message I just wrote, but the commit message of the one that's in github,
I guess github saw the commit I pushed, is not the child of the HEAD it has, 
that is why github reject my push.

Then I fixed this, by "git reset --sfot <the last commit on github>" , "git commit " again.

## git bisect
https://www.youtube.com/watch?v=P3ZR_s3NFvM

## git clear history
https://gist.github.com/stephenhardy/5470814

This might be problematic with repositories with git submodules.
I believe the recipe in this SO answer is a safer way: https://stackoverflow.com/a/13102849

git checkout --orphan newBranch
git add -A  # Add all files and commit them
git commit
git branch -D master  # Deletes the master branch
git branch -m master  # Rename the current branch to master
git push -f origin master  # Force push master branch to github
git gc --aggressive --prune=all     # remove the old files
