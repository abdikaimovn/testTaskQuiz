//
//  FootBallModel.swift
//  testTaskQuiz
//
//  Created by Нурдаулет on 07.02.2024.
//

struct Study {
}

//MARK: - FOOTBALL STUDY
extension Study {
    //MARK: - FOOTBALL PLAYERS STUDY
    static let footballPlayers: [StudyTopic] = [
        StudyTopic(key: "messi_intro",
                   title: "Briefly about Lionel Messi",
                   material: "Lionel Messi was born on June 24, 1987, in Rosario, Argentina, to a working-class family. From a young age, Messi showed a natural talent for soccer, often playing with his brothers and friends in the streets of his neighborhood. His passion for the sport led him to join the youth team of his local club, Newell's Old Boys, where his exceptional skills were quickly recognized."
                  ),
        StudyTopic(key: "messi_early_years",
                   title: "Messi's Early Years and Soccer Beginnings",
                   material: "Lionel Messi's early years in Rosario, Argentina, were characterized by his deep love for soccer and an innate talent that set him apart. Despite facing challenges such as his diagnosis with growth hormone deficiency, Messi's determination to pursue his dreams led him to Spain at the age of 13, where he joined FC Barcelona's prestigious La Masia academy. It was here that Messi's skills flourished, setting him on the path to becoming one of the greatest soccer players of all time."
                  ),
        StudyTopic(key: "messi_youth_academy",
                   title: "Messi's joining FC Barcelona Youth Academy",
                   material: "At the age of 13, Lionel Messi made the pivotal decision to leave his native Argentina and join FC Barcelona's famed youth academy, La Masia. This move not only provided him with the opportunity to develop as a player but also offered access to crucial medical treatment for his growth hormone deficiency, which the club supported. Messi's time at La Masia proved transformative, as he honed his skills under the guidance of top coaches, setting the stage for his illustrious career with Barcelona and beyond."
                  )
    ]
    
    static var footballPlayersTopicsCount: Int {
        return footballPlayers.count
    }
    
    //MARK: - FOOTBALL CLUBS STUDY
    static let footballClubs: [StudyTopic] = [
        StudyTopic(key: "barcelona_intro",
                   title: "Brief Overview of FC Barcelona",
                   material: "FC Barcelona, commonly referred to as Barça, is a professional football club based in Barcelona, Catalonia, Spain. Founded in 1899 by a group of Swiss, English, Catalan, and German footballers led by Joan Gamper, the club has since become one of the most successful and widely supported teams in the world. With its iconic blue and red colors and the motto 'More than a club' (‘Més que un club’), FC Barcelona represents not only a football team but also a symbol of Catalan identity and values."
                  ),
        StudyTopic(key: "barcelona_history",
                   title: "History of FC Barcelona",
                   material: "The history of FC Barcelona is rich and storied, marked by numerous triumphs and challenges. Over the years, the club has enjoyed immense success both domestically and internationally, winning numerous La Liga titles, Copa del Rey trophies, UEFA Champions League titles, FIFA Club World Cups, and more. Throughout its existence, FC Barcelona has been home to legendary players, iconic managers, and unforgettable moments that have cemented its status as one of the greatest football clubs in history."
                  ),
        StudyTopic(key: "barcelona_stadium",
                   title: "Camp Nou: FC Barcelona's Home Ground",
                   material: "Camp Nou, located in the Les Corts neighborhood of Barcelona, is the iconic home stadium of FC Barcelona. With a seating capacity of over 99,000, it is the largest stadium in Europe and one of the most renowned football venues in the world. Camp Nou has been the backdrop for countless historic matches and unforgettable moments in football history. It serves as a symbol of FC Barcelona's enduring legacy and the passion of its dedicated supporters, known as culés."
                  )
    ]
    
    static var footballClubsTopicsCount: Int {
        return footballClubs.count
    }
    
