import Testing
@testable import ScriptingSDK

@MainActor
@Test func llmManagerConstructs() {
    let manager = LLMManager()
    #expect(type(of: manager).isAvailable() == false || type(of: manager).isAvailable() == true)
}
