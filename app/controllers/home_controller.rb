class HomeController < ApplicationController
  def index
    @users = User.find(:all, :select => 'name, score' )
    @message = Message.first
    #@chair_1_current = 
    #@chair_2_current
    #@chair_3_current
    #@chair_4_current

    @chair_1_total = Datum.where( :chair => 1).all
    @chair_2_total = Datum.where( :chair => 2).all
    @chair_3_total = Datum.where( :chair => 3).all
    @chair_4_total = Datum.where( :chair => 4).all
    #self.fetch_data
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

  def avatar_url(user)  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end 
end
