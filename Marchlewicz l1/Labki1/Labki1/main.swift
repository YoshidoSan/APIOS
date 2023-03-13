//
//  main.swift
//  Labki1
//
//  Created by Kacper Marchlewicz on 13/03/2023.
//
import Foundation

public class Node {
    var data: Any
    let id: String
    weak var next: Node?
    weak var previous: Node?
    
    init(data_outer data_inner: Any){
        data = data_inner
        id = UUID().uuidString
        print("Node: ", data, "; id: ", id, " has been created")
    }
    
    deinit{
        print("Node: ", data, "; id: ", id, " has been destroyed")
    }
}
public class Container {
    weak var first: Node?
    
    public var is_empty: Bool {
        if (first==nil) {
            return true
        }
        else{
            return false
        }
    }

    weak var last: Node? {
        weak var node = first
        if (node==nil){
            return nil
        }
        
        while let next_node = node!.next{
            node = next_node
        }
        return node
    }
    
    public func show_container(){
        var text = "[ "
        weak var current_node = first
        weak var next_node = first?.next
        while (current_node != nil){
            text += "\(String(describing: current_node!.data))"
            if (next_node != nil){
                text += " , "
            }
            current_node = next_node
            next_node = current_node?.next
        }
        text += " ]"
        print(text)
    }
    
    public func create_and_append_at_end(data_outer data_inner: Any) -> Node{
        let new_node = Node(data_outer: data_inner)
        weak var last_node = last
        if (last_node != nil){
            new_node.previous = last_node
            last_node!.next = new_node
        }
        else{
            first = new_node
        }
        return new_node
    }
    
    
    deinit{
        print("Container destroyed")
    }
}





func test(){
    print("===========")
    
    let con1 = Container()
    con1.show_container()

    let node1 = con1.create_and_append_at_end(data_outer: 25)
    con1.show_container()

    let node2 = con1.create_and_append_at_end(data_outer: "trzydziesci")
    con1.show_container()

    let node3 = con1.create_and_append_at_end(data_outer: "malpka")
    con1.show_container()
    
    print("===========")
}

print("Starting test")
test()
print("Finished test")
 
