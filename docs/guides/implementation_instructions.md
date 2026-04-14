# Implementation Instructions

## Core Process

All implementations in Keywe follow a consistent process:

1. **Create feature branches** according to phase documentation
2. **Work in feature branches** using Test-Driven Development (TDD)
3. **Update plan documents** to mark completed tasks
4. **Run all tests** to ensure everything works correctly
5. **Create pull requests** to merge changes to main branch

## Test-Driven Development (TDD) Approach

Each feature is implemented following these TDD steps:

1. **Write a failing test** that describes the desired behavior (very specific)
2. **Implement minimal code** to make the test pass
3. **Refactor** the implementation while keeping tests passing
4. **Repeat** until feature is complete

## Git Workflow Example

```bash
# Start feature branch
git checkout -b feat/keyboard-detection

# Implement with TDD
# - Write failing test
# - Implement minimal code to make test pass
# - Refactor while keeping tests passing

# Update plan document to mark task as completed
# Commit and push
git add .
git commit -m "feat: implement keyboard detection"
git push origin feat/keyboard-detection

# Create pull request to merge to main
```