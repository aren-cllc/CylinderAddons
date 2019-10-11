return function(p, o, sw, sh)
    local pc, cx, cy = o / sw, sw / 2, sh / 2
    local prog = math.min(1, math.abs(16 * pc))
    for i, ic in subviews(p) do
        local ix = (i - 0.5) / #p * sw
        local iy = cy

        local x = (ix - cx - o) / sw
        local y = x^-1 * 10

        local r = math.atan((x*10)^-2)

        ic:translate(prog * (ix - ic.x - ic.width / 2), math.max(-sh, math.min(sh, prog * (iy - y - ic.y - ic.width * 0.75))), 0)
        ic:rotate(prog * r, 0, 0, 1)
    end
end
