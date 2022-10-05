//
//  ReverseWordsModel.swift
//  reverseWords
//
//  Created by Елизавета Ефросинина on 20/07/2022.
//

import Foundation

class ReverseWordsViewModel {

    var charSet = CharacterSet()
    var customCharSet = CharacterSet()

    enum ReverseMode {
        case letters
        case custom
    }

    let lettersCharSet: CharacterSet = .letters
    var reverseMode: ReverseMode = .letters

    func reverse(input: String) -> String {
        switch reverseMode {
        case .custom:
            return reverseWords(in: input, charsToReverse: customCharSet.inverted)
        case .letters:
            return reverseWords(in: input, charsToReverse: lettersCharSet)
        }
    }

    func updateCharacterSet(from string: String) {
        customCharSet = CharacterSet(charactersIn: string)
    }
  
    private func reverseWords(in string: String, charsToReverse: CharacterSet) -> String {
        let words = string.components(separatedBy: " ")
        var reversedWords: [String] = []

        for word in words {
            reversedWords.append(reverseLetters(in: word, charSet: charsToReverse))
        }

        return reversedWords.joined(separator: " ")
    }

    private func reverseLetters(in string: String, charSet: CharacterSet) -> String {
        var array = Array(string)
        guard var startIndex = array.indices.first, var endIndex = array.indices.last else {
            return string
        }
        while startIndex < endIndex {
            if !array[startIndex].unicodeScalars.allSatisfy(charSet.contains(_:)) {
                startIndex += 1
            } else if !array[endIndex].unicodeScalars.allSatisfy(charSet.contains(_:)) {
                endIndex -= 1
            } else {
                array.swapAt(startIndex, endIndex)
                startIndex += 1
                endIndex -= 1
            }
        }
        return String(array)
    }
}
