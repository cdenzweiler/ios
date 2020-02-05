//
//  Castle.swift
//  ios
//
//  Created by Matthew on 2/5/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import UIKit

class Castle {
    
    var transitioner: Transitioner?
    
    public func setTransitioner(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func opponentCoordinateList(kingCoordinate: [Int], state: [[Piece?]]) -> Array<[Int]> {
        var opponentCoordinateList = Array<[Int]>()
        //let tschessElementMatrix = gamestate.getTschessElementMatrix()
        let kingAffiliation = state[kingCoordinate[0]][kingCoordinate[1]]!.affiliation
        for i in (0 ..< 8) {
            for j in (0 ..< 8) {
                if(state[i][j] != nil){
                    if(state[i][j]!.affiliation != kingAffiliation) {
                        opponentCoordinateList.append([i,j])
                    }
                }
            }
        }
        //print("opponentCoordinateList: \(opponentCoordinateList)")
        return opponentCoordinateList
    }
    
    private func generateSearchSpace(proposed: [Int], affiliation: String) -> [[Int]]? {
        if(affiliation == "WHITE"){
            if(proposed == [7,6]){
                //print("kingSideWhite")
                return [[7,4], [7,5], [7,6]] //kingSideWhite
            }
            if(proposed == [7,2]){
                //print("queenSideWhite")
                return [[7,4], [7,3], [7,2]] //queenSideWhite
            }
        }
        if(affiliation == "BLACK"){
            if(proposed == [7,1]){
                //print("kingSideBlack")
                return [[7,3], [7,2], [7,1]] //kingSideBlack
            }
            if(proposed == [7,5]){
                //print("queenSideBlack")
                return [[7,3], [7,4], [7,5]] //queenSideBlack
            }
        }
        return nil
    }
    
    private func validateRookFirstTouch(proposed: [Int], state: [[Piece?]], affiliation: String) -> Bool {
        if(affiliation == "WHITE"){
            if(proposed == [7,6]){
                let candidateRook = state[7][7]
                if(candidateRook != nil){
                    if(!candidateRook!.name.contains("Rook")){
                        return false
                    } else {
                        return candidateRook!.firstTouch
                    }
                }
            }
            if(proposed == [7,2]){
                let candidateRook = state[7][0]
                if(candidateRook != nil){
                    if(!candidateRook!.name.contains("Rook")){
                        return false
                    } else {
                        return candidateRook!.firstTouch
                    }
                }
            }
        }
        if(affiliation == "BLACK"){
            if(proposed == [7,1]){
                let candidateRook = state[7][0]
                if(candidateRook != nil){
                    if(!candidateRook!.name.contains("Rook")){
                        return false
                    } else {
                        return candidateRook!.firstTouch
                    }
                }
            }
            if(proposed == [7,5]){
                let candidateRook = state[7][7]
                if(candidateRook != nil){
                    if(!candidateRook!.name.contains("Rook")){
                        return false
                    } else {
                        return candidateRook!.firstTouch
                    }
                }
            }
        }
        return false
    }
    
    private func validateKingFirstTouch(kingCoordinate: [Int], state: [[Piece?]]) -> Bool {
        let tschessElement = state[kingCoordinate[0]][kingCoordinate[1]]
        if(tschessElement != nil) {
            if(!state[kingCoordinate[0]][kingCoordinate[1]]!.name.contains("King")) {
                return false
            }
        }
        if(!tschessElement!.firstTouch){
            return false
        }
        return true
    }
    
    public func castle(kingCoordinate: [Int], proposed: [Int], state: [[Piece?]]) ->  Bool {
        if(kingCoordinate[0] != 7 || proposed[0] != 7){
            return false
        }
        //let tschessElementMatrix = gamestate.getTschessElementMatrix()
        let king = state[kingCoordinate[0]][kingCoordinate[1]]
        if(king == nil){
            return false
        }
        let affiliation = king!.affiliation
        let searchSpace = generateSearchSpace(proposed: proposed, affiliation: affiliation)
        
        if(!validateKingFirstTouch(kingCoordinate: kingCoordinate, state: state)){
            return false
        }
        if(!validateRookFirstTouch(proposed: proposed, state: state, affiliation: affiliation)){
            return false
        }
        let opponentCoordinateList = self.opponentCoordinateList(kingCoordinate: kingCoordinate, state: state)
        for opponentCoordinate in opponentCoordinateList {
            let opponent = state[opponentCoordinate[0]][opponentCoordinate[1]]!
            //print("opponent: \(opponent)")
            if(searchSpace != nil) {
                for space in searchSpace! {
                    if(opponent.validate(present: opponentCoordinate, proposed: space, state: state)) {
                        return false
                    }
                    if(space == kingCoordinate){
                        continue
                    }
                    let spaceOccupant = state[space[0]][space[1]]
                    if(spaceOccupant != nil){
                        if(spaceOccupant!.name != "LegalMove"){
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
    public func execute(coordinate: [Int], proposed: [Int], state: [[Piece?]]) -> Bool {
        if(coordinate[0] != 7 || proposed[0] != 7){
            return false
        }
        //var tschessElementMatrix = gamestate.getTschessElementMatrix()
        let tschessElement = state[coordinate[0]][coordinate[1]]
        if(tschessElement == nil){
            return false
        }
        if(!tschessElement!.name.contains("King")) {
            return false
        }
        let tschessElementProposed = state[proposed[0]][proposed[1]]
        if(tschessElementProposed == nil){
            return false
        }
        if(tschessElementProposed!.name != "LegalMove") {
            return false
        }
        let affiliation = tschessElement!.affiliation
        if(affiliation == "WHITE"){
            if(proposed == [7,6]){
                
                let rook = state[7][7]
                if(rook == nil){
                    return false
                }
                if(!rook!.name.contains("Rook")){
                    return false
                }
                
//                let imageDefault = tschessElement!.getImageDefault()
//                tschessElement!.setImageVisible(imageVisible: imageDefault)
//                state[7][6] = tschessElement
//                state[7][6]!.setFirstTouch(firstTouch: false)
//                state[coordinate[0]][coordinate[1]] = nil
//                state[7][5] = rook!
//                state[7][5]!.setFirstTouch(firstTouch: false)
//                state[7][7] = nil
//                gamestate.setTschessElementMatrix(tschessElementMatrix: state)
//                gamestate.setDrawProposer(drawProposer: "CASTLE")
//                gamestate.setHighlight(coords: [7,6,7,5])
                return true
                
            }
            if(proposed == [7,2]){
                
                let rook = state[7][0]
                if(rook == nil){
                    return false
                }
                if(!rook!.name.contains("Rook")){
                    return false
                }
//                let imageDefault = tschessElement!.getImageDefault()
//                tschessElement!.setImageVisible(imageVisible: imageDefault)
//                tschessElementMatrix[7][2] = tschessElement
//                tschessElementMatrix[7][2]!.setFirstTouch(firstTouch: false)
//                tschessElementMatrix[coordinate[0]][coordinate[1]] = nil
//                tschessElementMatrix[7][3] = rook!
//                tschessElementMatrix[7][3]!.setFirstTouch(firstTouch: false)
//                tschessElementMatrix[7][0] = nil
//                gamestate.setTschessElementMatrix(tschessElementMatrix: tschessElementMatrix)
//                gamestate.setDrawProposer(drawProposer: "CASTLE")
//                gamestate.setHighlight(coords: [7,3,7,2])
                return true
            }
        }
        if(affiliation == "BLACK"){
            if(proposed == [7,1]){
                
                let rook = state[7][0]
                if(rook == nil){
                    return false
                }
                if(!rook!.name.contains("Rook")){
                    return false
                }
//                let imageDefault = tschessElement!.getImageDefault()
//                tschessElement!.setImageVisible(imageVisible: imageDefault)
//                tschessElementMatrix[7][1] = tschessElement
//                tschessElementMatrix[7][1]!.setFirstTouch(firstTouch: false)
//                tschessElementMatrix[coordinate[0]][coordinate[1]] = nil
//                tschessElementMatrix[7][2] = rook!
//                tschessElementMatrix[7][2]!.setFirstTouch(firstTouch: false)
//                tschessElementMatrix[7][0] = nil
//                gamestate.setTschessElementMatrix(tschessElementMatrix: tschessElementMatrix)
//                gamestate.setDrawProposer(drawProposer: "CASTLE")
//                gamestate.setHighlight(coords: [7,2,7,1])
                return true
                
            }
            if(proposed == [7,5]){
                
                let rook = state[7][7]
                if(rook == nil){
                    return false
                }
                if(!rook!.name.contains("Rook")){
                   return false
                }
                
//                let imageDefault = tschessElement!.getImageDefault()
//                tschessElement!.setImageVisible(imageVisible: imageDefault)
//                tschessElementMatrix[7][5] = tschessElement
//                tschessElementMatrix[7][5]!.setFirstTouch(firstTouch: false)
//                tschessElementMatrix[coordinate[0]][coordinate[1]] = nil
//                tschessElementMatrix[7][4] = rook!
//                tschessElementMatrix[7][4]!.setFirstTouch(firstTouch: false)
//                tschessElementMatrix[7][7] = nil
//                gamestate.setTschessElementMatrix(tschessElementMatrix: tschessElementMatrix)
//                gamestate.setDrawProposer(drawProposer: "CASTLE")
//                gamestate.setHighlight(coords: [7,4,7,5])
                return true
            }
        }
        return false
    }
    
}
