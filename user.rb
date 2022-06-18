class User
  # setter,getter
  attr_accessor :name, :address, :email

  # setter
  # attr_reader

  # getter
  # attr_writer

  # # setter
  # def name=(name)
  #   @name = name
  # end

  # # getter
  # def name
  #   @name
  # end

  def profile
    "#{name} (#{address})"
  end
end