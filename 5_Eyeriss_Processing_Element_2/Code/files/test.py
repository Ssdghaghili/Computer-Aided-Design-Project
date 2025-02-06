

ifmap = list(range(10))
filter = [4, 5, 6]


with open('log.txt', 'w') as f:
    offset = 0
    ifmap_base_addr = 0
    filter_base_addr = 0
    psum = 0

    ifmap_addr = 0
    filter_addr = 0
    while ifmap_addr < len(ifmap) - 1:

        if offset == 3:
            offset = 0
            ifmap_base_addr += 1

        ifmap_addr = ifmap_base_addr + offset
        filter_addr = filter_base_addr + offset
        mult = filter[filter_addr] * ifmap[ifmap_addr]
        psum += mult

        f.write(f"{ifmap[ifmap_addr]} * {filter[filter_addr]} = {mult}")
        f.write(f"\nPsum = {psum}\n\n")

        offset += 1
    