//
//  Karokee.swift
//  Speeki
//
//  Created by Abraham Bloom on 6/27/24.
//
import SwiftUI
import AVFoundation
import Speech

struct KaraokeView: View {
    let promptText = "This is an example text. Feel free to modify this message as desired. When you are prepared, press the Start Recording button and start reading. The text will highlight in sync with your speech, just like a genuine karaoke experience. Enjoy and express yourself!"

    @State private var currentWordIndex = 0
    @State private var isRecording = false
    @State private var audioEngine = AVAudioEngine()
    @State private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    @State private var recognitionTask: SFSpeechRecognitionTask?
    @State private var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    @State private var words: [String] = []
    @State private var lines: [[String]] = []
    @State private var debugText = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Karaoke")
                .font(.largeTitle)
                .padding()

            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(Array(lines.enumerated()), id: \.offset) { lineIndex, line in
                            HStack {
                                ForEach(Array(line.enumerated()), id: \.offset) { wordIndex, word in
                                    let globalIndex = lines[0..<lineIndex].reduce(0) { $0 + $1.count } + wordIndex
                                    Text(word)
                                        .foregroundColor(globalIndex == currentWordIndex ? .yellow : .primary)
                                        .background(globalIndex == currentWordIndex ? Color.blue.opacity(0.3) : Color.clear)
                                }
                            }
                            .id(lineIndex)
                        }
                    }
                    .padding()
                }
                .frame(height: 300)
                .border(Color.gray, width: 1)
                .onChange(of: currentWordIndex) { _ in
                    withAnimation {
                        let lineIndex = lines.firstIndex { line in
                            line.contains { word in
                                let globalIndex = words.firstIndex(of: word)!
                                return globalIndex == currentWordIndex
                            }
                        } ?? 0
                        scrollView.scrollTo(max(0, lineIndex - 1), anchor: .top)
                    }
                }
            }

            Button(action: {
                isRecording.toggle()
                if isRecording {
                    startRecording()
                } else {
                    stopRecording()
                }
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .padding()
                    .background(isRecording ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text("Debug: \(debugText)")
                .font(.footnote)
                .padding()
        }
        .padding()
        .onAppear {
            words = promptText.components(separatedBy: " ")
            lines = groupWordsIntoLines(words: words, maxLength: 40)
            debugText = "Words initialized with count: \(words.count), Lines: \(lines.count)"
        }
    }

    private func groupWordsIntoLines(words: [String], maxLength: Int) -> [[String]] {
        var lines: [[String]] = []
        var currentLine: [String] = []
        var currentLength = 0

        for word in words {
            if currentLength + word.count + (currentLine.isEmpty ? 0 : 1) <= maxLength {
                currentLine.append(word)
                currentLength += word.count + (currentLine.count > 1 ? 1 : 0)
            } else {
                lines.append(currentLine)
                currentLine = [word]
                currentLength = word.count
            }
        }

        if !currentLine.isEmpty {
            lines.append(currentLine)
        }

        return lines
    }

    private func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            debugText = "Audio session activated."
        } catch {
            debugText = "Failed to set up audio session: \(error.localizedDescription)"
            return
        }

        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.removeTap(onBus: 0)

        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            debugText = "Failed to create recognition request."
            return
        }
        recognitionRequest.shouldReportPartialResults = true

        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            recognitionRequest.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
            debugText = "Audio engine started."
        } catch {
            debugText = "Could not start audio engine: \(error.localizedDescription)"
            return
        }

        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            guard let result = result else {
                if let error = error {
                    self.debugText = "Recognition error: \(error.localizedDescription)"
                    return
                }
                return
            }
            let wordsSpoken = result.bestTranscription.segments.map { $0.substring.lowercased() }
            for word in wordsSpoken {
                if let index = self.words.firstIndex(of: word) {
                    DispatchQueue.main.async {
                        self.currentWordIndex = index
                        self.debugText = "Word \(word) recognized at index \(index)."
                    }
                }
            }
        })
    }

    private func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionTask?.cancel()
        recognitionTask = nil
        recognitionRequest = nil
        debugText = "Recording stopped."
    }
}

//struct ContentView: View {
//    var body: some View {
//        KaraokeView()
//    }
//}
//
