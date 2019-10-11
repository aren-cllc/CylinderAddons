return function(p, o, sw, sh)
    local pc, cx, cy = o / sw, sw / 2, sh / 2
    local prog = math.min(1, math.abs(16 * pc))
    for i, ic in subviews(p) do
        local result = dofile("includes/formula.lua")("math.abs(-400 * math.sin(x)) - 150", pc, i, #p, sw / (2 * math.pi), sw, sh, ic.width)
        ic:translate(prog * (result.x - ic.x), prog * (result.y - ic.y), 0)
        ic:rotate(prog * result.r, 0, 0, 1)
    end
    p:translate(o, 0, 0)
end
