# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def example_select
  execute(<<-SQL)
    SELECT
      yr,
      subject,
      winner
    FROM
      nobels
    WHERE
      yr = 1960
  SQL
end

def prizes_from_1950
  # Display Nobel prizes for 1950.
  execute(<<-SQL)
    select *
    from nobels
    where yr = 1950
  SQL
end

def literature_1962
  # Show who won the 1962 prize for Literature.
  execute(<<-SQL)
    select winner
    from nobels
    where yr = 1962 and subject = 'Literature'
  SQL
end

def einstein_prize
  # Show the year and subject that won 'Albert Einstein' his prize.
  execute(<<-SQL)
    select yr, subject
    from nobels
    where winner = 'Albert Einstein'
  SQL
end

def millennial_peace_prizes
  # Give the name of the 'Peace' winners since the year 2000, including 2000.
  execute(<<-SQL)
    select winner
    from nobels
    where subject = 'Peace' and yr >= 2000
  SQL
end

def eighties_literature
  # Show all details (yr, subject, winner) of the Literature prize winners
  # for 1980 to 1989 inclusive.
  execute(<<-SQL)
    select *
    from nobels
    where subject = 'Literature' and yr between 1980 and 1989
  SQL
end

def presidential_prizes
  # Show all details of the presidential winners: ('Theodore Roosevelt',
  # 'Woodrow Wilson', 'Jimmy Carter')
  execute(<<-SQL)
    select *
    from nobels
    where winner in ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter')
  SQL
end

def nobel_johns
  # Show the winners with first name John
  execute(<<-SQL)
    select winner
    from nobels
    where winner like 'John%'
  SQL
end
