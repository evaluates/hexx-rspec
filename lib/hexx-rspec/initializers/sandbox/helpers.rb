# encoding: utf-8
require "yaml"

# Returns the path to the temporary `tmp/sandbox`.
# @return [String] The absolute path.
def sandbox
  @sandbox ||= File.expand_path "tmp/sandbox"
end

# Clears the temporary `tmp/sandbox`.
def clear_sandbox
  FileUtils.rm_rf sandbox
end

# Re-creates the temporary `tmp/sandbox`.
def prepare_sandbox
  clear_sandbox
  FileUtils.mkdir_p sandbox
end

# Runs code from the temporary `tmp/sandbox`.
def try_in_sandbox
  FileUtils.cd(sandbox) { yield }
end

# Reads file in sandbox and returns file content.
# Returns a blank string when the file is absent.
# @return [String] The content.
def read_in_sandbox(filename)
  file = Dir[File.join(sandbox, filename)].first
  file ? File.read(file) : ""
end
