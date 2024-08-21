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

## undo commit/add/local changed

### undo last git commit
git reset --soft HEAD~1
### undo git add
git reset <file wrongfully added and not committed>
## undo the not-added changes to last commit
git checkoout <file wrongfull edited and not added>

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

## git CA cert verification failed
the problem can be :
fatal: unable to access 'https://repo.or.cz/jimtcl.git/': server certificate verification failed. CAfile: none CRLfile: none
fatal: clone of 'https://repo.or.cz/jimtcl.git' into submodule path '/home/lcm/Desktop/pico/openocd/jimtcl' failed

-- how to solve:
https://stackoverflow.com/questions/35821245/github-server-certificate-verification-failed

## ignore ^M at the end of each line
https://stackoverflow.com/questions/1889559/make-git-diff-ignore-m
### Better yet, just save everything to lf
https://stackoverflow.com/questions/2332349/best-practices-for-cross-platform-git-config/2361321#2361321
https://markentier.tech/posts/2021/10/autocrlf-true-considered-harmful/

### mounting linux folder to windows causes problems:
https://www.reddit.com/r/git/comments/10dg36k/windows_carriage_return_m_showing_up_in_git_diff/

## .gitignore does not work because you previously has added things
https://stackoverflow.com/questions/25436312/gitignore-not-working

## if you already cloned a existing repo and want to add it to your own github repo, 
you still have to do this:
`
git submodule add https://github.com/CarloWood/XYZ.git foo/bar
`
however, git will detect your existing version and use the right one. 

## revert the change on one file
`git checkout <commit where you want to revert to> <path to the file>`
then commit

## git ignore
https://stackoverflow.com/questions/466764/git-command-to-show-which-specific-files-are-ignored-by-gitignore


## pull or push commits to another remote repo
1. use `git remote add <name> <URL>` to add another remote repo another than the one that you already use, give it a proper name.
2. use `git fetch <name>` to fetch all the commits belonging to this newly added repo.
3. use `git remote -v` to check out all the remote repos that you have added and their name.
4. use `git log <name>/<branch>` to see all the commits in more details
5. once you identify the commits that you wanna pull, use `git cherry-pick <commit id>` to pull that into your own. 

## change submodule's url 
https://stackoverflow.com/a/30885128/7244310
1. change .gitmodule file
2. `git submodule sync` to reflect that to the .git/config

## update the submodule
- If you want to modify other's repo, meanwhile, keeping them as submodules, then don't add the submodule from other's repo, you must fork. 
- After fork, you can change, and update the submodules as you want, and you can commit changes to the submodule's repos that you also own.
- However, you need to sync that to the main repo too. 
- Suppose, now you update your submodules, and commit and push to their own repos, then 
    1. cd to root,run `git submodule update --remote --merge`
    2. cd to the submodule, check out the main/master branch
    3. cd to the root, and add the new submodules
    4. commit and push the changes


