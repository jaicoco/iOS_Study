//
//  main.swift
//  105 - Constuct Binary Tree from Preorder and Inorder Traversal
//
//  Created by Ick on 2021/02/17.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
 }

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count < 2 {
            return TreeNode(preorder[0])
        }
        
        var preIndex: Int = 0
        
        func makeTreeNodes(nowRoot: TreeNode?, inorder: [Int]) -> TreeNode? {
            if preIndex >= preorder.count {
                return nil
            }
            if inorder.count == 0 {
                return nil
            }
            // 현재 루트의 값을 전위 순회에서 가져옵니다.
            nowRoot?.val = preorder[preIndex]
            var left: [Int] = []
            var right: [Int] = []
            
            // 현재 루트의 값을 중위 순회에서 찾습니다.
            for i in 0..<inorder.count {
                if preorder[preIndex] == inorder[i] {
                    left = Array(inorder[0..<i])
                    right = Array(inorder[i+1..<inorder.count])
                    break
                }
            }
            preIndex += 1
            
            // 현재 루트 노드의 왼쪽 부분에 대하여 다시 반복합니다.
            nowRoot?.left = makeTreeNodes(nowRoot: TreeNode(), inorder: left)
            // 현재 루트 노드의 오른쪽 부분에 대하여 다시 반복합니다.
            nowRoot?.right = makeTreeNodes(nowRoot: TreeNode(), inorder: right)
            
            return nowRoot
        }
        
        
        return makeTreeNodes(nowRoot: TreeNode(), inorder: inorder)
    }
}

let a = Solution()
let resultNode = a.buildTree([3,9,20,15,7], [9,3,15,20,7])
print(resultNode?.val)
print(resultNode?.left?.val)
print(resultNode?.right?.val)
print(resultNode?.right?.left?.val)
print(resultNode?.right?.right?.val)

