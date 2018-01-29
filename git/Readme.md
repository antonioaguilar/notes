# Git commands and scripts

### Bundle a repo

```
# bundle the develop branch
git bundle create repo-name.bundle -b develop
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

