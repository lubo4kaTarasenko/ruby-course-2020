module Notification
  extend ActiveSupport::Concern

  class_methods do
    def log
      puts(File.read("./#{name.downcase}.log"))
    end
  end

  def add_to_log(recepient)
    File.open("./#{self.class.name.downcase}.log", 'a') do |f|
      f.puts("#{recepient}: got an error \n ")
    end
  end

  def send_message(recepient)
    puts "Sending #{self.class.name} to #{recepient}"
    yield if block_given?
    service = Service::Deliver.new
    is_a?(Sms) ? service.sms(recepient) : service.email(recepient)
  end
end
