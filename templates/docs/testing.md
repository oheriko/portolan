# Testing Guidelines

## Philosophy
[TODO: Your testing approach]
- Test-driven development (TDD): [Yes/No/Sometimes]
- Testing pyramid: [Unit > Integration > E2E ratios]
- When to write tests: [Before code, after code, etc.]

## Test Structure

### Directory Layout
[TODO: Where tests live]
```
src/
  components/
    Button.tsx
    Button.test.tsx          # Unit tests
tests/
  integration/              # Integration tests
    api/
      users.test.ts
  e2e/                      # End-to-end tests
    user-journey.spec.ts
```

### Naming Conventions
[TODO: How to name test files and test cases]
- Test files: `*.test.ts` or `*.spec.ts`
- Test descriptions: `it('should do something when condition')`

## Running Tests

### Commands
```bash
npm test                    # All tests
npm test:unit              # Unit tests only
npm test:integration       # Integration tests only
npm test:e2e               # E2E tests only
npm test:watch             # Watch mode
npm test:coverage          # With coverage report
```

### CI/CD
[TODO: When tests run automatically]
- Pre-commit hook: [Yes/No]
- Pull request: [Required to pass]
- Before deployment: [Always/Sometimes]

## Coverage Requirements

### Targets
[TODO: Coverage expectations]
- Minimum overall coverage: [X%]
- Critical paths: [100%]
- New code: [X%]
- Branches: [X%]

### Exclusions
[TODO: What doesn't need coverage]
- Generated code
- Configuration files
- Type definitions

## Writing Tests

### Unit Tests
[TODO: Patterns and examples]

**What to test:**
- Individual functions/methods
- Component rendering
- Edge cases and error handling

**Example:**
```typescript
describe('formatCurrency', () => {
  it('should format positive numbers with dollar sign', () => {
    expect(formatCurrency(100)).toBe('$100.00');
  });

  it('should handle negative numbers', () => {
    expect(formatCurrency(-50)).toBe('-$50.00');
  });

  it('should throw error for invalid input', () => {
    expect(() => formatCurrency(NaN)).toThrow();
  });
});
```

### Integration Tests
[TODO: When and how to write integration tests]

**What to test:**
- API endpoints
- Database operations
- Multiple components working together

**Example:**
```typescript
describe('POST /api/users', () => {
  it('should create user and return 201', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ email: 'test@example.com' });

    expect(response.status).toBe(201);
    expect(response.body).toHaveProperty('id');
  });
});
```

### E2E Tests
[TODO: End-to-end testing approach]

**What to test:**
- Critical user journeys
- Multi-step workflows
- Cross-browser compatibility

**Tools:** [Playwright, Cypress, Selenium, etc.]

**Example:**
```typescript
test('user can sign up and login', async ({ page }) => {
  await page.goto('/signup');
  await page.fill('[name="email"]', 'test@example.com');
  await page.fill('[name="password"]', 'password123');
  await page.click('button[type="submit"]');

  await expect(page).toHaveURL('/dashboard');
});
```

## Mocking Strategy

### When to Mock
[TODO: Philosophy on mocking]
- External APIs: [Always/Sometimes]
- Database: [Unit tests only/Never]
- Time/dates: [When needed]

### How to Mock
[TODO: Tools and patterns]
- HTTP requests: [MSW, nock, etc.]
- Database: [In-memory, fixtures, etc.]
- Functions: [Jest.fn(), sinon, etc.]

**Example:**
```typescript
jest.mock('./api', () => ({
  fetchUser: jest.fn(() => Promise.resolve({ id: 1, name: 'Test' }))
}));
```

## Test Data

### Fixtures
[TODO: Where test data lives]
- Location: `tests/fixtures/`
- Format: [JSON, factories, builders]

### Factories
[TODO: How to generate test data]
```typescript
function createUser(overrides = {}) {
  return {
    id: faker.string.uuid(),
    email: faker.internet.email(),
    name: faker.person.fullName(),
    ...overrides
  };
}
```

## Testing Utilities

### Custom Matchers
[TODO: Project-specific test helpers]

### Helpers
[TODO: Common test utilities]
```typescript
// tests/helpers.ts
export async function setupTestDB() {
  // Database setup logic
}

export function createAuthToken(userId: string) {
  // Auth token generation
}
```

## Common Patterns

### Async Testing
[TODO: How to test async code]
```typescript
it('should fetch data', async () => {
  const data = await fetchData();
  expect(data).toBeDefined();
});
```

### Error Testing
[TODO: How to test error cases]
```typescript
it('should throw on invalid input', () => {
  expect(() => divide(10, 0)).toThrow('Division by zero');
});
```

### Component Testing
[TODO: UI component testing patterns]
```typescript
it('should render button with text', () => {
  render(<Button>Click me</Button>);
  expect(screen.getByText('Click me')).toBeInTheDocument();
});
```

## Performance Testing
[TODO: If applicable]
- Load testing: [tools, when to run]
- Benchmarking: [what to measure]

## Debugging Tests

### Failed Tests
[TODO: How to debug]
```bash
npm test -- --verbose
npm test -- --no-coverage  # Faster runs
npm test -- --runInBand     # Sequential execution
```

### VS Code Integration
[TODO: IDE setup if relevant]
- Use Jest extension
- Breakpoints work in debug mode

## Best Practices

### Do's
[TODO: Recommended practices]
- Write descriptive test names
- Test behavior, not implementation
- Keep tests independent
- Use arrange-act-assert pattern

### Don'ts
[TODO: Common pitfalls to avoid]
- Don't test framework code
- Don't share state between tests
- Don't make tests dependent on each other
- Don't over-mock

## For LLMs

When generating tests:
- Follow existing test patterns in the codebase
- Use descriptive test names that explain what's being tested
- Include edge cases and error scenarios
- Mock external dependencies appropriately
- Ensure tests are deterministic (no random data, fixed dates)
- Add comments for complex test setup
