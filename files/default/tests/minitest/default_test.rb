require 'minitest/spec'

describe_recipe 'redis::default' do

  # It's often convenient to load these includes in a separate
  # helper along with
  # your own helper methods, but here we just include them directly:
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "packages" do
    it "installs the required package" do
      package("redis").must_be_installed
    end
  end

  describe "configuration" do
    it "has a configuration file" do
      file("/etc/redis/redis.conf").must_exist.with(:mode, "644").with(:owner, "root").with(:group, "root")
    end
  end

  describe "run_state" do
    it "succeed" do
      run_status.success?.must_equal true
    end
  end
end
