//
//  ViewController.swift
//  TextFileReader-Sample
//
//  Created by Juan ceballos on 1/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fileTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fileTextLabel.text = readStrResource("DecodeSample.txt")
    }
    
    func readStrResource(_ fileName: String) -> String? {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: nil) {
                let stringContent = try String(contentsOfFile: bundlePath)
                return stringContent
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func tempFunc() {
        print()
    }
    
    func readStrDir() {
        let file = "SampleText.txt"
        let text = "Some Text"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print(text2)
            } catch {
                print(error)
            }
        }
    }
    
}

/*
 Part 1 - Coding Exercise: Decoding a Message from a Text File
 In this exercise, you will develop a function named decode(message_file). This function should read an encoded message from a .txt file and return its decoded version as a string.
 Note that you can write your code using any language and IDE you want (Python is preferred if possible, but not mandatory).
 Your function must be able to process an input file with the following format:
 3 love
 6 computers
 2 dogs
 4 cats
 1 I
 5 you
 In this file, each line contains a number followed by a word. The task is to decode a hidden message based on the arrangement of these numbers into a "pyramid" structure. The pyramid increases by one number per line, like so:
   1
  2 3
 4 5 6
 The key to decoding the message is to use the words corresponding to the numbers at the end of each pyramid line (in this example, 1, 3, and 6). You should ignore all the other words. So for the example input file above, the message words are:
 1: I
 3: love
 6: computers
 and your function should return the string "I love computers".
 Please submit the complete code for the decode function along with a brief explanation of how your code works:
 Your explanation should be written as a few sentences at minimum, please don't rely just on comments.
 */

