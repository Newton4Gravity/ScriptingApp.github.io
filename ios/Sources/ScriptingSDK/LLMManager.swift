import Foundation

#if canImport(FoundationModels)
import FoundationModels
#endif

@MainActor
public final class LLMManager: NSObject {
    #if canImport(FoundationModels)
    @available(iOS 26.0, *)
    private var session: LanguageModelSession?
    #endif

    public static func isAvailable() -> Bool {
        #if canImport(FoundationModels)
        guard #available(iOS 26.0, *) else {
            return false
        }

        let model = SystemLanguageModel.default
        return model.isAvailable
        #else
        return false
        #endif
    }

    public func createSession() {
        #if canImport(FoundationModels)
        guard #available(iOS 26.0, *), Self.isAvailable() else {
            return
        }

        let model = SystemLanguageModel.default
        session = LanguageModelSession(model: model)
        #endif
    }

    @available(iOS 26.0, *)
    public func respond(prompt: String) async throws -> String {
        #if canImport(FoundationModels)
        guard let session else {
            return ""
        }

        let result = try await session.respond(to: prompt)
        return result.outputText
        #else
        return ""
        #endif
    }

    public func respond(_ prompt: String, completion: @escaping (NSString?, NSError?) -> Void) {
        guard #available(iOS 26.0, *) else {
            completion(nil, NSError(domain: "LLMManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "FoundationModels requires iOS 26+"]))
            return
        }

        Task {
            do {
                let output = try await respond(prompt: prompt)
                completion(output as NSString, nil)
            } catch {
                completion(nil, error as NSError)
            }
        }
    }
}
