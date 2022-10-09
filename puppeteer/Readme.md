# Tips and tricks

## To halt or delay execution of script

Use a custom promise function,

```javascript
function delay(time) {
   return new Promise(function(resolve) { 
       setTimeout(resolve, time)
   });
}
```

Then, call it whenever you want a delay.

```javascript
console.log('before waiting');
await delay(4000);
console.log('after waiting');
```

If you must use puppeteer use the builtin `waitForTimeout` function.

```javascript
await page.waitForTimeout(4000)
```

If you still want to use `page.evaluate`, resolve it after 4 seconds.

```javascript
await page.evaluate(async() => {
    await new Promise(function(resolve) { 
           setTimeout(resolve, 1000)
    });
});
```
