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
The arose from a mistak I had the other day, when I was "git commit" without "git add".
Then when I diff, I saw no change, then I just "git add" then "git commit --amend".
Then "git push" complained that,"Your branch and 'origin/master' have diverged,".

Then I realized, the "git commit --amend" seems to screw up the last commit (which overwrites the HEAD in github), 
I guess github saw the commit I pushed, is not the child of the HEAD it has, 
that is why github reject my push.

Then I fixed this, by "git reset --sfot <the last commit on github>" , "git commit " again.
