require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
#
# class Exception < StandardError
# end

class SQLObject

  def self.columns
    if @columns
      return @columns
    else
      columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
      SQL
    end
    @columns = columns.first.map! {|col| col.to_sym}
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) { attributes[col] }
      define_method("#{col}=") { |val| attributes[col] = val }
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
    @table_name || self.name.downcase.pluralize
    # ...
  end

  def self.all
    all_results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL

    self.parse_all(all_results)
    # ...
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
    # ...
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        "#{self.table_name}"
      WHERE
        id = ?
    SQL
    # p result.class
    # p result
    self.parse_all(result)[0]

    # ...
  end

  def initialize(params = {})
    params.each do |key, value|
      if self.class.columns.include?(key.to_sym)
        self.send("#{key.to_sym}=", value)
      else
        raise "unknown attribute '#{key}'"
      end
    end

  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    self.class.columns.map do |col|
      self.send("#{col}")
    end
    # ...
  end

  def insert
    # col_names = "#{self.class.columns.join(', ')}"
    arr = []
    self.class.columns.length.times { arr << '?' }
    question_marks = arr.join(', ')

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        "#{self.class.table_name}"
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id


    # ...
  end

  def update

    sets = self.class.columns.drop(1).map do |col|
      "#{col} = ?"
    end


    full_sets = sets.join(', ')

    DBConnection.execute(<<-SQL, *attribute_values.rotate(1))


    UPDATE
      "#{self.class.table_name}"
    SET
      #{full_sets}
    WHERE
      id = ?

    SQL
  end

  def save
    if self.id.nil?
      insert
    else
      update
    end
    # ...
  end
end
