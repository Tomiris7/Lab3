//
//  main.swift
//  Lab3_1
//
//  Created by Tomiris Sultanbay on 22.02.2024.
//

import Foundation

// Student structure
struct Student {
    let firstName: String
    let lastName: String
    let averageGrade: Double
    
    // Computed property to get full name
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

// Journal (Student Journal)
class StudentJournal {
    var students: [Student] = []
    
    // Method to add a new student to the journal
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let student = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(student)
    }
    
    // Method to remove a student from the journal by first and last name
    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }
    
    // Method to display information about all students in a journal
    func displayStudentsInfo() {
        print("Students in the journal:")
        for student in students {
            print("Name: \(student.fullName), Average Grade: \(student.averageGrade)")
        }
    }
    
    // Method to list the students in descending order of their GPA
    func listStudentsByDescendingGPA() {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
        print("Students in descending order of GPA:")
        for student in sortedStudents {
            print("Name: \(student.fullName), Average Grade: \(student.averageGrade)")
        }
    }
    
    // Method to find the average score of all students in a journal
    func averageGradeOfAllStudents() -> Double {
        let totalGrade = students.reduce(0.0) { $0 + $1.averageGrade }
        return totalGrade / Double(students.count)
    }
    
    // Method to find the student with the highest GPA
    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

// Function to get user input
func getInput(prompt: String) -> String {
    print(prompt)
    return readLine() ?? ""
}

// Main function
func main() {
    let journal = StudentJournal()
    
    while true {
        print("\n1. Add Student\n2. Remove Student\n3. Display Students Info\n4. List Students by Descending GPA\n5. Average Grade of all Students\n6. Student with Highest GPA\n7. Exit")
        let choice = getInput(prompt: "Enter your choice:")
        
        switch choice {
        case "1":
            let firstName = getInput(prompt: "Enter First Name:")
            let lastName = getInput(prompt: "Enter Last Name:")
            if let averageGrade = Double(getInput(prompt: "Enter Average Grade:")) {
                journal.addStudent(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
            } else {
                print("Invalid input for average grade.")
            }
        case "2":
            let firstName = getInput(prompt: "Enter First Name:")
            let lastName = getInput(prompt: "Enter Last Name:")
            journal.removeStudent(firstName: firstName, lastName: lastName)
        case "3":
            journal.displayStudentsInfo()
        case "4":
            journal.listStudentsByDescendingGPA()
        case "5":
            print("Average Grade of all students: \(journal.averageGradeOfAllStudents())")
        case "6":
            if let studentWithHighestGPA = journal.studentWithHighestGPA() {
                print("Student with highest GPA: \(studentWithHighestGPA.fullName), Average Grade: \(studentWithHighestGPA.averageGrade)")
            } else {
                print("No students found.")
            }
        case "7":
            exit(0)
        default:
            print("Invalid choice.")
        }
    }
}

// Run the program
main()
