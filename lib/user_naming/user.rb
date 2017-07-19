module UserNaming
  module User
    extend ActiveSupport::Concern

    # First name.
    #
    # The first name is always the first word of the name.
    #
    # @return [String]
    def first_name
      name.split.first
    end


    # Middle name.
    #
    # The middle name is everything between the first name and last name,
    # or empty string.
    #
    # @return [String]
    def middle_name
      name.split[1..-2].join(' ')
    end

    # The last name.
    #
    # A name with only one part will return an empty string.
    # A name with two or more parts will return the last part.
    #
    # Examples:
    #   'Bilbo' will have a last name of ''.
    #   'Bilbo Foo Baggins' will have a last name of 'Baggins'.
    #
    # @return [String]
    def last_name
      if name.split.count > 1
        name.split[-1]
      else
        ''
      end
    end

    # Initials.
    #
    # The initials are the first letter of each name part,
    # joined together *without* periods.
    #
    # Examples:
    #   'Bilbo' will have initials of 'B'.
    #   'Bilbo Foo Baggins' will have initials of 'BFB'.
    #   'Bilbo Bartlet Foo Baggins' will have initials of 'BBFB'.
    #
    # @return [String]
    def initials
      name.split.collect{|p| p[0].upcase }.join
    end

    # The first name and the last initial.
    #
    # If only one name, just the first name is returned.
    #
    # Examples:
    #   'Bilbo' will be 'B'
    #   'Bilbo Foo Baggins' will be 'Bilbo B'
    #
    # @return [String]
    def first_name_last_initial
      if name.split.count > 1
        first_name + ' ' + last_name[0].upcase + '.'
      else
        first_name
      end
    end

  end
end
