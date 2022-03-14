//
//  PhotoManager.swift
//  SelfNewsApiMaking
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import SwiftUI

class PhotoManager {
    
    static let instance = PhotoManager()
    let folderName : String = "downloaded_pictures"
    
    private init() {
        createFolderIfNeeded()
    }
    
    func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    } // 폴더가 없는 경우 캐시폴더를 생성해준다.
    
    func createFolderIfNeeded() {
        
        guard let url = getFolderPath() else {return}
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try! FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("Create folders")
            } catch let error{
                print("Error creating folders")
            }
        }
    }
    
    func getImagePath(key : String) -> URL? {
        
        guard let folder = getFolderPath() else {
            return nil
        }
        return folder.appendingPathComponent(key + ".png")
        //이미지 저장 경로와 저장형태를 정해준다.
    }
    
    func add(key: String, value: UIImage) {
        guard let data = value.pngData(),
              let url = getImagePath(key: key) else {return}
        do {
            try data.write(to: url)
        } catch {
            print("error to save the file")
        }
    }
    
    func get(key : String) -> UIImage? {
        guard let url = getImagePath(key: key),
                FileManager
            .default
            .fileExists(atPath: url.path) else {
                return nil
            }
        return UIImage(contentsOfFile: url.path)
    }
    
    
    
    
}

