# ScriptingSDK (iOS 26+)

This Swift package is Xcode-ready and can be opened directly with:

```bash
open ios/Package.swift
```

## Apple Intelligence integration

- `LLMManager` wraps `FoundationModels` (`SystemLanguageModel`, `LanguageModelSession`).
- `NativeModuleBindings.install(into:)` registers `LLMManager` in a `JavaScriptCore.JSContext`.
- TypeScript declaration lives at `ios/types/scripting-sdk.d.ts`.

## JavaScript usage

```javascript
const mgr = new LLMManager()
mgr.createSession()

// Callback bridge shape: (result, error)
mgr.respond("Hello!", (result, error) => {
  if (error) {
    console.error(error)
  } else {
    console.log(result)
  }
})
```

## Device validation checklist

1. Build on Xcode with an iOS 26+ deployment target.
2. Run on a real Apple Intelligence-capable device.
3. Verify `LLMManager.isAvailable()` returns `true` before creating sessions.
