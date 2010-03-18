require File.dirname(__FILE__) + '/../spec_helper.rb'

class Foo
  attr_accessor :greeting
  def activity
    "Busy busy ..."
  end

  def bad_activity
    raise "This ain't gonna work ..."
  end

  def other_activity
    "Busy again ..."
  end

  def valid?
    true
  end

  def destroy!
    true
  end

  def echo(string)
    string
  end
end

class Job
  def self.number_one;end
  def self.number_two;end
  def self.number_three;end
  def self.number_four(instance);end
  def self.number_five(instance);end
end

class Observer
  include Eyeballer

  observe :foo, :activity => [:do_something, :do_something_else]
  observe :foo, :activity => :do_something_else

  observe :foo, :bad_activity => :do_something_entirely_different

  observe :foo, :other_activity => :do_something_with_the_instance

  observe :foo, :valid? => :process_files

  observe :foo, :destroy! => :email_someone

  observe :foo, :echo => :do_something

  def do_something
    Job.number_one
  end

  def do_something_else
    Job.number_two
  end

  def do_something_entirely_different
    Job.number_three
  end

  def do_something_with_the_instance(instance)
    instance.greeting = "The Observer says hello too!"
  end

  def process_files(instance)
    Job.number_four(instance)
  end

  def email_someone(instance)
    Job.number_five(instance)
  end
end


describe Eyeballer do
  it "should do something" do
    Job.should_receive(:number_one)
    Job.should_receive(:number_two)
    Foo.new.activity.should == "Busy busy ..."
  end

  it "should not do anything if an exception is raised" do
    Job.should_not_receive(:number_three)
    lambda{Foo.new.bad_activity}.should raise_error
  end

  it "should have access to the instance" do
    foo = Foo.new
    foo.greeting.should be_blank
    foo.other_activity.should == "Busy again ..."
    foo.greeting.should == "The Observer says hello too!"
  end

  it "should cope with predicates and bang methods" do
    foo = Foo.new
    Job.should_receive(:number_four).with(foo)
    foo.should be_valid
    Job.should_receive(:number_five).with(foo)
    foo.destroy!.should be_true
  end

  it "should cope with methods which take arguments" do
    Job.should_receive(:number_one)
    Foo.new.echo("Repeat this text").should == "Repeat this text"
  end
end