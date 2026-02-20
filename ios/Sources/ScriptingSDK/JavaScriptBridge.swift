import Foundation

#if canImport(JavaScriptCore)
import JavaScriptCore

@objc public protocol LLMManagerJSExports: JSExport {
    static func isAvailable() -> Bool
    func createSession()
    func respond(_ prompt: String, _ completion: JSValue)
}

extension LLMManager: LLMManagerJSExports {
    public func respond(_ prompt: String, _ completion: JSValue) {
        respond(prompt) { output, error in
            if let error {
                completion.call(withArguments: [NSNull(), error.localizedDescription])
            } else {
                completion.call(withArguments: [output ?? "", NSNull()])
            }
        }
    }
}

public enum NativeModuleBindings {
    /// Registers `LLMManager` into the JavaScript context as a globally accessible constructor.
    public static func install(into jsContext: JSContext) {
        jsContext.setObject(LLMManager.self, forKeyedSubscript: "LLMManager" as NSString)
    }
}
#endif
