# frozen_string_literal: true

# This custom fact pulls out all local groups from the /etc/group file
# and returns the collection as a comma-separated list.

Facter.add(:local_groups) do
  confine kernel: :linux

  setcode do
    groups = []
    if File.exist?('/etc/group')
      File.open('/etc/group').each do |line|
        next if line.match(/^\s|^#|^$/)

        groups << line.split(':').first
      end
    end
    groups.join(',')
  end
end
