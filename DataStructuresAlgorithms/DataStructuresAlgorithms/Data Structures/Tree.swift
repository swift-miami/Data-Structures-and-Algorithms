class BinaryNode<T> {
    var value: T
    var left: BinaryNode<T>?
    var right: BinaryNode<T>?

    init(value: T) {
        self.value = value
    }

    func inOrderTraversal(process: @escaping ( (T) -> () )) {
        left?.inOrderTraversal(process: process)
        process(value)
        right?.inOrderTraversal(process: process)
    }
}

class BinaryTree<T> {
    var root: BinaryNode<T>?

    init(root value: T) {
        self.root = BinaryNode<T>(value: value)
    }

    func inOrderTraversal(process: @escaping ( (T) -> () )) {
        root?.inOrderTraversal(process: process)
    }
}

// Binary Search Tree
extension BinaryNode where T: Comparable {
    var min: T? {
        return left?.min ?? value
    }
}

extension BinaryTree where T: Comparable {

    var min: T? {
        return root?.min
    }

    func insert(value: T) {
        func insert(value: T, at node: BinaryNode<T>?) -> BinaryNode<T> {
            guard let node = node else {
                return BinaryNode(value: value)
            }

            if value < node.value {
                node.left = insert(value: value, at: node.left)
            }
            else {
                node.right = insert(value: value, at: node.right)
            }
            return node
        }

        root = insert(value: value, at: root)
    }


    func remove(value: T) {
        func remove(value: T, at node: BinaryNode<T>?) -> BinaryNode<T>? {
            guard let node = node else {
                return nil
            }

            if value == node.value {
                // If leaf node delete
                if node.left == nil && node.right == nil {
                    return nil
                }

                // If one child swap and delete
                if node.left == nil {
                    return node.right
                }
                if node.right == nil {
                    return node.left
                }

                // If 2 children swap with smallest ancestor and delete
                node.value = node.right!.min!
                node.right = remove(value: value, at: node.right)
                
            }
            else if value < node.value {
                node.left = remove(value: value, at: node.left)
            }
            else {
                node.right = remove(value: value, at: node.right)
            }
            return node
        }

        root = remove(value: value, at: root)
    }
}
