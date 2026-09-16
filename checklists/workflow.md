# Workflow checklists

Use these when practicing legitimate GitHub workflows in this lab.

## Opening an issue

- [ ] Title describes a specific, small improvement
- [ ] Body explains the problem and a proposed approach
- [ ] Labels (if used) match the work type
- [ ] Issue is closed promptly once the work is done

## Creating a pull request

- [ ] Branch name reflects the change (e.g. `improve-checklist`)
- [ ] Commit message explains *why*, not only *what*
- [ ] PR description summarizes the change and how to verify it
- [ ] No review requested unless a real collaborator will review

## Merging

- [ ] Diff is small and intentional
- [ ] CI (if any) is green or not required yet
- [ ] Merge method chosen deliberately (merge / squash / rebase)

## Pairing (real collaborators only)

- [ ] Second contributor is a real GitHub user who agreed to help
- [ ] Both people make meaningful commits on the same PR
- [ ] Co-authored-by trailer used only when accurate
## Verifying a change locally

- [ ] Run `pwsh ./scripts/validate-checklist.ps1` after editing the checklist
- [ ] Confirm the script prints OK before opening a pull request
- [ ] Link related issues in the PR description when applicable
