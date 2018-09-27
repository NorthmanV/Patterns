//: State

import UIKit

protocol State {
    var description: String { get }
    func setTask(_ task: Task)
    func startProgress()
    func startTesting()
    func close()
    func open()
}

final class OpenState: State {
    let description = "Opened at \(Date())"
    private var task: Task?
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgress() { task?.setState(InProgressState()) }
    func startTesting() { print("---Needs to start progress") }
    func close() { task?.setState(CloseState()) }
    func open() { print("---Already opened. Do nothing") }
}

final class InProgressState: State {
    let description = "In progress at \(Date())"
    private var task: Task?
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgress() { print("---Already in progress") }
    func startTesting() { task?.setState(InTestingState()) }
    func close() { print("Needs to be tested first") }
    func open() { task?.setState(OpenState()) }
}

final class InTestingState: State {
    let description = "Testing at \(Date())"
    private var task: Task?
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgress() { task?.setState(InProgressState()) }
    func startTesting() { print("---Already in testing") }
    func close() { task?.setState(CloseState()) }
    func open() { print("---Needs to be closed first") }
}

final class CloseState: State {
    let description = "Closed at \(Date())"
    private var task: Task?
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgress() { task?.setState(InProgressState()) }
    func startTesting() { print("---Needs to be opened first") }
    func close() { print("---Already closed") }
    func open() { task?.setState(OpenState()) }
}


final class Task {
    var history = "\nTask history\n"
    private var state: State
    
    init() {
        state = OpenState()
        state.setTask(self)
        history += state.description
        print("---\(state.description)")
    }
    
    func setState(_ state: State) {
        print("---\(state.description)")
        self.state = state
        state.setTask(self)
        history += state.description
    }
    
    func startProgress() { state.startProgress() }
    func startTesting()  { state.startTesting() }
    func close()         { state.close() }
    func open()          { state.open() }
}

let task = Task()
task.startProgress()
task.startTesting()
task.open()
task.close()
task.startTesting()
task.startProgress()

//---Opened at 2018-09-27 14:48:28 +0000
//---In progress at 2018-09-27 14:48:28 +0000
//---Testing at 2018-09-27 14:48:28 +0000
//---Needs to be closed first
//---Closed at 2018-09-27 14:48:28 +0000
//---Needs to be opened first
//---In progress at 2018-09-27 14:48:28 +0000

print(task.history)

//Task history
//Opened at 2018-09-27 14:48:28 +0000In progress at 2018-09-27 14:48:28 +0000Testing at 2018-09-27 14:48:28 +0000Closed at 2018-09-27 14:48:28 +0000In progress at 2018-09-27 14:48:28 +0000
