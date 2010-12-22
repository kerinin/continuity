require 'helper'
require 'minitest/autorun'
require 'continuity'

include Continuity

describe Scheduler do
  before do
    @backend = MiniTest::Mock.new
  end

  describe "do_jobs" do
    describe "cron job '0 0 * * * *'" do
      before do
        @scheduler = Scheduler.new(@backend)
      end

      it "should run every hour" do
        job_run = false
        @scheduler.cron("0 0 * * * *") do
          job_run = true
        end
        
        time = Time.parse("2010-12-20 08:00:00").to_i
        @scheduler.do_jobs(time..time)

        job_run.must_equal true
      end
    end
  end

  describe "run" do
    it "should use lock_for_scheduling on the backend" do
    end

    it "should only use lock_for_scheduling if frequency seconds have passed" do
    end
  end

  describe "every" do
    describe "10s" do
    end

    describe "1m" do
    end

    describe "3h" do
    end

    describe "1d" do
    end
  end
end