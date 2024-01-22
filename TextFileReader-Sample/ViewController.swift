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
        fileTextLabel.text = readStrResource()
    }
    
    func readStrResource() -> String? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "DecodeSample.txt", ofType: nil) {
                let stringContent = try String(contentsOfFile: bundlePath)
                return stringContent
            }
        } catch {
            print(error)
        }
        return nil
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

