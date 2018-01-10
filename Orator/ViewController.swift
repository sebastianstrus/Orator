//
//  ViewController.swift
//  Orator
//
//  Created by Sebastian Strus on 2018-01-10.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fileName = "words"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("File Path: \(fileURL.path)")
        
        let writeString = "Write this text to the file in Swift"
        do {
            //write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL")
            print(error)
        }
        
        var readString = ""
        do {
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed to read file")
            print(error)
        }
        
        print("Content of the file: \(readString)")
        
        let fileURLProject = Bundle.main.path(forResource: "test", ofType: "txt")
        var readStringProject = ""
        var myStrings = [""]
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
            myStrings = readStringProject.components(separatedBy: .newlines)
            print(myStrings)
        } catch let error as NSError {
            print("Failed to read from project")
            print(error)
        }
        print(readStringProject)
        print("myStrings:")
        print(myStrings)
        
        
        /*
         var x: String = "abc\ndef"
         var y = x.componentsSeparatedByString("\n")
         // y is now a [String]: ["abc", "def"]
        */
        
        
    }

    


}

