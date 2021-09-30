import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let brownCnt: Int = brown - 4 // 대각선의 각 끝 방향 4개 제거
    var height: Int = 0 // 세로
    var width: Int = 0  // 가로 (가로가 항상 세로보다 길거나 같다)
    var res: [Int] = [0, 0]
    
    for i in 1...Int(sqrt(Double(yellow))) {
        if yellow % i != 0 {
            continue
        }
        
        height = i
        width = yellow / i
        
        if height*2 + width*2 == brownCnt {
            res[0] = width + 2
            res[1] = height + 2
            break
        }
    }
    
    return res
}
