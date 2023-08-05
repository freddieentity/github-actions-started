# GitHub Actions local development with nekos/act
```sh
act <push,pull_request,schedule> # Call <> event
act -l # list job, event
act -W .github/workflows/pr.yaml # Run specific workflows
act -j deploy # Run specific jobs
```

# RELEASE MANAGEMENT
- Semantic Versioning:

- Conventional Commits:
https://www.conventionalcommits.org/en/v1.0.0/
https://www.npmjs.com/package/git-cz
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```
- Standard Version:
standard-version --release-as minor