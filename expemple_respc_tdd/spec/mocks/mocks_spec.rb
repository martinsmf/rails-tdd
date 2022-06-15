require "student"
require "course"

describe "Mocks", :mock do
  it "#bar" do
    #setup
    student = Student.new

    #verify
    expect(student).to receive(:bar)

    #execise
    student.bar
  end

  it "args" do
    student = Student.new

    expect(student).to receive(:foo).with(123)

    student.foo(123)
  end

  it "once" do
    #call method one time
    student = Student.new

    expect(student).to receive(:foo).with(123).once

    student.foo(123)
  end

  it "twice" do
    #call method two time
    student = Student.new

    expect(student).to receive(:foo).with(123).twice

    student.foo(123)
    student.foo(123)
  end

  it "exactly" do
    #call method exactly number time
    student = Student.new

    expect(student).to receive(:foo).exactly(3).times

    student.foo(123)
    student.foo(123)
    student.foo(123)
  end

  it "at least" do
    #call method at less once
    student = Student.new

    expect(student).to receive(:foo).at_least(:once) # variants: :twice, (n).times

    student.foo(123)
    student.foo(123)
    student.foo(123)
  end

  it "return" do
    #call method one time
    student = Student.new

    expect(student).to receive(:foo).with(123).and_return(true)

    student.foo(123)
  end
end
