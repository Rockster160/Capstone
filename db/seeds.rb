# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Game.create( id: ,
#              name: '',
#              ava: '',
#              play: '',
#              cost: ,
#              about: "",
#              howto: "" )
#
Game.create( #id: 0 ,
              name: 'Bowling' ,
              ava: 'bowling.png' ,
              play: './games/play/bowling' ,
              cost: 50 ,
              about: "This is a virtual bowling game. Bowling
                      consists of rolling a ball down a lane at a
                      number of pins, keeping track of the number
                      knocked down through 10 frames consecutively.
                      In each frame, you have two chances to knock
                      down as many pins as you can, with bonuses to
                      your score in successfully knocking all 10
                      down. If all 10 pins are knocked down on the
                      first try, it is called a Strike. As a bonus,
                      your next ball(throw) on your next frame will
                      be doubled. Bonuses stack! If all 10 pins are
                      knocked down on the second try, it is called a
                      spare. As a bonus, your first ball on your next
                      frame will be doubled. In the tenth/final frame,
                      spares do not give bonuses as there is no next
                      frame. However, if a spare or a strike is
                      rolled in the tenth, you are given an
                      opportunity to have 3 ball in the tenth
                      frame, irregardless of whether or not you
                      knock them all down. This makes it possible
                      to get 3 strikes in the tenth frame alone,
                      adding up to 60 points in a single frame if
                      strikes were rolled in the 8th and 9th frames.
                      For each completed frame and for each point
                      earned, you will receive 1 point." ,
              howto: "At the beginning of the game, you may click on any
                      position on the approach to select your
                      starting standing position. You will then
                      select a target throwing position by clicking
                      anywhere on the visible lane. You must click
                      and HOLD your position. A single click will
                      result in dropping the ball and restarting the
                      frame. Be quick now. Upon clicking, you will
                      begin your approach. Once you release, you
                      will drop the ball. If released at the proper
                      time, your ball will be sent flying down the
                      lane. While your approach is active, use the
                      arrow keys to rotate your ball. The more times
                      you slam the keys, the faster your rev rate
                      will be in the direction you chose!" )

Game.create( #id: 1 ,
              name: 'Pacman' ,
              ava: 'pacman.png' ,
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

Game.create( #id: 2 ,
              name: 'Platformer' ,
              ava: 'platformer.png' ,
              play: '' ,
              cost: 50 ,
              about: "Jump around, collect coins, profit!" ,
              howto: "See description above" )

Game.create( #id: 3 ,
              name: 'Pusoy' ,
              ava: 'pusoy.png' ,
              play: '' ,
              cost: 50 ,
              about: "Strange card game where high card is 2 and low card is 3." ,
              howto: "Throw cards, match people, first out wins!" )

Game.create( #id: 4 ,
              name: 'Hoops' ,
              ava: 'hoops.png' ,
              play: '' ,
              cost: 50 ,
              about: "Shoot hoops, score points, become a pro!" ,
              howto: "Flick your finger or click and drag the throw the ball." )

Game.create( #id: 5 ,
              name: 'RPG' ,
              ava: 'rpg.png' ,
              play: '' ,
              cost: 50 ,
              about: "This is an rpg run around magic spell casting game!" ,
              howto: "Click on stuff to fire attack, level up spells to increase damage." )
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
#              avatar: '',
            #  favorites: [])

User.create( #id: 0,
             name: 'Zoro',
             about: 'Santouryu',
             coin: 999999,
             coinTo: 10,
             email: 'zoro@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Zoro',
            #  avatar: File.new("#{Rails.root}/app/assets/images/hoops.png", 'r'),
             favorites: [6, 3, 1, 0])

User.create( #id: 1,
             name: 'Luffy',
             about: 'Gomu Gomu',
             coin: 12,
             coinTo: 3456,
             email: 'luffy@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'luffy',
             avatar: '',
             favorites: [2, 5, 0, 0])

User.create( #id: 2,
            name: 'Sam',
            about: 'Hello I am Sam',
            coin: 7856,
            coinTo: 10,
            email: 'sam@email.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'SamIam',
            avatar: '',
            favorites: [1, 5, 2, 0])

User.create( #id: 3,
             name: 'Rocco',
             about: 'I like to flip off stuff',
             coin: 2345,
             coinTo: 10,
             email: 'rocco@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Rockster160',
             avatar: '',
             favorites: [1, 6, 3, 2])

User.create( #id: 4,
            name: 'Brendan',
            about: 'I bowl and sell life insurance',
            coin: 19872,
            coinTo: 10,
            email: 'bj@email.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'Brendan',
            avatar: '',
            favorites: [1, 0, 0, 0])

User.create( #id: 5,
             name: 'Jason',
             about: 'I am the co instructor at DPL',
             coin: 2345,
             coinTo: 10,
             email: 'jason@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'Jasonwc',
             avatar: '',
             favorites: [2, 4, 0, 0])

 User.create( #id: 6,
              name: 'Alex',
              about: 'I play games',
              coin: 21,
              coinTo: 10,
              email: 'alex@email.com',
              password: 'password',
              password_confirmation: 'password',
              username: 'AlexPlays',
              avatar: '',
              favorites: [2, 3, 4, 5])

User.create( #id: 7,
             name: 'Preston',
             about: 'I am Mr.PlayBook',
             coin: 987654,
             coinTo: 10,
             email: 'preston@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'PrestonJohnson',
             avatar: '',
             favorites: [4, 5, 2, 0])

User.create( #id: 8,
            name: 'Test',
            about: 'I am the breaker and I test stuff.',
            coin: 111111111,
            coinTo: 10,
            email: 'test@email.com',
            password: 'password',
            password_confirmation: 'password',
            username: 'tester',
            avatar: '',
            favorites: [5, 4, 3, 2])

User.create( #id: 9,
             name: 'Timer',
             about: 'I just look pretty',
             coin: 123456789,
             coinTo: 10,
             email: 'time@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'GrandfatherTime',
             avatar: '',
             favorites: [0, 0, 0, 0])

User.create( #id: 10,
             name: 'GameHub',
             about: 'I am the AI for this site! :D',
             coin: 99999999,
             coinTo: 10,
             email: 'gh@email.com',
             password: 'password',
             password_confirmation: 'password',
             username: 'ghub',
             avatar: '',
             favorites: [5, 1, 2, 3])
