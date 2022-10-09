# Tips and tricks

## To halt or delay execution of script

You can use one of the following options to wait for one second:

```javascript
await page.waitFor(1000);
await frame.waitFor(1000);
await new Promise(r => setTimeout(r, 1000));
```

Alternatively, there are many Puppeteer functions that include a built-in delay option, which may come in handy for waiting between certain events:

```javascript
// Click Delay
// Time to wait between mousedown and mouseup in milliseconds. Defaults to 0.

await page.click('#example', {delay: 1000});
await frame.click('#example', {delay: 1000});
await elementHandle.click({delay: 1000});
await page.mouse.click(0, 0, {delay: 1000});

// Type Delay
// Time to wait between key presses in milliseconds. Defaults to 0.

await page.type('#example', 'Hello, world!', {delay: 1000});
await frame.type('#example', 'Hello, world!', {delay: 1000});
await elementHandle.type('Hello, world!', {delay: 1000});
await page.keyboard.type('Hello, world!', {delay: 1000});

// Press Delay
// Time to wait between keydown and keyup in milliseconds. Defaults to 0.

await elementHandle.press('Backspace', {delay: 1000});
await page.keyboard.press('Backspace', {delay: 1000});
```

If you still want to use `page.evaluate`, resolve it after 4 seconds.

```javascript
await page.evaluate(async() => {
    await new Promise(function(resolve) { 
           setTimeout(resolve, 1000)
    });
});
```
