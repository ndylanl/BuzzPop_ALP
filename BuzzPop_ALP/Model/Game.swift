//
//  Game.swift
//  BuzzPop_ALP
//
//  Created by MacBook Pro on 09/05/23.
//

import Foundation
import AVFoundation

class Game: NSObject, ObservableObject {
    @Published var listMusic: [Music]
    @Published var duration = 5
    @Published var pointsAwarded = 100
    @Published var curMusic: Music
    @Published var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var curTime = "00:00"
    private var timer: Timer?

    
    override init() {
        self.listMusic = [
            Music(url: "Joji", title: "Slow Dancing In The Dark", artist: "Joji"),
            Music(url: "Tame Impala - The Less I Know The Better", title: "The Less I Know The Better", artist: "Tame Impala"),
            Music(url: "Franz Ferdinand - This Fire", title: "This Fire", artist: "Franz Ferdinand"),
        ]
        curMusic = Music(url: "Tame Impala - The Less I Know The Better.mp3", title: "The Less I Know The Better", artist: "Tame Impala")
        super.init()
        initializeMusic()
    }
    
    func increaseDuration(amount: Int){
        duration += amount
    }
    
    func awardPoints(user: User){
        user.score += pointsAwarded
    }
    
    func guessAnswer(){
        
    }
    
    func initializeMusic(){
        listMusic.shuffle()
        curMusic = listMusic[0]
    }
    
    func playMusic(){
        if(isPlaying){
            audioPlayer?.pause()
            isPlaying = false
        }else{
            isPlaying = true
            if(audioPlayer == nil){
                // Initialize the audio player with the song's URL
                guard let songURL = Bundle.main.url(forResource: curMusic.url, withExtension: "mp3") else {
                    print(curMusic.url)
                    return
                }
                
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: songURL)
                    audioPlayer?.prepareToPlay()
                    audioPlayer?.play()

                    // Start a timer to check the current time every second
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                        self?.checkPlaybackTime()
                    }

                    RunLoop.current.add(timer!, forMode: .common) // Add the timer to the current run loop
                } catch {
                    print("Failed to play the audio: \(error.localizedDescription)")
                }
            }else{
                audioPlayer?.play()
            }
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    // Start updating the current time periodically
    func startUpdatingCurrentTime() {
        stopUpdatingCurrentTime() // Stop the timer if it's already running

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.checkPlaybackTime()
        }
    }
    
    private func checkPlaybackTime() {
        print("bangsat")
        guard let audioPlayer = audioPlayer else {
            return
        }

        // Check if the player has passed 5 seconds of play time
        if audioPlayer.currentTime >= 5.0 {
            audioPlayer.pause() // Pause the audio playback
            timer?.invalidate() // Stop the timer
        }

        updateCurrentTime()
    }

    // Stop updating the current time
    func stopUpdatingCurrentTime() {
        timer?.invalidate()
        timer = nil
    }

    // Update the current time using the audio player's current time
    private func updateCurrentTime() {
        guard let audioPlayer = audioPlayer else {
            return
        }
        curTime = formatTime(audioPlayer.currentTime)

    }
}
