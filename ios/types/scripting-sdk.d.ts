export class LLMManager {
  static isAvailable(): boolean
  createSession(): void
  respond(prompt: string): Promise<string>
}
