module EnigmaEncrypto
  
  class DateOffsetGen

    attr_accessor :todays_date

    def initialize
      @todays_date = Time.now.strftime("%02d%02m%02y")
    end

    def get_offset
      date_squared_last_four
    end

    def get_decrypter_offset(date)
      @todays_date = date
      date_squared_last_four
    end

    private

      def date_squared_last_four
        (@todays_date.to_i**2).to_s.split("").slice(-4..-1).map do |num|
          num.to_i
        end
      end

  end
end