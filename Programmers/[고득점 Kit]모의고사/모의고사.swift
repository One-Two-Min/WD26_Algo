import Foundation

var first: [Int] = [1, 2, 3, 4, 5]
var second: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
var third: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

func solution(_ answers:[Int]) -> [Int] {
    
    var cnt: [Int] = [0, 0, 0]
    
    for i in 0..<answers.count {
        let answer: Int = answers[i]
        
        if answer == first[i % first.count] {
            cnt[0] += 1
        }
        
        if answer == second[i % second.count] {
            cnt[1] += 1
        }
        
        if answer == third[i % third.count] {
            cnt[2] += 1
        }
    }
    
    let max_cnt = max(cnt[0], max(cnt[1], cnt[2]))
    var res: [Int] = []
    
    for i in 0...2 {
        if max_cnt == cnt[i] {
            res.append(i+1)
        }
    }
    
    return res
}
