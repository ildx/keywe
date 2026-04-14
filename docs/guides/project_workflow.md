# Keywe Project Guidelines

This document provides comprehensive guidelines for working with the Keywe project. These instructions are critical for ensuring that all implementations follow the established processes.

## Core Project Workflow

Keywe follows a phased, TDD-based development approach where:

1. Each phase has specific documentation in `docs/plans/`
2. Feature branches must be created according to phase documentation
3. Tasks in plan documents must be updated to mark completed steps
4. All development follows Test-Driven Development principles

## How to Work with This Repository

### 1. Consult Phase Documents

Before starting any work, consult the appropriate phase document in `docs/plans/` to understand:

- Feature branches that need to be created
- Tasks that need to be completed
- Correct implementation sequence

### 2. Create Feature Branches

Create feature branches with exact names specified in phase documentation:

```bash
git checkout -b feat/keyboard-detection
```

### 3. Implement with TDD

Follow the TDD cycle:

1. Write failing test describing desired behavior
2. Implement minimal code to make test pass
3. Refactor while keeping tests passing
4. Repeat until feature complete

### 4. Update Task Documentation

After implementing each task, update corresponding plan documents in `docs/plans/` to mark steps as completed with `[x]`.

### 5. Commit and Push

Commit and push changes to feature branch:

```bash
git add .
git commit -m "feat: implement keyboard detection"
git push origin feat/keyboard-detection
```

### 6. Create Pull Requests

Once feature implementation is complete, create pull requests to merge changes to main branch.
