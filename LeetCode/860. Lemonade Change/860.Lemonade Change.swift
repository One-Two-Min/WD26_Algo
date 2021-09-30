class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var dollars: [Int] = [0, 0, 0]
        
        for bill in bills {
            dollars[bill / 10] += 1
            
            switch bill - 5 {
            case 5:
                if dollars[0] < 1 {
                    return false
                }
                dollars[0] -= 1
            case 15:
                if dollars[1] >= 1 {
                    dollars[1] -= 1
                    if dollars[0] < 1 {
                        return false
                    }
                    dollars[0] -= 1
                } else {
                    if dollars[0] < 3 {
                        return false
                    }
                    dollars[0] -= 3
                }
            default:
                continue
            }
        }
        
        return true
    }
}
