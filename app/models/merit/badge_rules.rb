# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # grant_on 'users#create', badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end

    grant_on 'bowling#game', badge: 'first-game-completed', to: :user do |first-game-completed|
      complete.first.game == true
    end

    grant_on 'bowling#game', badge: 'personal-high-score-reached', to: :user do |personal-high-score-reached|
      personal.high.score.reached == true
    end

    grant_on 'bowling#game', badge: 'daily-high-score-reached', to: :user do |daily-high-score-reached|
      daily.high.score.reached == true
    end

    grant_on 'bowling#game', badge: 'weekly-high-score-reached', to: :user do |weekly-high-score-reached|
      weekly.high.score.reached == true
    end

    grant_on 'bowling#game', badge: 'monthly-high-score-reached', to: :user do |monthly-high-score-reached|
      monthly.high.score.reached == true
    end

    grant_on 'pacman#game', badge: 'first-level-completed', to: :user do |first-level-completed|
      first.level.completed == true
    end

    grant_on 'pacman#game', badge: 'first-five-levels-completed', to: :user do |first-five-levels-completed|
      first.five.levels.completed == true
    end

    grant_on 'pacman#game', badge: 'all-levels-completed', to: :user do |all-levels-completed|
      all.levels.completed == true
    end

    grant_on 'mazerunner#game', badge: 'first-checkpoint-reached', to: :user do |first-checkpoint-reached|
      first.checkpoint.reached == true
    end

    grant_on 'mazerunner#game', badge: 'second-checkpoint-reached', to: :user do |second-checkpoint-reached|
      second.checkpoint.reached == true
    end

    grant_on 'mazerunner#game', badge: 'game-completed', to: :user do |game-completed|
      game.completed == true
    end

  end
end
