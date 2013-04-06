class HomeController < ApplicationController
  def index
    Rails.logger.info '======================================='
    Rails.logger.info '======================================='
    Rails.logger.info '======================================='
    if user_signed_in?
      Rails.logger.info current_user.inspect
    end
  end

  def fetch_data
    #params for serial port
    port_str = "/dev/ttyUSB0"  #may be different
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    #just read forever to find how to terminate
    while true do
      Rails.logger.info 'READING'
      while (i = sp.gets.chomp) do       # see note 2
        Rails.logger.info '-----------------------------------'
        Rails.logger.info i.inspect
        #puts i.class #String
      end
    end

    sp.close
  end
end
