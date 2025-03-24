# NodeJS 

## Handling graceful shutdown of NodeJS programs

Using the short syntax:

```javascript
['SIGINT', 'SIGTERM', 'SIGQUIT'].forEach(signal => process.on(signal, () => {
  // perform clean up, disconnections, etc
  console.log('shutting down gracefully...');
  process.exit();
}));
```

Using the expanded syntax:

```javascript
const shutdown = () => {
  // perform clean up, disconnections, etc
  console.log('shutting down gracefully...');
  process.exit();
}

process.on('SIGTERM', shutdown);
process.on('SIGINT', shutdown);
```

## Simple ExpressJS server

```javascript
import { random } from 'lodash';
import express from 'express';

const app = express();

// make the server friendly to HTTP proxies
app.disable('x-powered-by');
app.enable('trust proxy');

// only accept JSON content type
app.use(express.json({ limit: '512kb' }));

// simple GET endpoint
app.get('/api/user/random', (req, res) => {
  const payload = {
    message: `hello user id=${random(1000, 1010)}`,
    timestamp: Date.now()
  };
  res.json(payload);
});

// simple Customer type
type Customer = {
  name: string;
  account: string;
}

// simple POST endpoint with parameters and Type checks
app.post("/customer/:id/", async (req, res) => {
  const { id } = req.params;
  const { name, account } = req.body as Customer;

  // verify customer
  const result = await verifyCustomer(id, name, account);
  console.log('Customer verified', result);

  return res.status(201).end();
})

// simple POST endpoint
app.post('/api/auth/service', async (req, res) => {
  const { username, password } = req.body as UserCredentials;

  try {
    const response = await authUser(username, password);
    res.json({ response });
  } catch (error) {
    res.status(401).end();
  }
});

app.listen(8080);
```

## Testing Patterns

> We are using the Vitest testing library

For `async-await` simply compare the returned data using `expect(result).toBe(...)`, for promises, use `.resolves.toBe(...)` or `.rejects.toBe(...)`:

```javascript
it('async test', async () => {
  const result = await fetchData();
  expect(result).toBe('data');
});

it('promise test', () => {
  return expect(Promise.resolve('data')).resolves.toBe('data');
});
```

When using `async-await` and returning an Error inside the `try-catch` use:

```javascript
it('async error', async () => {
  await expect(Promise.reject('error')).rejects.toMatch('error');
});
```

Testing an async-await with returned data:

```javascript
// Function to test
async function getUserProfile(id) {
  const response = await fetch(`/api/users/${id}`);
  return response.json();
}

// Test case using async/await
it('getUserProfile fetches correct user', async () => {
  const profile = await getUserProfile(1);
  expect(profile.name).toBe('John Doe');
});
```

Testing a promise with returned data:

```javascript
// Function to test
function fetchUserData() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve({ id: 1, name: 'John Doe' });
    }, 1000);
  });
}

// Test case
it('fetchUserData returns user object', () => {
  return fetchUserData().then(data => {
    expect(data).toEqual({ id: 1, name: 'John Doe' });
  });
});
```

## Testing Methods with Timers

```javascript
import { vi } from 'vitest';

function delayedOperation() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('Operation completed');
    }, 5000);
  });
}

it('handles delayed operations', async () => {
  // Mock timer functions
  vi.useFakeTimers();

  const promise = delayedOperation();

  // Fast-forward time
  vi.runAllTimers();

  const result = await promise;
  expect(result).toBe('Operation completed');

  // Restore timer functions
  vi.useRealTimers();
});
```

## Testing with specific returned Errors

```javascript
async function fetchData() {
  throw new Error('Network error');
}

it('handles fetch errors correctly', async () => {
  await expect(async () => {
    await fetchData();
  }).rejects.toThrow('Network error');
});
```

## Testing with Mock functions

```javascript
async function processUserData(userId) {
  const user = await fetchUser(userId);
  const permissions = await fetchPermissions(userId);
  return { user, permissions };
}

it('processes user data correctly', async () => {

  // './api' is the imported module to mock
  // this mocks the method processUserData()
  vi.mock('./api', () => ({
    fetchUser: vi.fn().mockResolvedValue({ id: 1, name: 'John' }),
    fetchPermissions: vi.fn().mockResolvedValue(['read', 'write'])
  }));

  const result = await processUserData(1);

  expect(result).toEqual({
    user: { id: 1, name: 'John' },
    permissions: ['read', 'write']
  });
});
```
