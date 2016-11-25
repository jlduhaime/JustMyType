//
//  TypingTest.swift
//  JustMyType
//
//  Created by Andrew on 10/12/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation

// TypeClass by Andrew and Andre
// string for current word

// getter and setter for the current word

// array of random words
// function to return a group of random words with a given size
// function to check if the current word was typed correctly
// function to advance to the next word
// function to grab a random word from an array
// function to shuffle around the source array and place into a new array

class TypingTest {
    
    var displayedWords: [String]    // holds current word in the test
    var total_words: Int    // hold total number of words typed
    var wordsToDisplayOnScreen: Int // Number of words to display on the screen

    var wordArray: [String]
    // test array
    
    init() {
        total_words = 0     // initialize total words typed to 0
        self.wordsToDisplayOnScreen = 5;
        self.displayedWords = [];
        
        let path = Bundle.main.path(forResource: "WordList", ofType: "txt")
        let data = try! String(contentsOfFile:path!, encoding: String.Encoding.utf8)
        self.wordArray = data.components(separatedBy: "\n")
        self.wordArray = self.wordArray.filter{$0 != ""} // filters out empty strings
      
        self.setDefaultDisplayedWords()
    }
    
    // Lauren Koulias
    func setDefaultDisplayedWords() {
        for _ in 1...self.wordsToDisplayOnScreen {
            _ = self.addRandomWordAndGetValue()
        }
    }
    
    // Lauren Koulias
    func getCurrentWord() -> String {   // gets word currently being displayed
        return self.displayedWords[0]
    }
    
    // Lauren Koulias
    func getsWordsToDisplay() -> String {   // gets word currently being displayed
        var wordsToDisplay = ""
        for word in self.displayedWords {
            wordsToDisplay += word + " "
        }
        
        return wordsToDisplay;
    }
    
    func getTotalWords() -> Int {
        return total_words
    }
    
    // Lauren Koulias
    func makeCurWordNextWord() {
        self.displayedWords.remove(at: 0); // Pop first word off array
        // Add a new word on
        _ = self.addRandomWordAndGetValue()
    }
    
    // Andre and Andrew
    func addRandomWordAndGetValue() -> String {    // gets a random word from the array to display
        //random number generation from size of the list of words
        let random = wordArray[Int(arc4random_uniform(UInt32(wordArray.count)))]
//        next_word = random       // sets the current displayed word to the randomly chosen word from array
        self.displayedWords.append(random)
        
        return random;
    }
    
    // Andre and Andrew
    func isCorrect(str: String) -> Bool {
        // true if user types correct word
        // and increments total words completed by 1
        
        // Trim whitespace - Lauren Koulias
        let trimmedString = str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines);
        
        if (trimmedString == getCurrentWord()) {
            total_words += 1
            return true
        }
        
        return false
    }
    
    func resetTotalWords() { // Andrew Berg
        total_words = 0
    }
    
    func calculateWPM(time: Int, totalSecs: Int) -> Double { // Andrew Berg
        let secsInMin = 60 // constant for seconds in a minute
        let WPM = round (100 * Double(getTotalWords())*(Double(secsInMin)/Double(totalSecs-time)))/100
        // calculates WPM rounded to two digits
        
        if (WPM.isNaN) {
            return 0.00
        }
        return WPM
    }
}





