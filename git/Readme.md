# Git commands and scripts

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

