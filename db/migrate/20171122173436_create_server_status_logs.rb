class CreateServerStatusLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :server_status_logs do |t|
      t.float :disk_used
      t.float :percentage_disk_used
      t.float :cpu_used
      t.float :active_memory_used
      t.float :bandwidth_rx
      t.float :bandwidth_tx
      t.integer :disk_reads
      t.integer :disk_writes
      t.timestamps
    end
  end
end
