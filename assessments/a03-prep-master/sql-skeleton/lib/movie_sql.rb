require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# List the films in which 'Chuck Norris' has appeared; order by movie
# title.
def bearded_films
  MovieDatabase.execute(<<-SQL)
    select m.title
    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id

    where a.name = 'Chuck Norris'
  SQL
end

# Obtain the cast list for the movie "Zombies of the Stratosphere";
# order by the actor's name.
def zombie_cast
  MovieDatabase.execute(<<-SQL)
    select a.name

    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id

    where m.id = (

    select m.id
    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id
    where m.title = 'Zombies of the Stratosphere'
)
    order by a.name

  SQL
end

# Which were the busiest years for 'Danny DeVito'? Show the year and
# the number of movies he acted in for any year in which he was part of
# >2 movies. Order by year. Note the 'V' is capitalized.
def biggest_years_for_little_danny
  MovieDatabase.execute(<<-SQL)
    select m.yr, count(m.id) as count

    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id

    where a.name = 'Danny DeVito'

    group by m.yr
    having count(m.id) > 2

    order by m.yr
  SQL
end

# List the films where 'Nicolas Cage' has appeared, but not in the
# star role. Order by movie title.
def more_cage_please
  MovieDatabase.execute(<<-SQL)

    select m.title
    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id

    where a.name = 'Nicolas Cage' and c.ord != 1

    order by m.title
  SQL
end

# List the films together with the leading star for all 1908
# films. Order by movie title.
def who_is_florence_lawrence
  MovieDatabase.execute(<<-SQL)

    select m.title, a.name
    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id

    where c.ord = 1 and m.yr = 1908

    order by m.title
  SQL
end

# Some actors listed in our database are not associated with any actual
# movie role(s). How many such actors are there? Alias this number as
# 'num_bad_actors'.
def count_bad_actors
  MovieDatabase.execute(<<-SQL)

  select count(a.name) as 'num_bad_actors'

  from actors a
  left join castings c on a.id = c.actor_id

  where c.actor_id is null
  SQL
end

# Obtain a list in alphabetical order of actors who've had exactly 20
# starring roles. Order by actor name.
def twenty_roles
  MovieDatabase.execute(<<-SQL)
    select a.name

    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id
    where c.ord = 1
    group by a.name
    having count(a.name) = 20
    order by a.name
  SQL
end

# List the film title and the leading actor for all of the films
# 'Chris Farley' played in.
def chris_is_missed
  MovieDatabase.execute(<<-SQL)
    select m.title, a.name
    from movies m
    join castings c on c.movie_id = m.id
    join actors a on a.id = c.actor_id

    where c.ord = 1 and m.id in (
      select m.id
      from movies m
      join castings c on c.movie_id = m.id
      join actors a on a.id = c.actor_id
      where a.name = 'Chris Farley'
    )
  SQL
end
