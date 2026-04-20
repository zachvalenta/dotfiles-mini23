#!/bin/bash
# Block Bash file operation commands that should use specialized tools

input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // empty')

if [[ "$command" =~ ^(rm|ls|cat|head|tail|grep|rg|find|sed|awk|echo\ \>) ]]; then
    echo "❌ BLOCKED: Use specialized tools instead of Bash for file operations" >&2
    exit 2
fi

exit 0
