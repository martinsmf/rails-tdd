describe "matcher output" do
  it { expect { puts "Matheus" }.to output.to_stdout }
  it { expect { print "Matheus" }.to output("Matheus").to_stdout }
  it { expect { puts "Matheus" }.to output(/Matheus/).to_stdout }

  it { expect { warn "Matheus" }.to output.to_stderr }
  it { expect { warn "Matheus" }.to output("Matheus\n").to_stderr }
  it { expect { warn "Matheus" }.to output(/Matheus/).to_stderr }
end
