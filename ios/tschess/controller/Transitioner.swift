//
//  Transitioner.swift
//  ios
//
//  Created by Matthew on 2/5/20.
//  Copyright © 2020 bahlsenwitz. All rights reserved.
//

import UIKit

class Transitioner {
    
    var coordinate: [Int]?
    
    public func getCoordinate() -> [Int]? {
        return coordinate
    }
    
    public func clearCoordinate() {
        self.coordinate = nil
    }
    
    public func movable(square: Piece?) -> Bool {
        if(square == nil){
            return false
        }
        if(square!.isTarget){
            return true
        }
        if(square!.name == "PieceAnte"){
            return true
        }
        return false
    }
    
    public func validMove(propose: [Int], state0: [[Piece?]]) -> Bool {
        var state1 = state0
        let squarePresent = state1[self.coordinate![0]][self.coordinate![1]]
        let squarePropose = state1[propose[0]][propose[1]]
        if(self.movable(square: squarePropose)){
            state1[self.coordinate![0]][self.coordinate![1]] = nil
            state1[propose[0]][propose[1]] = squarePresent
            return true
        }
        return false
    }
    
    public func deselectHighlight(state0: [[Piece?]]) -> [[Piece?]] {
        var state1 = state0
        for i in (0 ..< 8) {
            for j in (0 ..< 8) {
                let square = state1[self.coordinate![0]][self.coordinate![1]]
                if(square != nil){
                    if(square!.name == "PieceAnte"){
                        state1[i][j] = nil
                    }
                }
            }
        }
        let imageDefault = state1[self.coordinate![0]][self.coordinate![1]]!.getImageDefault()
        state1[self.coordinate![0]][self.coordinate![1]]!.setImageVisible(imageVisible: imageDefault)
        self.coordinate = nil
        return state1
    }
    
    public func evaluateHighlightSelection(coordinate: [Int], state0: [[Piece?]]) -> [[Piece?]] {
        if(self.invalid(coordinate: coordinate, state: state0)){
            if(self.coordinate == nil){
                return state0
            }
            var state1 = state0
            for i in (0 ..< 8) {
                for j in (0 ..< 8) {
                    let square = state1[self.coordinate![0]][self.coordinate![1]]
                    if(square != nil){
                        if(square!.name == "PieceAnte"){
                            state1[i][j] = nil
                        }
                    }
                }
            }
            let imageDefault = state1[self.coordinate![0]][self.coordinate![1]]!.getImageDefault()
            state1[self.coordinate![0]][self.coordinate![1]]!.setImageVisible(imageVisible: imageDefault)
            self.coordinate = nil
            return state1
        }
        if(self.coordinate == nil){
            var state1 = state0
            self.coordinate = coordinate
            let imageSelection = state1[self.coordinate![0]][self.coordinate![1]]!.getImageSelection()
            state1[self.coordinate![0]][self.coordinate![1]]!.setImageVisible(imageVisible: imageSelection)
            for i in (0 ..< 8) {
                for j in (0 ..< 8) {
                    let piece = state1[self.coordinate![0]][self.coordinate![1]]!
                    if(piece.validate(present: coordinate, proposed: [i,j], state: state1)){
                        state1[i][j] = PieceAnte()
                    }
                }
            }
            return state1
        }
        //Processor().execute(present: self.coordinate!, proposed: coordinate, state: state)
        //Highlighter().restoreSelection(coordinate: coordinate, state: state)
        //Highlighter().neutralize(state: state)
        
        //gamestate.setHighlight(coords: [self.coordinate![0],self.coordinate![1],coordinate[0],coordinate[1]])
        
        //self.coordinate = nil
        //self.setLastMove(state: state)
        //self.evaluateCheckMate(state: state)
        
        //gamestate.changeTurn()
        //gamestate.setUpdated(updated: dateTime.currentDateString())
        //gamestate.setDrawProposer(drawProposer: "NONE")
        //let requestUpdate = GamestateSerializer().execute(gamestate: gamestate)
        //UpdateGamestate().execute(requestPayload: requestUpdate)
        //gamestate.setHighlight(coords: nil)
        
        
        return state0
    }
    
    private func invalid(coordinate: [Int], state: [[Piece?]]) -> Bool {
        if(self.coordinate != nil){
            if(self.coordinate! == coordinate){
                return true
            }
        }
        let tschessElement = state[coordinate[0]][coordinate[1]]
        if(self.coordinate == nil){
            if(tschessElement == nil){
                self.flash()
                return true
            }
            if(self.white){
                if(tschessElement!.affiliation != "WHITE"){
                    print("A")
                    self.flash()
                    return true
                }
            } else {
                if(tschessElement!.affiliation != "BLACK"){
                    print("B")
                    self.flash()
                    return true
                }
            }
        }
        //if(!Processor().validateElement(candidate: tschessElement)){
        //return true
        //}
        return false
    }
    
    private func setLastMove(state: [[Piece?]]) {
        //if(gamestate.getUsernameSelf() == gamestate.getUsernameWhite()) {
        //gamestate.setLastMoveWhite(lastMoveWhite: dateTime.currentDateString())
        //return
        //}
        //gamestate.setLastMoveBlack(lastMoveBlack: dateTime.currentDateString())
    }
    
    public func evaluateCheckMate(state: [[Piece?]]) {
        //gamestate.setCheckOn(checkOn: "NONE")
        //let elementMatrix = gamestate.getTschessElementMatrix()
        //let orientationBlack = gamestate.getOrientationBlack()
        //let elementMatrixCanonical = MatrixSerializer().canonicalGenerator(localMatrix: elementMatrix, orientation: orientationBlack)
        //let gamestateCanonical = gamestate.copy()
        //gamestateCanonical.setTschessElementMatrix(tschessElementMatrix: elementMatrixCanonical)
        
        //let king = CanonicalCheck().kingCoordinate(affiliation: gamestate.getOpponentAffiliation(), gamestate: gamestateCanonical)
        //if(CanonicalCheck().check(coordinate: king, gamestate: gamestateCanonical)){
        //if(CanonicalMate().mate(king: king, gamestate: gamestateCanonical)){
        //gamestate.setWinner(winner: gamestate.getUsernameSelf())
        //return
        //}
        //gamestate.setCheckOn(checkOn: gamestate.getUsernameOpponent())
        //}
    }
    
    var white: Bool
    var collectionView: BoardView
    
    init(white: Bool, collectionView: BoardView){
        self.white = white
        self.collectionView = collectionView
    }
    
    func flash() {
        let flashFrame = UIView(frame: collectionView.bounds)
        flashFrame.backgroundColor = UIColor.white
        flashFrame.alpha = 0.7
        self.collectionView.addSubview(flashFrame)
        UIView.animate(withDuration: 0.1, animations: {
            flashFrame.alpha = 0.0
        }, completion: {(finished:Bool) in
            flashFrame.removeFromSuperview()
        })
    }
}