    //MARK: - FOOTBALL RULES STUDY
    static let footballRules: [StudyTopic] = [
        StudyTopic(key: "football_rules_intro",
                   title: "Brief Overview of Football Rules",
                   material: "Football, also known as soccer in some countries, is a team sport played between two teams of eleven players each. The objective of the game is to score goals by getting the ball into the opposing team's goal. Football is governed by a set of rules known as the Laws of the Game, which are maintained by the International Football Association Board (IFAB). These rules cover various aspects of the game, including player conduct, fouls, offside, penalties, and more."
                  ),
        StudyTopic(key: "football_rules_basic",
                   title: "Basic Rules of Football",
                   material:"The basic rules of football revolve around fair play, sportsmanship, and respect for the game and its participants. Some fundamental rules include: Players cannot use their hands or arms to intentionally handle the ball, except for the goalkeeper within their own penalty area. Offside: A player is in an offside position if they are nearer to the opponent's goal line than both the ball and the second-to-last opponent when the ball is played to them, unless they are in their own half of the field. Fouls: Fouls are committed when players use excessive force, make dangerous tackles, or engage in unsporting behavior. Fouls result in free kicks or penalties, depending on the location and severity. Yellow and red cards: Referees use yellow cards to caution players for misconduct and red cards to send players off for serious offenses, resulting in ejection from the game."
                  ),
        StudyTopic(key: "football_rules_match",
                   title: "Match Duration and Scoring",
                   material: "A standard football match consists of two halves, typically lasting 45 minutes each, with a 15-minute halftime interval. However, match durations may vary depending on the competition and level of play. The objective of the game is to score goals by getting the ball into the opposing team's goal. Each goal is worth one point, and the team with the most goals at the end of the match wins. In the event of a tie, some competitions may proceed to extra time or a penalty shootout to determine the winner."
                  )
    ]
    
    static var footballRulesTopicsCount: Int {
        return footballPlayers.count
    }
}

// MARK: - BASKETBALL STUDY
extension Study {
    // MARK: - BASKETBALL PLAYERS STUDY
    static let basketballPlayers: [StudyTopic] = [
        
    ]
    
    static var basketballPlayersStudyCount: Int {
        return basketballPlayers.count
    }
    
    // MARK: - BASKETBALL RULES STUDY
    static let basketballRules: [StudyTopic] = [
        
    ]
    
    static var basketballRulesStudyCount: Int {
        return basketballRules.count
    }
    
    // MARK: - BASKETBALL CLUBS STUDY
    static let basketballClubs: [StudyTopic] = [
        
    ]
    
    static var basketballClubsStudyCount: Int {
        return basketballClubs.count
    }
}

// MARK: - MIXED STUDY
extension Study {
    // MARK: - MIXED PLAYERS STUDY
    static let mixedPlayers: [StudyTopic] = [
        
    ]
    
    static var mixedPlayersStudyCount: Int {
        return mixedPlayers.count
    }
    
    // MARK: - MIXED RULES STUDY
    static let mixedRules: [StudyTopic] = [
        
    ]
    
    static var mixedRulesStudyCount: Int {
        return mixedRules.count
    }
    
    // MARK: - MIXED CLUBS STUDY
    static let mixedClubs: [StudyTopic] = [
        
    ]
    
    static var mixedClubsStudyCount: Int {
        return mixedClubs.count
    }
}

struct Test {
    
}

