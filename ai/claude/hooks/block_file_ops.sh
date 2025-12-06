#!/bin/bash
# Block Bash file operation commands that should use specialized tools

command=$(jq -r '.tool_input.command' <<< "$HOOK_DATA")

# Commands that should use specialized tools instead
if [[ "$command" =~ ^(rm|ls|cat|head|tail|grep|rg|find|sed|awk|echo\ \>) ]]; then
    echo "❌ BLOCKED: Use specialized tools instead of Bash for file operations"
    echo ""
    echo "Use the right tool:"
    echo "  • Glob - instead of 'ls' or 'find'"
    echo "  • Read - instead of 'cat', 'head', 'tail'"
    echo "  • Grep - instead of 'grep' or 'rg'"
    echo "  • Edit/Write - instead of 'sed', 'awk', 'echo >'"
    exit 2
fi

exit 0
