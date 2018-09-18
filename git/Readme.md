# Git commands and scripts

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

