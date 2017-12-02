# Before you post this:

Manage Scheme > Share Scheme
Edit the main Scheme
Test -> Post-Actions -> Add Run Script Action
Choose Provide build settings from man project

```
LOG_PATH=`echo "${BUILD_DIR}" | sed "s/Build\/Products/Logs\/Test/"`
"${SRCROOT}/test_runner.sh" "$LOG_PATH" "${SRCROOT}"
```
DELETE THIS WHEN YOU DO THIS

# <%= project_name %>

## Instructions

## Advanced

## Hints
