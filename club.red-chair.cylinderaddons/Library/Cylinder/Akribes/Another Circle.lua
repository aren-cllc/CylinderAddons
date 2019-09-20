-- Move the icons to a circle in the centre of the screen.
return function(page, offset, screen_width, screen_height)
    local percent = offset / screen_width
    
    local prog1 = math.min(1, math.max(0, -3 * math.abs((math.abs(percent) - 0.5)) + 1.5))
    local prog2
    if percent < 0 then prog2 = math.min(1, math.max(0, -3 * math.abs(percent) + 2))
    else prog2 = math.min(1, math.max(0, 3 * math.abs(percent) - 1)) + 1 end

    local mx = page.width / 2
    local my = page.height / -1.5
    local r = math.sqrt(math.pow(mx, 2) + math.pow(my, 2))
    local start_theta = -math.atan(my / mx)
    local total_angle = math.pi - start_theta * 2 

    for i, icon in subviews(page) do
        local ix, iy = icon.x + icon.width / 2, icon.y + icon.height / 2
        
        local theta = - start_theta - total_angle * (i / #page + 1 - prog2) + math.pi
        local x, y = r * math.cos(theta) + mx, r * math.sin(theta) + my
        icon:translate(prog1 * (x - ix), prog1 * (y - iy), 0)
        icon:rotate(prog1 * (theta - 0.5 * math.pi), 0, 0, 1)
        if math.abs(percent) > 0.66667 then icon.alpha = 0 end 
    end

    page:translate(offset, 0, 0)
end
