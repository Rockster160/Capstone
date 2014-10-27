# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Game.create( name: '',
#              ava: '',
#              play: '',
#              cost: ,
#              about: "",
#              howto: "" )
#
Game.create(  name: 'Bowling' ,
              ava: 'bowling.png' ,
              play: './games/play/bowling' ,
              cost: 50 ,
              about: "This is a virtual bowling game. Bowling
                      consists of rolling a ball down a lane at 10
                      pins and keeping track of the number of pins
                      knocked down through 10 frames consecutively.
                      In each frame you have two chances to knock
                      down as many pins as you can with bonuses to
                      your score if you successfully knock all 10
                      down. If all 10 pins are knocked down on the
                      first try, it is called a strike. As a bonus,
                      your next ball(throw) on your next frame will
                      be doubled. Bonuses stack! If all 10 pins are
                      knocked down on the second try, it is called a
                      spare. As a bonus, your first ball on your next
                      frame will be doubled. In the tenth/final frame,
                      spares do not give bonuses since there is not a next
                      frame. However, if a spare or a strike is
                      rolled in the tenth frame you are given an
                      opportunity to have a 3rd ball in the tenth
                      frame, irregardless of whether or not you
                      knock them all down. This makes it possible
                      to get 3 strikes in the tenth frame alone,
                      adding up to 60 points in a single frame if
                      strikes were rolled in the 8th and 9th frames.
                      For each completed frame and for each point
                      earned, you will receive 1 point." ,
              howto: "At the beginning of the game you may click on any
                      position on the approach to select your
                      starting standing position. You will then
                      select a target throwing position by clicking
                      anywhere on the visible lane. You must click
                      and HOLD your position. A single click will
                      result in dropping the ball and restarting the
                      frame. Be quick. Upon clicking you will
                      begin your approach. Once you release you
                      will then drop the ball. If released at the proper
                      time your ball will be sent flying down the
                      lane. While your approach is active, use the
                      arrow keys to rotate your ball. The more times
                      you slam the keys, the faster your rev rate
                      will be in the direction you chose!" )

Game.create(  name: 'Platformer' ,
              ava: 'mrgaw.jpg' ,
              play: '' ,
              cost: 50 ,
              about: "Jump around, collect coins, profit! There isn\'t an easier way to
                      earn bonuses and collect extra coins on GameHub than in Platformer.
                      Each level gives the user multiple opportunities to pad their credit
                      stack." ,
              howto: "See description above." )

Game.create(  name: 'Pacman' ,
              ava: 'pacman.jpeg' ,
              play: './games/play/pacman' ,
              cost: 50 ,
              about: "This is a Pacman remake. As the Pacman
                      character, your goal is to avoid the ghosts
                      while collecting all of the coins. Careful!
                        Coins are lost quickly over time. Collect
                        other items to boost your score. Pick up
                        the pac-powerup to render all ghosts
                        vulnerable for a short time. While
                        vulnerable, ghosts can be eaten to
                        retrieve a large coin bonus. Collect all
                        coins on a level to move on to the next." ,
              howto: "Pacman is full of energy! He never stops
                      moving. Simply run over coins to collect
                      them. Control Pacman with WASD or the arrow
                      keys. Collect all coins on a level to
                      progress." )

Game.create(  name: 'Pusoy' ,
              ava: 'dice.png' ,
              play: '' ,
              cost: 50 ,
              about: "Pusoy is the Filipino version of poker played with 3 players. The
                      object of the game is to be the first to discard your hand by playing
                      them to the table. If one cannot be first to play all cards, then the
                      aim is to have as few cards as possible. Cards can be played separately
                      or in certain combinations using poker hand rankings. Players earn
                      points when they are first to discard their hand. For each card their
                      opponent is still holding in their hand they receive 1 point. The suit
                      order from highest to lowest is diamonds, hearts, spades, clubs with the
                      2 of diamonds being the highest card and the 3 of clubs being the lowest.
                      The player that is dealt the 3 of clubs leads/begins each game." ,
              howto: "Select and play cards using poker hands. Take turns with the other players.
                      First one to get rid of their cards wins!" )

Game.create(  name: 'Hoops' ,
              ava: 'basketball.png' ,
              play: '' ,
              cost: 50 ,
              about: "Shoot hoops in this vintage style basketball arcade game to earn points
                      and bonuses when you set a high score. The more times you play,
                      the more you can win!" ,
              howto: "Flick your finger or click and drag to shoot the ball into the hoop." )

Game.create(  name: 'RPG' ,
              ava: 'swords.jpeg' ,
              play: '' ,
              cost: 50 ,
              about: "This is an rpg run around magic spell casting game! Fight off enemies
                      using special spells to level up and earn bonuses. Save the world one
                      level at a time. Earn points for defeating enemies as well as increasing
                      damage and leveling up." ,
              howto: "Click to fire and attack. Level up and seek out special spells to
                      increase damage." )

Game.create( name: 'DevLabs',
             ava: 'devlabs.png',
             play: '',
             cost: 100,
             about: "11 week deep dive boot camp learning web development.",
             howto: "Prepare yourself!" )

Game.create( name: 'Random',
             ava: 'swap-bag.png',
             play: '',
             cost: 100,
             about: "Play the game, get random stuff!",
             howto: "Click on things, receive items, gamble your life away." )
#                     )
# User.create( id: ,
#              name: '',
#              about: '',
#              coin: ,
#              coinTo: ,
#              email: '',
#              password: '',
#              password_confirmation: '',
#              username: '',
#              favorites: [])

User.create( #id: 0,
             about: 'They call me Zoro. I am a mean green parkouring fighting machine. 
                    I like to build games and ride bikes in my spare time.',
             coin: 999999,
             coinTo: 10,
             email: 'zoro@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Zoro',
             favorites: [6, 3, 1, 0])

User.create( #id: 1,
             about: 'They call me Luffy. When danger calls I dress up in my hero costume 
                    and save the day. I occassionally eat pizza and cheetos to celebrate 
                    victories over bad guys.',
             coin: 12,
             coinTo: 3456,
             email: 'luffy@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Luffy',
             favorites: [2, 5, 0, 0])

User.create( #id: 2,
            about: 'Hello, I am Sam. I like to take long walks in the park with my dog
                    who\'s name is also Sam. When we aren\'t eating dog food together you
                    can find me at the gym eating carrots.',
            coin: 7856,
            coinTo: 10,
            email: 'sam@email.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'SamIam',
            favorites: [1, 5, 2, 0])

User.create( #id: 3,
             about: 'I like to flip off stuff. My nickname may or may not be Zoro. People think
                    it is supposed to be Zorro. It is not. I drink a lot of mountain dew and bowl
                    300 often.',
             coin: 2345,
             coinTo: 10,
             email: 'rocco@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Rockster160',
             favorites: [1, 6, 3, 2])

User.create( #id: 4,
            about: 'I bowl and sell life insurance. Insurance is my life. If you are interested in 
                    getting a great deal on life insurance please give me a shout out.',
            coin: 19872,
            coinTo: 10,
            email: 'bj@email.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'Brendan',
            favorites: [1, 0, 0, 0])

User.create( #id: 5,
             about: 'I am the co instructor at DPL. I like Germany and Jimmy Johns. I\'ll have a
                    cigarette from time to time. When I ask people to play Game of Thrones with
                    me they say yes but then nobody ends up playing.',
             coin: 2345,
             coinTo: 10,
             email: 'jason@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Jasonwc',
             favorites: [2, 4, 0, 0])

 User.create( #id: 6,
              about: 'I play games -- a lot of them. I also play the drums. I will basically play
                      anything. Chewing gum is fun. Hot dogs are good.',
              coin: 21,
              coinTo: 10,
              email: 'alex@email.com',
              password: 'password',
              password_confirmation: 'password',
              username: 'AlexPlays',
              favorites: [2, 3, 4, 5])

User.create( #id: 7,
             about: 'I am Mr. Playbook. What does that mean? Maybe you\'ll find out. When I am not
                    working on Playbook I am watching sports, listening to music, and eating food.',
             coin: 987654,
             coinTo: 10,
             email: 'preston@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'PrestonJohnson',
             favorites: [4, 5, 2, 0])

# UserGameLog.create( #id:
#                     user_id: ,
#                     game_id:
#                     )

# game_id: 1 Bowling
UserGameLog.create( #id:
                    user_id: 1,
                    game_id: 1,
                    created_at: Time.new(2014, 10, 25, 12, 19, 55),
                    score: 90
                    )
UserGameLog.create( #id:
                    user_id: 3,
                    game_id: 1,
                    created_at: Time.new(2014, 10, 27, 8, 45, 10),
                    score: 156
                    )
UserGameLog.create( #id:
                    user_id: 5,
                    game_id: 1,
                    created_at: Time.new(2014, 9, 25, 11, 15, 10),
                    score: 199
                    )
UserGameLog.create( #id:
                    user_id: 7,
                    game_id: 1,
                    created_at: Time.new(2014, 8, 10, 21, 30, 40),
                    score: 210
                    )

# game_id: 2 Platformer
UserGameLog.create( #id:
                    user_id: 1,
                    game_id: 2,
                    created_at: Time.new(2014, 10, 30, 10, 30, 20),
                    score: 15
                    )
UserGameLog.create( #id:
                    user_id: 5,
                    game_id: 2,
                    created_at: Time.new(2014, 10, 27, 21, 30, 40),
                    score: 23
                    )
UserGameLog.create( #id:
                    user_id: 2,
                    game_id: 2,
                    created_at: Time.new(2014, 8, 10, 21, 30, 40),
                    score: 32
                    )
UserGameLog.create( #id:
                    user_id: 6,
                    game_id: 2,
                    created_at: Time.new(2014, 7, 10, 21, 30, 40),
                    score: 35
                    )

# game_id: 3 Pacman
UserGameLog.create( #id:
                    user_id: 6,
                    game_id: 3,
                    created_at: Time.new(2014, 10, 30, 9, 34, 40),
                    score: 150
                    )
UserGameLog.create( #id:
                    user_id: 4,
                    game_id: 3,
                    created_at: Time.new(2014, 10, 27, 11, 38, 40),
                    score: 223
                    )
UserGameLog.create( #id:
                    user_id: 8,
                    game_id: 3,
                    created_at: Time.new(2014, 9, 10, 21, 30, 40),
                    score: 315
                    )
UserGameLog.create( #id:
                    user_id: 5,
                    game_id: 3,
                    created_at: Time.new(2014, 8, 07, 07, 12, 25),
                    score: 350
                    )

# game_id: 4 Pusoy
UserGameLog.create( #id:
                    user_id: 1,
                    game_id: 4,
                    created_at: Time.new(2014, 10, 30, 22, 13, 50),
                    score: 3
                    )
UserGameLog.create( #id:
                    user_id: 3,
                    game_id: 4,
                    created_at: Time.new(2014, 10, 28, 8, 17, 32),
                    score: 5
                    )
UserGameLog.create( #id:
                    user_id: 7,
                    game_id: 4,
                    created_at: Time.new(2014, 9, 27, 12, 15, 00),
                    score: 7
                    )
UserGameLog.create( #id:
                    user_id: 2,
                    game_id: 4,
                    created_at: Time.new(2014, 8, 22, 9, 22, 24),
                    score: 9
                    )

# game_id: 5 Hoops
UserGameLog.create( #id:
                    user_id: 1,
                    game_id: 5,
                    created_at: Time.new(2014, 10, 30, 9, 24, 00),
                    score: 15
                    )
UserGameLog.create( #id:
                    user_id: 3,
                    game_id: 5,
                    created_at: Time.new(2014, 10, 28, 11, 35, 10),
                    score: 21
                    )
UserGameLog.create( #id:
                    user_id: 4,
                    game_id: 5,
                    created_at: Time.new(2014, 9, 21, 9, 45, 45),
                    score: 32
                    )
UserGameLog.create( #id:
                    user_id: 6,
                    game_id: 5,
                    created_at: Time.new(2014, 8, 29, 8, 47, 10),
                    score: 35
                    )

# game_id: 6 RPG
UserGameLog.create( #id:
                    user_id: 7,
                    game_id: 6,
                    created_at: Time.new(2014, 10, 30, 18, 00, 00),
                    score: 1500
                    )
UserGameLog.create( #id:
                    user_id: 6,
                    game_id: 6,
                    created_at: Time.new(2014, 10, 28, 19, 24, 30),
                    score: 2250
                    )
UserGameLog.create( #id:
                    user_id: 3,
                    game_id: 6,
                    created_at: Time.new(2014, 9, 29, 20, 10, 34),
                    score: 3000
                    )
UserGameLog.create( #id:
                    user_id: 1,
                    game_id: 6,
                    created_at: Time.new(2014, 8, 22, 12, 01, 05),
                    score: 3500
                    )

# game_id: 7 Devlabs
UserGameLog.create( #id:
                    user_id: 3,
                    game_id: 7,
                    created_at: Time.new(2014, 10, 30, 15, 22, 12),
                    score: 3
                    )
UserGameLog.create( #id:
                    user_id: 4,
                    game_id: 7,
                    created_at: Time.new(2014, 10, 28, 13, 10, 11),
                    score: 4
                    )
UserGameLog.create( #id:
                    user_id: 7,
                    game_id: 7,
                    created_at: Time.new(2014, 9, 10, 10, 10, 10),
                    score: 7
                    )
UserGameLog.create( #id:
                    user_id: 5,
                    game_id: 7,
                    created_at: Time.new(2014, 8, 21, 21, 23, 10),
                    score: 8
                    )

# game_id: 8 Random
UserGameLog.create( #id:
                    user_id: 8,
                    game_id: 8,
                    created_at: Time.new(2014, 10, 30, 14, 30, 00),
                    score: 30
                    )
UserGameLog.create( #id:
                    user_id: 7,
                    game_id: 8,
                    created_at: Time.new(2014, 10, 28, 11, 24, 30),
                    score: 47
                    )
UserGameLog.create( #id:
                    user_id: 5,
                    game_id: 8,
                    created_at: Time.new(2014, 9, 24, 10, 12, 30),
                    score: 59
                    )
UserGameLog.create( #id:
                    user_id: 4,
                    game_id: 8,
                    created_at: Time.new(2014, 8, 10, 16, 15, 23),
                    score: 70
                    )

# Trophy.create ( #id:
#                 user_id: ,
#                 game_id: ,
#                 uniq_id:
# )
