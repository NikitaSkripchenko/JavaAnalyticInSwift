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

var NOC:    Int = 0//classes -- done
var NOM:    Int = 0// methods
var NProtM: Int = 0// protected methods
var NOPA:   Int = 0// public attr

let SPACE                     = "(\\s)*"
let IDENTIFIER                = "(\\w|_|\\$)+"
let MODIFIERS                 = "(public|private|protected)"
let PARAMETERS                = "(\\(([^)]+)\\))"
let ANNOTATION                = "@($\(IDENTIFIER))($\(SPACE)($\(PARAMETERS))?$\(SPACE)"
let ANNOTATIONS               = "($\(ANNOTATION))+"
let ASSIGNMENT                = "(?:(\\s)*=(?:[^;])*;(\\s)*)"
let VARIABLE_OR_METHOD_REGEXP = MODIFIERS + SPACE + IDENTIFIER + SPACE + IDENTIFIER + PARAMETERS
let NON_EMPTY_SPACE           = "(\\s)+"
let PACKAGEIDENTIFIER         = "(\\w|_|\\$|\\.)+"
let packageRegExp             = "\\b(package)$\(NON_EMPTY_SPACE)($\(PACKAGEIDENTIFIER))(;|\\b)"
let CLASS_REGEXP              =  MODIFIERS + "?(class)"
let STRING_REGEXP = #""(.)*""#



let str = """
public class MyClass {
public void myMethod(sd sfsd) {
// code to be executed
}
public void myMethod(sd sfsd) {
// code to be executed
}
public void myMethod(sd sfsd) {
// code to be executed
}

}
"""


let regex = try NSRegularExpression(pattern: VARIABLE_OR_METHOD_REGEXP, options: [])
print(regex)
let nsrange = NSRange(str.startIndex..<str.endIndex, in: str)
let result = regex.matches(in: str, options: [], range: nsrange)
print(result.count)


func readingTheFile(){
    do{
        let text2 = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = text2.split(separator:"\n")
        for line in lines {
            let word = line.split(separator: " ")
            if word.contains("class"){
                NOC += 1
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




//print("dirs:\(dirCount) classes:\(NOC)")
