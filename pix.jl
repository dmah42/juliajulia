module Pix

function random(w, h)
  return map(x -> rand(UInt16,3), zeros(w,h))
end

function zero(w, h)
  return map(x -> zeros(UInt16, 3), zeros(w,h))
end

function gradient(w, h)
  pix = zero(w,h)
  for iw = 1:w
    for ih = 1:h
      pix[iw,ih][1] = trunc(UInt16, (iw/w)*255)
      pix[iw,ih][2] = 0
      pix[iw,ih][3] = trunc(UInt16, (ih/h)*255)
    end
  end
  return pix
end

end
