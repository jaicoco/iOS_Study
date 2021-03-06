//
//  main.swift
//  104 - Maximum Depth of Binary Tree
//
//  Created by Ick on 2021/05/19.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        var result: Int = 0
        
        func getDepth(root: TreeNode?, now: Int) {
            if root == nil {
                result = max(result, now)
                return
            }
            getDepth(root: root?.left, now: now + 1)
            getDepth(root: root?.right, now: now + 1)
        }
        
        getDepth(root: root, now: 0)
        
        return result
    }
}
