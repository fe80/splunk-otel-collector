# frozen_string_literal: true

# Returns the PROGRAMDATA env var on windows

Facter.add(:win_programdata) do
  confine kenel: :windows
  setcode do
    ENV['PROGRAMDATA']
  end
end
