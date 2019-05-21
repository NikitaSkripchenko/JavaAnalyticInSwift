//
//  main.swift
//  codeAnalysis
//
//  Created by iosdev on 5/19/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import Foundation


let home = FileManager.default.homeDirectoryForCurrentUser
let file = "file.txt"
let text = "text ds"

let fileURL = home.appendingPathComponent(file)

var classCount = 0

func readingTheFile(){
    do{
        let text2 = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = text2.split(separator:"\n")
        for line in lines {
            let word = line.split(separator: " ")
            if word.contains("class"){
                classCount += 1
            }
        }
    }catch{
    }
}

let fileManager = FileManager.default

var dirCount = 0
//globbing
do {
    let resourceKeys : [URLResourceKey] = [.isDirectoryKey]
    let testUrl = "Downloads/RozkladKPI-master"
    
    let url = home.appendingPathComponent(testUrl)
    let documentsURL = url
    let enumerator = FileManager.default.enumerator(at: documentsURL,
                                                    includingPropertiesForKeys: resourceKeys,
                                                    options: [.skipsHiddenFiles], errorHandler: { (url, error) -> Bool in
                                                        print("directoryEnumerator error at \(url): ", error)
                                                        return true
    })!
    
    for case let fileURL as URL in enumerator {
        let resourceValues = try fileURL.resourceValues(forKeys: Set(resourceKeys))
        if resourceValues.isDirectory! {
            dirCount+=1
        }else if (fileURL.absoluteString.contains(".java")) {
            readingTheFile()
        }
        //print(fileURL.path, resourceValues.isDirectory!)
    }
} catch {
    print(error)
}


print("dirs:\(dirCount) classes:\(classCount)")
