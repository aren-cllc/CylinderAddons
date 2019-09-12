-- This effect makes the icons fall down, moving away from the center of the page a bit.
return function(p, os, sw, sh)
    local pc = os / sw
    local cx, cy = p.width / 2, p.height / 2

    for i, ic in subviews(p) do
        -- Get icon position
        local ix, iy = ic.x + ic.width / 2, ic.y + ic.height / 2
        local dx, dy = 0, 0
        
        -- If this is a new icon
        if pc < 0 then
            local prog = 1 - math.max(0, 2 * (pc + 1) - 1)
            dx, dy = prog * (cx - ix), prog * (cy - iy)

            ic.alpha = pc + 1
            -- TODO: Add rotation
        else -- it's an old icon
            dx, dy = -pc * (cx - ix), -pc * 2 * (cy - iy)
            dy = dy + pc^2 * sh * 2
        end

        -- Move!
        ic:translate(dx, dy, 0)
    end

    -- Cancel default movement
    p:translate(os, 0, 0)
end
