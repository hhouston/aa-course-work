def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  #
  # subquery = Movies.select(:id).where("actors.name IN ?", those_actors)
  #
  # Actor.select("actors.name").join(:movies).where("actors.id IN ?", )
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
       .group("LEFT(CAST(yr AS varchar(4)), 3)")
       .order("AVG(score) DESC")
       .limit(1)
       .pluck("LEFT(CAST(yr AS varchar(4)), 3)").first.+('0').to_i
end

def costars(name)
  # List the names of the actors that the named actor has ever appeared with.
  # Hint: use a subquery

  #subquery: get list of movies actor is in

  #query: get actors in that movie (not actor passed in)

  subquery = Actor.select("movies.id")
                  .joins(:movies)
                  .where("actors.name = ?", name)

  Actor
       .joins(:movies)
       .where("movies.id IN (?)", subquery)
       .where("actors.name != ?", name)
       .distinct
       .pluck("actors.name")
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  subquery = Casting.select(:actor_id)

  Actor.where("actors.id NOT IN (?)", subquery)
       .pluck("COUNT(*)").first
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the letters in whazzername,
  # ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but not like "stallone sylvester" or "zylvester ztallone"
  whazzername = "%" + whazzername.downcase.split(" ").join("").split("").join("%") + "%"

  Movie.joins(:actors)
       .where("actors.name ILIKE ?", whazzername)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of their career.
  Actor.select("actors.id, actors.name, (MAX(movies.yr) - MIN(movies.yr)) as career")
       .joins(:movies)
       .group("actors.id")
       .order("(MAX(movies.yr)-MIN(movies.yr)) DESC, actors.name")
       .limit(3)

end