//MARK: - FOOTBALL TEST
extension Test {
    //MARK: - FOORBALL PLAYERS TEST
    static let footballPlayers: [TestBlock] = [
        TestBlock(
            key: "football_players_test1",
            test: [
                TestQuestion(
                    question: "Which football player won the FIFA Ballon d'Or in 2020?",
                    variant1: "Lionel Messi",
                    variant2: "Cristiano Ronaldo",
                    variant3: "Robert Lewandowski",
                    variant4: "Neymar Jr.",
                    rightAnswer: "Robert Lewandowski"),
                TestQuestion(
                    question: "Who is known as 'The Egyptian King' in football?",
                    variant1: "Sergio Ramos",
                    variant2: "Mohamed Salah",
                    variant3: "Luka Modrić",
                    variant4: "Kevin De Bruyne",
                    rightAnswer: "Mohamed Salah"),
                TestQuestion(
                    question: "Which football player holds the record for the most goals scored in a single UEFA Champions League season?",
                    variant1: "Lionel Messi",
                    variant2: "Cristiano Ronaldo",
                    variant3: "Robert Lewandowski",
                    variant4: "Karim Benzema",
                    rightAnswer: "Cristiano Ronaldo")
            ]
        ),
        TestBlock(
            key: "football_players_test2",
            test: [
                TestQuestion(
                    question: "Who is the all-time top scorer in the history of the FIFA World Cup?",
                    variant1: "Pele",
                    variant2: "Miroslav Klose",
                    variant3: "Lionel Messi",
                    variant4: "Cristiano Ronaldo",
                    rightAnswer: "Miroslav Klose"
                ),
                TestQuestion(
                    question: "Which football player has won the most UEFA Champions League titles?",
                    variant1: "Cristiano Ronaldo",
                    variant2: "Lionel Messi",
                    variant3: "Andrés Iniesta",
                    variant4: "Paolo Maldini",
                    rightAnswer: "Paolo Maldini"
                ),
                TestQuestion(
                    question: "Who won the FIFA Men's Player of the Year award in 2021?",
                    variant1: "Lionel Messi",
                    variant2: "Cristiano Ronaldo",
                    variant3: "Robert Lewandowski",
                    variant4: "Neymar Jr.",
                    rightAnswer: "Lionel Messi"
                )
            ]
        )
    ]
    
    static var footballPlayersTestsCount: Int {
        return footballPlayers.count
    }
    
    //MARK: - FOOTBALL CLUBS TEST
    static let footBallClubs: [TestBlock] = [
        TestBlock(
            key: "football_clubs_test1",
            test: [
                TestQuestion(
                    question: "Which football club has won the most UEFA Champions League titles?",
                    variant1: "Real Madrid",
                    variant2: "FC Barcelona",
                    variant3: "Bayern Munich",
                    variant4: "Liverpool",
                    rightAnswer: "Real Madrid"
                ),
                TestQuestion(
                    question: "Which football club has the most Premier League titles?",
                    variant1: "Manchester United",
                    variant2: "Liverpool",
                    variant3: "Chelsea",
                    variant4: "Arsenal",
                    rightAnswer: "Manchester United"
                ),
                TestQuestion(
                    question: "Which football club won the UEFA Champions League in 2019?",
                    variant1: "Real Madrid",
                    variant2: "Liverpool",
                    variant3: "Bayern Munich",
                    variant4: "Manchester City",
                    rightAnswer: "Liverpool"
                )
            ]
        )
    ]
    
    static var footbalClubsTestsCount: Int {
        return footBallClubs.count
    }
    
    // MARK: - FOOTBALL RULES TESTS
    static var footbalRules: [TestBlock] = [
        TestBlock(
            key: "football_rules_test1",
            test: [
                TestQuestion(
                    question: "What is the duration of a standard football match?",
                    variant1: "90 minutes",
                    variant2: "120 minutes",
                    variant3: "80 minutes",
                    variant4: "60 minutes",
                    rightAnswer: "90 minutes"
                ),
                TestQuestion(
                    question: "How many players are there on each team in a standard football match?",
                    variant1: "10",
                    variant2: "11",
                    variant3: "12",
                    variant4: "9",
                    rightAnswer: "11"
                ),
                TestQuestion(
                    question: "Which player is responsible for guarding the goal?",
                    variant1: "Goalkeeper",
                    variant2: "Striker",
                    variant3: "Midfielder",
                    variant4: "Defender",
                    rightAnswer: "Goalkeeper"
                )
            ]
        )
    ]
    
    static var footballRulesTestsCount: Int {
        return footbalRules.count
    }
}

struct TestBlock {
    let key: String
    let test: [TestQuestion]
    
    var completedQuestionsCountKey: String {
        return key + "Count"
    }
}

struct TestQuestion {
    let question: String
    let variant1: String
    let variant2: String
    let variant3: String
    let variant4: String
    let rightAnswer: String
}

struct StudyTopic {
    let key: String
    let title: String
    let material: String
}

enum ModuleType {
    case football
    case basketball
    case mixed
}

enum BlockType {
    case players
    case clubs
    case rules
}
