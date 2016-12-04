# == Schema Information
#
# Table name: teachers
#
#  id          :integer      not null, primary key
#  dept_id     :integer
#  name        :string
#  phone       :integer
#  mobile      :string
#
# Table name: depts
#
#  id          :integer      not null, primary key
#  name        :string       not null

require_relative './sqlzoo.rb'

def null_dept
  # List the teachers who have NULL for their department.
  execute(<<-SQL)
    select t.name
    from teachers t
    -- left join depts d on t.dept_id = d.id
    where t.dept_id is null
  SQL
end

def all_teachers_join
  # Use a type of JOIN that will list all teachers and their department,
  # even if the department in NULL/nil.
  execute(<<-SQL)
    select t.name, d.name
    from teachers t
    left join depts d on t.dept_id = d.id

  SQL
end

def all_depts_join
  # Use a different JOIN so that all departments are listed.
  # NB: you can avoid RIGHT OUTER JOIN (and just use LEFT) by swapping
  # the FROM and JOIN tables.
  execute(<<-SQL)
    select t.name, d.name
    from depts d
    left join teachers t on t.dept_id = d.id

  SQL
end

def teachers_and_mobiles
  # Use COALESCE to print the mobile number. Use the number '07986
  # 444 2266' if no number is given. Show teacher name and mobile
  # #number or '07986 444 2266'
  execute(<<-SQL)
    select t.name, coalesce(t.mobile, '07986 444 2266')
    from teachers t
  SQL
end

def teachers_and_depts
  # Use the COALESCE function and a LEFT JOIN to print the teacher name and
  # department name. Use the string 'None' where there is no
  # department.
  execute(<<-SQL)
    select t.name, coalesce(d.name, 'None')
    from teachers t
    left join depts d on d.id = t.dept_id

  SQL
end

def num_teachers_and_mobiles
  # Use COUNT to show the number of teachers and the number of
  # mobile phones.
  # NB: COUNT only counts non-NULL values.
  execute(<<-SQL)
    select count(t.id), count(t.mobile)
    from teachers t
  SQL
end

def dept_staff_counts
  # Use COUNT and GROUP BY dept.name to show each department and
  # the number of staff. Structure your JOIN to ensure that the
  # Engineering department is listed.
  execute(<<-SQL)
    select d.name, count(t.id)
    from teachers t
    right join depts d on d.id = t.dept_id
    group by d.name
  SQL
end

def teachers_and_divisions
  # Use CASE to show the name of each teacher followed by 'Sci' if
  # the teacher is in dept 1 or 2 and 'Art' otherwise.
  execute(<<-SQL)
    select t.name,
      case
        when t.dept_id in (1,2) then 'Sci'
        else 'Art'
      end as dept_name
    from teachers t
  SQL

end

def teachers_and_divisions_two
  # Use CASE to show the name of each teacher followed by 'Sci' if
  # the the teacher is in dept 1 or 2, 'Art' if the dept is 3, and
  # 'None' otherwise.
  execute(<<-SQL)
    select t.name,
      CASE
        when t.dept_id in (1, 2) then 'Sci'
        when t.dept_id = 3 then 'Art'
        else 'None'
      end as dept_name
    from teachers t

  SQL
end
