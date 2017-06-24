module UserNaming
  module User
    extend ActiveSupport::Concern

    def first_name
      name.split.first
    end

    def last_name
      if name.split.count > 1
        name.split[1..-1].join(' ')
      else
        ''
      end
    end

    def initials
      name.split.collect{|p| p[0].upcase }.join
    end

    def first_name_last_initial
      if name.split.count > 1
        first_name + ' ' + name.split[-1][0].upcase + '.'
      else
        first_name
      end
    end

  end
end
