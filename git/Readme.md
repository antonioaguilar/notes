# Git commands and scripts

### Print git log

```
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git logline
```

### Enable local and remote branch push

```
git config push.default current
```

### Delete a local and remote branch

```
# delete the remote branch
git push origin --delete <branch-name> 

# delete the local branch 
git branch -D <branch-name>
```

### Change or fix previous commit messages (including author)

The first step is to identify the last "good" commit and provide its hash to the rebase command:

```
git rebase -i -p <commit-id>
```

Your default editor will open, requesting you to mark all the commits you want to change with the "edit" keyword. Git will now walk you through each commit, giving you the chance modify previous commits.

You can amend the commit now, with:

```
git commit --amend
```

Once you are satisfied with your changes, run:

```
git rebase --continue
```

You can now correct the author information and then continue to the next concerned commit object until you've edited all the commits you just marked:

```
git commit --amend --author="Antonio Aguilar <antonio@aguilar.org>" --no-edit

git rebase --continue
```

### Securely transfer a git repo 

```
# create the git bundle
git bundle create repo.bundle -b master

# encrypt the repo with password
openssl enc -blowfish -a -in repo.bundle -out output.txt

# decrypt the repo
openssl enc -d -blowfish -a -in output.txt -out repo.bundle

# unbundle the repo
git clone repo.bundle -b master
```

### Bundle a repo

```
# bundle the develop branch
git bundle create repo.bundle -b develop
```

```
# to unbundle the repo
git clone repo.bundle -b develop
```

### Store user credentails 

```
git config credential.helper store
```

in Mac OS:

```
git config --global credential.helper osxkeychain
```

### Reset branch changes

```
git reset --hard HEAD
```

