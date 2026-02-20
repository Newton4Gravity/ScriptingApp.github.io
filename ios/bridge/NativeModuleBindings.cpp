// Example native module registration for host engines that expose JSContext.
// Keep this in sync with Sources/ScriptingSDK/JavaScriptBridge.swift.

#include "NativeModuleBindings.hpp"

void RegisterNativeModules(JSContext& jsContext) {
  jsContext.setObject(
    LLMManager::swiftClass(),
    "LLMManager"
  );
}
