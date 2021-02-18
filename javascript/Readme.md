# JavaScript 

### Install `node_modules` in different folders

```bash 

mkdir ~/app1 ~/app2

cd ~/app1 && npm init -y && npm i -S jquery

cd ~/app2 && npm init -y && npm i -S lodash

# run npm install on folders

npm i --cwd ~/app1 --prefix ~/app1

npm i --cwd ~/app2 --prefix ~/app2
```

### Generate Random Hex Color

```
Math.floor(Math.random() * 16777215).toString(16).padStart(6, '0');
```
