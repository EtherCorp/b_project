module V1
	module Entities
		class ServerStatusLogEntity < Grape::Entity
      expose :disk_used
			expose :percentage_disk_used
			expose :cpu_used
			expose :active_memory_used
			expose :bandwidth_rx
			expose :bandwidth_tx
			expose :disk_reads
			expose :disk_writes
			expose :created_at
		end
	end
end

