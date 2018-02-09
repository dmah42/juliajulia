module PPM

function write(pix)
  w, h = size(pix)

  println("P3")
  print(w)
  print(" ")
  println(h)
  println(0xffff)

  for iw = 1:w
    for ih = 1:h
      print(pix[iw,ih][1], " ", pix[iw,ih][2], " ", pix[iw,ih][3])
      print("  ")
    end
    println()
  end
end

end
