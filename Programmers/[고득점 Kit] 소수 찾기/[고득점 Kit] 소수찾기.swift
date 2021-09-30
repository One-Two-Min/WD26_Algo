import Foundation

var res: Set<Int> = []

func isPrime(_ num: Int) -> Bool {
    if num == 0 || num == 1 {
        return false
    }
    
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func permute(_ nums: [Int], _ targetNum: Int) {
    var visited: [Bool] = [Bool](repeating: false, count: nums.count)
    
    func permutation(_ permuRes: [Int]) {
        if permuRes.count == targetNum {
            
            // Int 배열을 String으로 변환 후 Int로 변환해서 소수 판별
            let strRes = permuRes.map(String.init).joined()
            
            if let intRes = Int(strRes) {
                if isPrime(intRes) {
                    res.insert(intRes)
                }
            }
            
            return
        }
        
        for i in 0..<nums.count {
            if visited[i] {
                continue
            }
            
            visited[i] = true
            permutation(permuRes + [nums[i]])
            visited[i] = false
        }
    }
    
    permutation([])
}

func solution(_ numbers:String) -> Int {
    let intArray: [Int] = numbers.map { Int(String($0)) ?? 0 }
    
    for i in 1...numbers.count {
        permute(intArray, i)
    }
    
    return res.count
}
