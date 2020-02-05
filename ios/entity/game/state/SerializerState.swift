//
//  SerializerState.swift
//  ios
//
//  Created by Matthew on 2/5/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import UIKit

//CANONICAL
class SerializerState {
    
    var white: Bool
    var offset: Int
    
    init(white: Bool){
        self.white = white
        self.offset = 7
        if(self.white){
            self.offset = 0
        }
    }
    
    func renderClient(state: [[String]]) -> [[Piece?]] {
        let rowA: [Piece?] = self.getPiece(row0: state[0])
        let rowB: [Piece?] = self.getPiece(row0: state[1])
        let rowC: [Piece?] = self.getPiece(row0: state[2])
        let rowD: [Piece?] = self.getPiece(row0: state[3])
        let rowE: [Piece?] = self.getPiece(row0: state[4])
        let rowF: [Piece?] = self.getPiece(row0: state[5])
        let rowG: [Piece?] = self.getPiece(row0: state[6])
        let rowH: [Piece?] = self.getPiece(row0: state[7])
        if(self.white){
            return [rowH, rowG, rowF, rowE, rowD, rowC, rowB, rowA]
        }
        return [rowA, rowB, rowC, rowD, rowE, rowF, rowG, rowH]
    }
    
    func getPiece(row0: [String]) -> [Piece?] {
        var row1: [Piece?] = [Piece?](repeating: nil, count: 8)
        for col0 in (0 ..< 8) {
            let col1: Int = abs(self.offset - col0)
            row1[col1] = self.getPiece(name: row0[col0])
        }
        return row1
    }
    
    func getPiece(name: String) -> Piece? {
        switch name {
            /***/
        case "KnightWhite":
            return KnightWhite()
        case "KnightBlack":
            return KnightBlack()
            /***/
        case "RookWhite":
            return RookWhite()
        case "RookBlack":
            return RookBlack()
            /***/
        case "PawnWhite":
            return PawnWhite()
        case "PawnBlack":
            return PawnBlack()
            /***/
        case "BishopWhite":
            return BishopWhite()
        case "BishopBlack":
            return BishopBlack()
            /***/
        case "QueenWhite":
            return QueenWhite()
        case "QueenBlack":
            return QueenBlack()
            /***/
        case "KingWhite":
            return KingWhite()
        case "KingBlack":
            return KingBlack()
            /***/
        default:
            return nil
        }
        
    }
    
    func renderServer(state: [[Piece?]]) -> [[String]] {
        var rowA: [String] = [String](repeating: "", count: 8) // 0
        var rowB: [String] = [String](repeating: "", count: 8) // 1
        var rowC: [String] = [String](repeating: "", count: 8) // 2
        var rowD: [String] = [String](repeating: "", count: 8) // 3
        var rowE: [String] = [String](repeating: "", count: 8) // 4
        var rowF: [String] = [String](repeating: "", count: 8) // 5
        var rowG: [String] = [String](repeating: "", count: 8) // 6
        var rowH: [String] = [String](repeating: "", count: 8) // 7
        for row0 in (0 ..< 8) {
            for col0 in (0 ..< 8) {
                let col1: Int = abs(self.offset - col0)
                let row1: Int = abs(self.offset - row0)
                
                rowA[col1] = getName(piece: state[row1][col1])
                rowB[col1] = getName(piece: state[row1][col1])
                rowC[col1] = getName(piece: state[row1][col1])
                rowD[col1] = getName(piece: state[row1][col1])
                rowE[col1] = getName(piece: state[row1][col1])
                rowF[col1] = getName(piece: state[row1][col1])
                rowG[col1] = getName(piece: state[row1][col1])
                rowH[col1] = getName(piece: state[row1][col1])
            }
        }
        if(self.white){
            return [rowH, rowG, rowF, rowE, rowD, rowC, rowB, rowA]
        }
        return [rowA, rowB, rowC, rowD, rowE, rowF, rowG, rowH]
    }
    
    func getName(piece: Piece?) -> String {
        if(piece == nil){
            return ""
        }
        return piece!.name
    }
    
}