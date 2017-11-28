require 'monitoring/usagewatch'
require 'monitoring/connection'

namespace :monitor do
  desc 'Prints all System information (Server Monitoring)'
  task usage: [:environment, :dotenv] do
    disk_used = Usagewatch::Linux.uw_diskused
    disk_used_perc = Usagewatch::Linux.uw_diskused_perc
    cpu_used = Usagewatch::Linux.uw_cpuused
    mem_used = Usagewatch::Linux.uw_memused
    bandrx = Usagewatch::Linux.uw_bandrx
    bandtx = Usagewatch::Linux.uw_bandtx
    diskioreads = Usagewatch::Linux.uw_diskioreads
    diskiowrites = Usagewatch::Linux.uw_diskiowrites

    ServerStatusLog.create(disk_used: disk_used,
                          percentage_disk_used: disk_used_perc, 
                          cpu_used: cpu_used, 
                          active_memory_used: mem_used, 
                          bandwidth_rx: bandrx, 
                          bandwidth_tx: bandtx, 
                          disk_reads: diskioreads, 
                          disk_writes: diskiowrites)                          
  end

  task test_connection: [:environment, :dotenv] do
    net_status = Monitoring::Connection.test
    if net_status
      store = Store.find_by(name: 'Zmart')
      result = store.check_page
    end
    puts result
  end
end
