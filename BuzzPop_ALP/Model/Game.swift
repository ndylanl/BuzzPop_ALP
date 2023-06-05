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
    @Published var filteredSongTitles: [Music] = []
    @Published var guessCount = 0
    @Published var guesses: [String] = []
    @Published var curPoints = 0
    @Published var correctAnswer = false
    @Published var lose = false
    @Published var streak = 0

    private var timer: Timer?

    
    override init() {
        self.listMusic = [
            Music(url: "Joji", title: "Slow Dancing In The Dark", artist: "Joji"),
            Music(url: "Tame Impala - The Less I Know The Better", title: "The Less I Know The Better", artist: "Tame Impala"),
            Music(url: "Franz Ferdinand - This Fire", title: "This Fire", artist: "Franz Ferdinand"),
            Music(url: "ZICO - Any Song", title: "Any Song", artist: "ZICO"),
            Music(url: "YOASOBI - Racing Into The Night", title: "Racing Into The Night", artist: "YOASOBI"),
            Music(url: "Doja Cat - Kiss Me More", title: "Kiss Me More", artist: "Doja Cat"),
            Music(url: "George Michael - Careless Whisper", title: "Careless Whisper", artist: "George Michael"),
            Music(url: "Hers - Harvey", title: "Harvey", artist: "Hers"),
            Music(url: "Labrinth - Jealous", title: "Jealous", artist: "Labrinth"),
            Music(url: "Rick Astley - Never Gonna Give You Up", title: "Never Gonna Give You Up", artist: "Rick Astley"),
            Music(url: "Coldplay - The Scientist", title: "The Scientist", artist: "Coldplay"),
            Music(url: "Smash Mouth - All Star", title: "All Star", artist: "Smash Mouth"),
            Music(url: "PinkPantheress Ice Spice - Boys a liar Pt 2", title: "Boys a liar Pt 2", artist: "PinkPantheress Ice Spice"),
            Music(url: "Doja Cat - Say So", title: "Say So", artist: "Doja Cat"),
            Music(url: "Radiohead -  Creep", title: "Creep", artist: "Radiohead"),
            Music(url: "Joseph Vincent - Cant Take My Eyes Off You Lyrics", title: "Cant Take My Eyes Off You Lyrics", artist: "Joseph Vincent"),

        ]
        curMusic = Music(url: "Tame Impala - The Less I Know The Better", title: "The Less I Know The Better", artist: "Tame Impala")
        super.init()
        initializeMusic()
    }
    
    func increaseDuration(amount: Int){
        if(duration >= 30){
            return
        }
        duration += amount
        pointsAwarded -= 10
    }
    
//    func awardPoints(user: User){
//        user.score += pointsAwarded
//    }
    
    func confirmNext(user: User){
        nextMusic()
        guesses.removeAll()
        curPoints += pointsAwarded
        user.score += pointsAwarded
        pointsAwarded = 100
        guessCount = 0
        streak += 1
    }
    
    func guessAnswer(guess: String){
        if(guess.isEmpty){
            return
        }
//        if(guess.lowercased() == curMusic.title.lowercased()){
//
//        }
        if(guess.lowercased().contains(curMusic.title.lowercased())){
            if(!isPlaying){
                audioPlayer?.currentTime = TimeInterval(duration)
                audioPlayer?.play()
            }
            duration = 40
            correctAnswer = true
        }else{
            guessCount += 1
            guesses.append(guess)
            pointsAwarded -= 20
            if(guessCount >= 5){
                lose = true
            }
        }
    }
    
    func loseGame(history: History){
        lose = false
        nextMusic()
        history.addScore(score: curPoints)
        history.addStreak(streak: streak)
        curPoints = 0
        pointsAwarded = 100
        guesses.removeAll()
        guessCount = 0
        streak = 0
    }
    
    func updateFilteredSongTitles(guess: String) {
        filteredSongTitles = listMusic.filter {
            $0.title.lowercased().contains(guess.lowercased()) ||
            $0.artist.lowercased().contains(guess.lowercased())
        }
    }
    
    func nextMusic(){
        audioPlayer?.pause()
        isPlaying = false
        duration = 5
        let id_music: Int = listMusic.firstIndex(where: {$0 == curMusic}) ?? 0
        if id_music == listMusic.count-1{
            curMusic = listMusic[0]
        }else{
            curMusic = listMusic[id_music + 1]
        }
        guard let songURL = Bundle.main.url(forResource: curMusic.url, withExtension: "mp3") else {
            print(curMusic.url)
            return}
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: songURL)
            audioPlayer?.prepareToPlay()

            // Start a timer to check the current time every second
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.checkPlaybackTime()
            }

            RunLoop.current.add(timer!, forMode: .common) // Add the timer to the current run loop
        } catch {
            print("Failed to play the audio: \(error.localizedDescription)")
        }
    }
    
    func initializeMusic(){
        listMusic.shuffle()
        curMusic = listMusic[0]
    }
    
    func playMusic(){
        if(isPlaying){
            audioPlayer?.pause()
            isPlaying = false
            print("defak")
        }else{
            isPlaying = true
            if(audioPlayer == nil ){
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
                print("woi")
            }else{
                audioPlayer?.play()
                print("kfnvk")
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
        guard let audioPlayer = audioPlayer else {
            return
        }

        // Check if the player has passed 5 seconds of play time
        if audioPlayer.currentTime >= Double(duration) {
            audioPlayer.pause() // Pause the audio playback
            audioPlayer.currentTime = 0.0
            timer?.invalidate() // Stop the timer
            isPlaying = false
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
