//
//  Greedy.swift
//  DSA
//
//  Created by Rahul Sureka on 09/08/25.
//

import Foundation

class Greedy {
  /*
   Question: Leetcode 45, Min Jump 2
   Desc:
    Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at index i, you can jump to any index (i + j)
    Return the minimum number of jumps to reach index n - 1. The test cases are generated such that you can reach index n - 1.
   */
  func jump(_ nums: [Int]) -> Int {
    var count = nums.count
    var minArray = Array(repeating: Int.max, count: count)
    minArray[0] = 0
    for i in 0 ..< count - 1 {
      var jump = nums[i]
      for j in 0 ... jump {
        if i+j < count {
          minArray[i+j] = min(minArray[i+j], minArray[i] + 1)
        }
      }
    }
    return minArray[count-1]
  }
  
  /*
   Question: Leetcode 435, Given an array of intervals intervals where intervals[i] = [starti, endi],
   return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
   
   Approcah:
    Step 1: Sort on basis of end time of intervals and if end time is same then sort on basis of start time.
    Step 2: Iterate through the intervals and check if current interval start time is greater than prev interval end time.
        if yes, move the current interval index forward and increase the answer count.
            j++, count++
        if no, then make prev interval as curr interval and move the current interval index forward.
            i = j
            j++
   */
  func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    var count = intervals.count
    if count == 0 || count == 1 {
      return 0
    }
    var sortedIntervals = intervals.sorted {
      if $0[1] == $1[1] {
        return $0[0] < $1[0]
      }
      return $0[1] < $1[1]
    }
    var answer = 0
    var i = 0
    var j = 1
    while j < count {
      var intervalFirst = sortedIntervals[i]
      var intervalSecond = sortedIntervals[j]
      
      if intervalFirst[1] > intervalSecond[0] {
        j += 1
        answer += 1
      } else {
        i = j
        j += 1
      }
    }
    return answer
  }
  
  /*
   Question: Leetcode 621, Task Scheduler
   */
}
