# encoding: utf-8

describe "Rake::Task['test:coverage']", :tasks do

  # The {#task_invoked?} helper is defined in the spec/support/config/tasks.rb
  # It tests if a task has been invoked.

  let(:task) { Rake::Task["test:coverage"] }

  describe ".invoke", :sandbox do

    subject { try_in_sandbox { task.invoke } }

    it "invokes test:coverage:run" do
      expect { subject }
        .to change { task_invoked? "test:coverage:run" }
        .to(true)
    end

    it "invokes test:coverage:display" do
      expect { subject }
        .to change { task_invoked? "test:coverage:display" }
        .to(true)
    end
  end
end
