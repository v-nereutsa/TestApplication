//
//  ResponseParser.swift
//  TestApplication
//
//  Created by Владимир Нереуца on 20.08.2020.
//  Copyright © 2020 Владимир Нереуца. All rights reserved.
//

import Foundation

class ResponseParser {
    
    func parsePosts(response: Data) -> Posts? {
        do {
           let decoder = JSONDecoder()
           let response = try decoder.decode(Posts.self, from: response)
            return response
        } catch {
            return nil
        }
    }
    
    func parseAddingEntry(response: Data) -> AddingEntry? {
        do {
           let decoder = JSONDecoder()
           let response = try decoder.decode(AddingEntry.self, from: response)
            return response
        } catch {
            return nil
        }
    }
    
    func parseSession(response: Data) -> Session? {
        do {
           let decoder = JSONDecoder()
           let response = try decoder.decode(Session.self, from: response)
            return response
        } catch {
            return nil
        }
    }
    
}
