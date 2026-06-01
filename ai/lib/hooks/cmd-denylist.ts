import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { isToolCallEventType } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.on("tool_call", async (event) => {
    if (!isToolCallEventType("bash", event)) return;

    const command = event.input.command ?? "";

    if (/^(rm|ls|cat|head|tail|grep|rg|find|sed|awk|echo\ >)/.test(command)) {
      return {
        block: true,
        reason:
          "Use specialized tools instead of Bash for file operations: ls/find/read/grep/edit/write.",
      };
    }
  });
}