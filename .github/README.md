# GitHub Actions local development with nekos/act
```sh
act <push,pull_request,schedule> # Call <> event
act -l # list job, event
act -W .github/workflows/pr.yaml # Run specific workflows
act -j deploy # Run specific jobs
```

# RELEASE MANAGEMENT
- Semantic Versioning
Follow SemVer to tag software releases
- Conventional Commits
Commit message with meaningful content gives the releases more declarative and informative
https://www.conventionalcommits.org/en/v1.0.0/
https://www.npmjs.com/package/git-cz
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```
- Standard Version
Perform software realese when everything is ready
standard-version --release-as minor # patch, major
standard-version --skip.bump --skip.commit --skip.tag

- Software Tagging
Standard version automatically create a corresponding tag locally
git push --follow-tags origin main



# Reference
https://www.arnica.io/blog/what-every-developer-should-know-about-github-codeowners