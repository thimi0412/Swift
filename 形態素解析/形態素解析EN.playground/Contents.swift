//: Playground - noun: a place where people can play

import UIKit

var text = "Tadataka Ino traveled the whole country and made a journey of surveying"

// "ja" = 日本語
// "en" = 英語

let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"), options: 0)

tagger.string = text

var nounArray: [String] = []

tagger.enumerateTags(in: NSRange(location: 0, length: text.characters.count),scheme: NSLinguisticTagSchemeLexicalClass,options: [.omitWhitespace]) { tag, tokenRange, sentenceRange, stop in
                        
    let subString = (text as NSString).substring(with: tokenRange)
    print("\(subString) : \(tag)")
    if (tag == "Noun") {
        nounArray.append(subString)
    }
}
print("----------------------------")
for i in nounArray {
    print(i)
}
