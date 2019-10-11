return function(p, o, sw, sh)
    local pc, cx, cy = o / sw, sw / 2, sh / 2
    local prog = math.min(1, math.abs(16 * pc))
    for i, ic in subviews(p) do
        local ix = (i - 0.5) / #p * sw
        local iy = cy

        ic:translate(prog * (ix - ic.x - ic.width / 2), prog * (iy - ic.y - ic.width * 0.75), 0)
    end
end
