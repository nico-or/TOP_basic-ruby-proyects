module UserInput

  class InputGetter

    def set_getter(&block)
      @getter = block
    end

    def set_validator(&block)
      @validator = block
    end

    def get_input
      loop do
        input = @getter.call
        return input if @validator.call(input)
        print "Invalid. Try again. "
      end
    end
  end

end
