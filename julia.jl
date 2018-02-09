module Julia

include("pix.jl")
include("ppm.jl")

function julia(w, h)
  pix = Pix.zero(w,h)

  xa = -2.0
  xb = 2.0
  ya = -1.5
  yb = 1.5
  max_it = 65535

  # Find a good julia spot from the mandelbrot set.
  c = 0
  while true
    cx = rand() * (xb - xa) + xa
    cy = rand() * (yb - ya) + ya
    c = cx + cy * 1im
    z = c
    i = 0
    for i=0:max_it
      if abs(z) > 2.0
        break
      end
      z = z * z + c
    end
    if i > 10 && i < 32000
      break
    end
  end

  # Write the pixels
  for ih = 1:h
    zy = ih * (yb - ya) / (h - 1) + ya
    for iw = 1:w
      zx = iw * (xb - xa) / (w - 1) + xa
      z = zx + zy * 1im
      i = 0
      for i = 0:max_it
        if abs(z) > 2.0
          break
        end
        z = z * z + c
      end
      pix[iw,ih][1] = i % 128 * 512
      pix[iw,ih][2] = i % 256 * 256
      pix[iw,ih][3] = i % 512 * 128
    end
  end

  return pix
end

PPM.write(julia(1024,1024))

end
