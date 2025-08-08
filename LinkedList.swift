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
  
  
}
