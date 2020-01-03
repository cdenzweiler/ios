//
//  KingMovement.swift
//  ios
//
//  Created by Matthew on 8/10/19.
//  Copyright © 2019 bahlsenwitz. All rights reserved.
//

import Foundation

class KingMovement {
    
    func movement(present: [Int], proposed: [Int]) -> Bool {
        if (zeroMinus(present: present, proposed: proposed)) {
            return true;
        }
        if (zeroPlus(present: present, proposed: proposed)) {
            return true;
        }
        if (oneMinus(present: present, proposed: proposed)) {
            return true;
        }
        if (onePlus(present: present, proposed: proposed)) {
            return true;
        }
        if (minusMinus(present: present, proposed: proposed)) {
            return true;
        }
        if (minusPlus(present: present, proposed: proposed)) {
            return true;
        }
        if (plusMinus(present: present, proposed: proposed)) {
            return true;
        }
        if (plusPlus(present: present, proposed: proposed)) {
            return true;
        }
        return false;
    }
    
    func zeroMinus(present: [Int], proposed: [Int]) -> Bool {
        return (present[0] - 1) - proposed[0] == 0 && present[1] - proposed[1] == 0
    }
    
    func zeroPlus(present: [Int], proposed: [Int]) -> Bool {
        return (present[0] + 1) - proposed[0] == 0 && present[1] - proposed[1] == 0
    }
    
    func oneMinus(present: [Int], proposed: [Int]) -> Bool {
        return present[0] - proposed[0] == 0 && (present[1] - 1) - proposed[1] == 0
    }
    
    func onePlus(present: [Int], proposed: [Int]) -> Bool {
        return present[0] - proposed[0] == 0 && (present[1] + 1) - proposed[1] == 0
    }
    
    func minusMinus(present: [Int], proposed: [Int]) -> Bool {
        return (present[0] - 1) - proposed[0] == 0 && (present[1] - 1) - proposed[1] == 0
    }
    
    func minusPlus(present: [Int], proposed: [Int]) -> Bool {
        return (present[0] - 1) - proposed[0] == 0 && (present[1] + 1) - proposed[1] == 0
    }
    
    func plusMinus(present: [Int], proposed: [Int]) -> Bool {
        return (present[0] + 1) - proposed[0] == 0 && (present[1] - 1) - proposed[1] == 0
    }
    
    func plusPlus(present: [Int], proposed: [Int]) -> Bool {
        return (present[0] + 1) - proposed[0] == 0 && (present[1] + 1) - proposed[1] == 0
    }
}
