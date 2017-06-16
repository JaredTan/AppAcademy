require_relative 'db_connection'
require_relative '01_sql_object'


module Searchable

  def where(params)
    sets = params.keys.map do |key|
      "#{key} = ?"
    end
    joined_sets = sets.join(' AND ')

    results = DBConnection.execute(<<-SQL, *params.values)
    SELECT
      *
    FROM
      "#{self.table_name}"
    WHERE
      #{joined_sets}

    SQL

    self.parse_all(results)


  end
end

class SQLObject
  extend Searchable# Mixin Searchable here...
end
