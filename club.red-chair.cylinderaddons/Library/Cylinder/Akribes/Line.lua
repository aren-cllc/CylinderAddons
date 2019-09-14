-- Effect that moves the icons towards the center, and then goes to the next page
return function(page, offset, screen_width, screen_height)
    local percent = offset / screen_width

    local extra_offset = 0
    if percent < 0 then
        percent = percent + 1
        extra_offset = screen_width
    end

    local prog1 = math.min(1, math.max(0, -3 * math.abs(percent - 0.5) + 1.5))
    local prog2 = math.min(1, math.max(0, 3 * percent - 1))

    for i, icon in subviews(page) do
        icon:translate(0, prog1 * (page.height / 2 - (icon.y + icon.width / 2)), 0)
    end

    page:translate(offset - prog2 * screen_width + extra_offset)
end
