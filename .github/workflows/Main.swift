import UIKit
import ReplayKit
import Vision
import Translation

class TranslationManager: NSObject {
    static let shared = TranslationManager()
    func processFrame(pixelBuffer: CVPixelBuffer) {
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            let recognizedText = observations.compactMap { $0.topCandidates(1).first?.string }.joined(separator: " ")
            self.translateText(recognizedText)
        }
        request.recognitionLanguage = [.japanese, .english, .chinese]
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        try? handler.perform([request])
    }
    func translateText(_ text: String) {
        Task {
            let translator = TranslationSession()
            let response = try await translator.translate(text)
            print("Translated: \(response.targetText)")
        }
    }
}
