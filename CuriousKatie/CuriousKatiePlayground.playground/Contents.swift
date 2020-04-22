
import Foundation

//MARK: - Event
// declaration of current participants
var pickedParticipants = CuriousKatie.chooseParticipants()
print("Today we have \(pickedParticipants.count) participants.\n")

// each participant will introduce
for participant in pickedParticipants {
    print(participant.introduce())
}

var index = 0
var numberOfInterests = [Int]()

print("\n")
// populating array with each participant quantity of interests
for participant in pickedParticipants {
    numberOfInterests.append(participant.interests.count)
}

// picking out the highest number from array
let highestNumber = numberOfInterests.reduce(Int.min, { max($0, $1)})

// while loop sharing all interests of each participant(only one at the time)
while index != highestNumber {
    pickedParticipants.shuffle()
    for participant in pickedParticipants {
        participant.shareInterest(indexPath: index)
    }
    index += 1
}
print("\n")

CuriousKatie.matchPeople(participants: pickedParticipants)



//MARK: - CuriousKatie model
struct CuriousKatie {
        
    // function to randomly choosing random number of participants
    static func chooseParticipants() -> [Person] {
        let pool = Person.people.shuffled()
        let maximum = pool.count
        print("\n\n ..... Choosing Participants ..... \n")
        return Array(pool.prefix(Int.random(in: 2...maximum)))
    }
    
    
    static func printMatches(matches: [String]) {
        for element in matches {
            print(element)
            }
            print("\n")
    }
    
    // main function to match current participants
    static func matchPeople(participants: [Person]) -> [String] {
        
        // randomize participants order
        var peopleToMatch = participants.shuffled()
        
        // function to print all matches in array of matches
        func printMatches(matches: [String]) {
             for element in matches {
                 print(element)
                 }
                 print("\n")
         }
        
        // function which adds string to array if person are matching & removes participants which matched from pool
        func addIfMatch(array:inout [String], matchPerson: Person, participant: Person, string: String ) {
            array.append(string)
            peopleToMatch.removeAll(where: {$0.name == matchPerson.name || $0.name == participant.name})
        }
        
        // arrays to store matches
        var matches = [String]()
        var noMatches = [String]()
        
        // matching participants which have same interests
            for participant in peopleToMatch {

                //to this participant we are comparing others interest
                guard let matchingPerson = peopleToMatch.first else {
                    break
                }
                //this is comparing participant
                let participant = participant
                // storing all interests which are different (matchingPerson.interests to participant.interests)
                let interestsDifference = matchingPerson.interests.difference(from: participant.interests)
                // condition searching for matches with different interests

                if participant.name != matchingPerson.name && interestsDifference.count > 0 {
                    addIfMatch(array: &matches, matchPerson: matchingPerson, participant: participant, string: "\(matchingPerson.name ) is matching with \(participant.name).")
                }
                
        }

        // participants which are left in array(dont have match for them - everybody else is already paired)
        while peopleToMatch.count > 0 {
            noMatches.append("\(peopleToMatch.first!.name) has no suitable match.")
            peopleToMatch.removeFirst()
        }
        
        printMatches(matches: matches)
        printMatches(matches: noMatches)
        
        return noMatches
    }
}

//MARK: - Person model
struct Person {
    
    // properties
    var name: String
    var age: Int
    var interests: [Interest]

    // function to intruduce participant by generating introduction
    func introduce() -> String {
       
        let greetings = ["Hello everybody, I'm ", "Hi all, my name is", "Hey there, they call me"]
        let introduction = "\(greetings.randomElement()!) \(name), and I'm \(age) years old."
    
        return introduction
    }
    
    // function to share interest of participant || if there are no interests left, to say all interests said
    func shareInterest(indexPath: Int) {
        if indexPath <= interests.count - 1 {
            let interest = interests[indexPath]
            if let skill = interest.skill {
                print("(\(name)) My interest is  \(interest.title), I'm \(skill)")
            } else {
                print("(\(name)) My interest is \(interest.title).")
            }
        }
    }

    // initializer
    init(name: String, age: Int, interest: [Interest] = pickInterests()) {
        self.name = name
        self.age = age
        self.interests = interest
    }
    
    // computed property to generate participants
    static var people: [Person] {
        print("\n\n ..... Generating Participants ..... \n")
          return [
            Person(name: "Jonathan", age: 48),
            Person(name: "Julia", age: 37),
            Person(name: "Peter", age: 40),
            Person(name: "Reynold", age: 29),
            Person(name: "Bianca", age: 36),
            Person(name: "Garry", age: 42),
            Person(name: "Nataly", age: 31),
            Person(name: "Chloe", age: 52),
            Person(name: "Sophie", age: 22),
            Person(name: "Paul", age: 51),
            Person(name: "Anna", age: 34),
            Person(name: "Robert", age: 26)
            ]
    }
    
    // function to populate participant with random quantity of random possible interests
    static func pickInterests() -> [Interest] {
            let array = Array(Interest.possibleInterests().shuffled().prefix(Int.random(in: 1...Interest.possibleInterests().count)))
            let skills = ["novice","proficient","expert"]
            for interest in array {
                let randomNumber = Int.random(in: 1...20)
                if randomNumber <= 10 {
                    interest.skill = skills.randomElement()
                }
            }
            return array
        }
}


// MARK: - Interest model
class Interest {
    
    // propertes
    var title: String
    var skill: String?
    
    // initializer
    init(title: String, skill: String? = nil) {
        self.title = title
        self.skill = skill
    }
    
    // function to generate possible interests
    static func possibleInterests() -> [Interest] {
        return [
            Interest(title: "swimming"),
            Interest(title: "running"),
            Interest(title: "programming"),
            Interest(title: "snowboarding"),
            Interest(title: "skydiving"),
            Interest(title: "racing"),
            Interest(title: "cycling"),
            Interest(title: "surfing"),
            Interest(title: "socialazing"),
            Interest(title: "watching TV")
        ]
    }
}

// MARK: - Extensions

extension Interest: Equatable {
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.title == rhs.title
    }
}

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}



