using FileIOWorldAgeProblem, Test

@testset "World Age Error" begin
  @testset "Errors first call" begin
    try
      FileIOWorldAgeProblem.loadasUInt8()
      @test true
    catch e
      bt = backtrace()
      msg = sprint(showerror, e, bt)
      println(msg)
      @test false
    end
  end

  @testset "Doesnt Error second call" begin
    try
      FileIOWorldAgeProblem.loadasUInt8()
    catch
      # do nothing
    end
    x = FileIOWorldAgeProblem.loadasUInt8()
    @test all(x .== UInt8[0x32 0xed 0xd7; 0x21 0x72 0xca; 0xab 0x41 0xab])
  end
end
