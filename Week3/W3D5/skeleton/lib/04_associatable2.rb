require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)

    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.class.assoc_options[source_name]

      t_fval = send(through_options.foreign_key)
      t_pkey = through_options.primary_key
      t_table = through_options.table_name

      s_fkey = source_options.foreign_key
      s_pkey = source_options.primary_key
      s_table = source_options.table_name

      result = DBConnection(<<-SQL, t_fval)
      SELECT
        #{s_table}.*
      FROM
        #{t_table}
      JOIN
        #{s_table} ON #{t_table}.#{s_fkey} = #{s_table}.#{s_pkey}
      WHERE
        #{t_table}.#{t_pkey} = ?
      SQL

      source_options.model_class.parse_all(result).first
    end

  end
end
