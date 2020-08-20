//
//  NetworkClient.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class NetworkClient {
    
    static let shared = NetworkClient()
    let parser = ResponseParser()
    
    func createNewSession(completion: @escaping (Session?, String?) -> Void) {
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")!
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "token")
        request.httpMethod = "POST"
        let postString = "a=new_session"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                completion(nil, "Server error")
            }
            
            let optionalSession = self.parser.parseSession(response: data)
            guard let session = optionalSession else {
                completion(nil, "Parsing error")
                return
            }
            completion(session, nil)
        }
        task.resume()
    }
    
    func getEntries(completion: @escaping (Posts?, String?) -> Void) {
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")!
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "token")
        request.httpMethod = "POST"
        guard let session = UserDefaults.standard.string(forKey: "session") else {
            completion(nil, "Session error")
            return
        }
        let postString = "a=get_entries&session=\(session)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                completion(nil, "Server error")
            }
            
            let optionalPosts = self.parser.parsePosts(response: data)
            guard let posts = optionalPosts else {
                completion(nil, "Parsing error")
                return
            }
            completion(posts, nil)
        }
        task.resume()
    }
    
    
    func addEntry(entryText: String, completion: @escaping (AddingEntry?, String?) -> Void) {
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")!
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "token")
        request.httpMethod = "POST"
        guard let session = UserDefaults.standard.string(forKey: "session") else {
            completion(nil, "Session error")
            return
        }
        let postString = "a=add_entry&session=\(session)&body=\(entryText)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                completion(nil, "Server error")
            }
            
            let optionalAddingEntry = self.parser.parseAddingEntry(response: data)
            guard let addingEntry = optionalAddingEntry else {
                completion(nil, "Parsing error")
                return
            }
            completion(addingEntry, nil)
        }
        task.resume()
    }
        
}
