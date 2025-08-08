//
//  LinkedList.swift
//  DSA
//
//  Created by Rahul Sureka on 08/08/25.
//

import Foundation

class LinkedListNode<T> {
  var val: Int
  var next: LinkedListNode<T>?
}

class LinkedList {
  func reverseLinkedListUsingRecursion(head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    if head == nil || head?.next == nil {
      return head
    }
    var pointer = head
    //Recursive call to reverse the rest of the list
    var newHead = reverseLinkedListUsingRecursion(head: pointer.next)
    
    //Now, head.next point to last node in reversed list
    head.next.next = head
    //Head point to last node, so we set head.next to nil
    head.next = nil
    return newHead
  }
  //-------------------------------------------------------------------------------------------
  /*
   1 -> 2 -> 3 -> 4 -> -> 5 -> nil
   prev = nil
   curr = 1
   next = 2
   
   for 1st iteration
    curr.next = prev,  1-> nil
    prev = curr,  prev = 1
    curr = next,  curr = 2
   for 2nd iteration
    curr.next = prev,  2 -> 1
    prev = curr, prev = 2
    curr = next, curr = 3
   */
  func reverseLinkedListIteratively(head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    var curr = head
    var prev = nil
    var next = nil
    while curr != nil {
      next = curr?.next
      curr?.next = prev
      prev = curr
      curr = next
    }
    return prev
  }
  //--------------------------------------------------------------------------------------------------
  /*
   for odd: 1 -> 2 -> 3 -> 4 -> 5 -> nil
    mid when fast.next = nil
   for even: 1 -> 2 -> 3 -> 4 -> nil
    mid when fast.next.next = nil
   */
  func findMiddleOfLinkedList(head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    if head == nil || head?.next == nil {
      return head
    }
    var slowPointer = head
    var fastPointer = head
    
    while fastPointer?.next != nil && fastPointer?.next?.next != nil {
      slowPointer = slowPointer?.next
      fastPointer = fastPointer?.next?.next
    }
    return slowPointer
  }
  //--------------------------------------------------------------------------------------------------
  /*
   odd: 1 -> 2 -> 3 -> 4 -> 5 -> nil
   even: 1 -> 2 -> 3 -> 4 -> nil
      for both even and odd, find mid and reverse the linkedlist next to mid.
   */
  func checkIfLinkedListIsPalindrome(head: LinkedListNode<Int>?) -> Bool {
    if head == nil || head?.next == nil {
      return true
    }
    
    var mid = findMiddleOfLinkedList(head: head)
    var reversedHead = reverseLinkedListIteratively(head: mid?.next)
    return checkIfEqual(head, reversedHead)
  }
  //--------------------------------------------------------------------------------------------------
  func checkIfEqual(_ head1: LinkedListNode<Int>?, _ head2: LinkedListNode<Int>?) -> Bool {
    while head1 != nil && head2 != nil {
      if head1?.val != head2?.val {
        return false
      }
      head1 = head1?.next
      head2 = head2?.next
    }
    
    if head1 != nil || head2 != nil {
      return false
    }
    return true
  }
  //--------------------------------------------------------------------------------------------------
  /*
   odd: 1 -> 2 -> 3 -> 4 -> 5 -> nil
   Folded: 1 -> 5 -> 2 -> 4 -> 3 -> nil
   even: 1 -> 2 -> 3 -> 4 -> nil
   folded: 1 -> 4 -> 2 -> 3 -> nil
   
   In both case, we need to find the mid and reverse the linkedlist after mid and merge with 1st half.
   1. Find Mid
   2. Reverse the linkedlist after mid
   3. Merge the two linkedlists
   
   next = pointer1.next
   pointer1.next = pointer2
   pointer2 = pointer2.next
   pointer1 = next
   */
  func foldALinkedList(head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    if head == nil || head?.next == nil {
      return head
    }
    var mid = findMiddleOfLinkedList(head: head)
    var reversedHead = reverseLinkedListIteratively(head: mid?.next)
    return mergeLinkedList(head, reversedHead)
  }
  //----------------------------------------------------------------------------------------------
  func mergeLinkedList(_ head1: LinkedListNode<Int>?, _ head2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    var pointer1 = head1
    var pointer2 = head2
    var next1 = nil
    var next2 = nil
    while pointer1 != nil && pointer2 != nil {
      next1 = pointer1?.next
      next2 = pointer2?.next
      pointer1?.next = pointer2
      pointer2?.next = next1
      pointer2 = next2
      pointer1 = next1
    }
    
    return head1
  }
  //----------------------------------------------------------------------------------------------
  /*
   Folded odd: 1 -> 5 -> 2 -> 4 -> 3 -> nil
   unfolded: 1 -> 2 -> 3 -> 4 -> 5 -> nil
   folded even: 1 -> 4 -> 2 -> 3 -> nil
   unfolded: 1 -> 2 -> 3 -> 4 -> nil
   
   Here,
   1. Seperate into 2 linkedlist
   2. reverse the second linkedlist
   
   condition, while pointer1.next.next != nil
   */
  func unfoldALinkedList(head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    if head == nil || head?.next == nil {
      return head
    }
    var pointer1 = head
    var pointer2 = head?.next
    var head2 = pointer2 // Head of second linkedlist
    
    while pointer1?.next != nil && pointer1?.next?.next != nil {
      var next1 = pointer1?.next?.next
      pointer1?.next = next1
      pointer1 = next1
      
      if next1?.next != nil {
        pointer2?.next = next1?.next
        pointer2 = pointer2?.next
      }
    }
    pointer2?.next = nil // End the second list
    pointer1?.next = reverseLinkedListIteratively(head: head2) // Reverse the second list and attach to first list
    return head
  }
  //----------------------------------------------------------------------------------------------
  /*
   Merge sorting a linked list using recursion.
   */
  func mergeSortLinkedList(head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    if head == nil || head?.next == nil {
      return head
    }
    let mid = findMiddleOfLinkedList(head: head)
    let secondHalf = mid?.next
    mid?.next = nil // Split the list
    
    let left = mergeSortLinkedList(head: head)
    let right = mergeSortLinkedList(head: secondHalf)
    return mergeSortedLists(left, right)
  }
  //----------------------------------------------------------------------------------------------
  func mergeSortedLists(_ l1: LinkedListNode<Int>?, _ l2: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    if l1!.val < l2!.val {
      l1?.next = mergeSortedLists(l1?.next, l2)
      return l1
    } else {
      l2?.next = mergeSortedLists(l1, l2?.next)
      return l2
    }
  }
  //----------------------------------------------------------------------------------------------
  /*
   1 -> 2 -> 3 -> 4 -> 5 -> nil
   i = 3
   we have to keep track of prev.
   If i == 0, return head.next
   if i == n-1, prev.next = nil for last node.
   */
  func removeAtIndexInLinkedList(_ head: LinkedListNode<Int>?, _ index: Int) -> LinkedListNode<Int>? {
    if index < 0 || head == nil {
      return head
    }
    if index == 0 {
      return head?.next // If index is 0, return head.next
    }
    var i = 0
    var curr = head
    var prev: LinkedListNode<Int>? = nil
    while i < index && curr != nil {
      prev = curr
      curr = curr?.next
      i += 1
    }
    if curr == nil { // If index is out of bounds
      return head
    }
    prev?.next = curr?.next // Remove the node at index
    return head
  }
  
  //----------------------------------------------------------------------------------------------
  /*
   
   */
  func segregateEvenAndOddNodesInLinkedList(_ head: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    
  }
}
