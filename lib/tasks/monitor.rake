require 'monitoring/usagewatch'
require 'monitoring/test_connection'

namespace :monitor do
  desc 'Prints all System information (Server Monitoring)'
  task usage: [:environment, :dotenv] do
    puts "#{Usagewatch::Linux.uw_diskused} Gigabytes Used"
    puts "#{Usagewatch::Linux.uw_diskused_perc} Perventage of Gigabytes Used"
    puts "#{Usagewatch::Linux.uw_cpuused}% CPU Used"
    puts "#{Usagewatch::Linux.uw_tcpused} TCP Connections Used"
    puts "#{Usagewatch::Linux.uw_udpused} UDP Connections Used"
    puts "#{Usagewatch::Linux.uw_memused}% Active Memory Used"
    puts "#{Usagewatch::Linux.uw_load} Average System Load Of The Past Minute"
    puts "#{Usagewatch::Linux.uw_bandrx} Mbit/s Current Bandwidth Received"
    puts "#{Usagewatch::Linux.uw_bandtx} Mbit/s Current Bandwidth Transmitted"
    puts "#{Usagewatch::Linux.uw_diskioreads}/s Current Disk Reads Completed"
    puts "#{Usagewatch::Linux.uw_diskiowrites}/s Current Disk Writes Completed"
    puts "Top Ten Processes By CPU Consumption: #{Usagewatch::Linux.uw_cputop}"
    puts "Top Ten Processes By Memory Consumption: #{Usagewatch::Linux.uw_memtop}"
  end

  task ping: [:environment, :dotenv] do
    puts Monitoring::TestConnection.ping
  end
end
