module FileIOWorldAgeProblem

using FileIO

function loadasUInt8(filepath="data/tifFloat64_3x3.tif")
  return UInt8.(FileIO.load(filepath) .*  255)
end

end
