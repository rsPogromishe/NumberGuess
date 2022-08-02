//
//  Extensions.swift
//  NumberGuess
//
//  Created by Снытин Ростислав on 02.08.2022.
//

import Foundation

extension String {
  func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
      let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
      return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
  }
}
