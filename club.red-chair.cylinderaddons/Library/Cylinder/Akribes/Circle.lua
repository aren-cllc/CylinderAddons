-- Move the icons to a circle in the centre of the screen.
return function(page, offset, screen_width, screen_height)
    local percent = math.abs(offset / screen_width)
    local prog1 = math.min(1, 3 * percent)
    local prog2 = math.min(1, -3 * percent + 3)

    local r = math.min(screen_width, screen_height) / 4

    for i, icon in subviews(page) do
        local ix, iy = icon.x + icon.width / 2, icon.y + icon.height / 2
        
        local theta = math.pi * 2 * i / #page + math.pi
        local x, y = r * math.cos(theta) + page.width / 2, r * math.sin(theta) + page.height / 2
        icon:translate(prog1 * (x - ix), prog1 * (y - iy), 0)
        icon:rotate(prog1 * (theta - 1.5 * math.pi), 0, 0, 1)
        icon.alpha = prog2        
    end

    page:translate(offset, 0, 0)
end
