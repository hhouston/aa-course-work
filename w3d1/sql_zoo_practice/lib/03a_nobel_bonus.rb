# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    select n1.yr
    from nobels n1
    where n1.subject = 'Physics' and n1.yr NOT IN (
      select n2.yr
      from nobels n2
      where n2.subject = 'Chemistry'
    )
    group by n1.yr
  SQL
end
