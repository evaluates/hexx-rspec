# encoding: utf-8

::RSpec.configure do |config|

  # Checks whether a task with given name has been invoked
  #
  # @param [String] name
  #
  # @return [Boolean]
  def task_invoked?(name)
    Rake::Task[name].instance_eval { @already_invoked }
  end

  # Resets Rake application
  config.around :example, :tasks do |example|
    app, Rake.application = Rake.application, nil
    example.run
    Rake.application = app
  end

  # Reinstalls tasks and mocks system calls
  config.before :example, :tasks do
    Hexx::RSpec::Tasks.install
    allow(Hexx::RSpec).to receive(:[])
  end

end # RSpec.configure
