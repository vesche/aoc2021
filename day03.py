with open('inputs/day03.txt') as f:
    data = f.read().splitlines()

def get_common_bits(data):
    bits = [list() for _ in range(len(data[0]))]
    for line in data:
        for i, char in enumerate(line):
            bits[i].append(char)
    return ''.join([max(set(li), key=li.count) for li in bits])

gamma = get_common_bits(data)
epsilon = ''.join('1' if x == '0' else '0' for x in gamma)
print('part 1:', int(gamma,2)*int(epsilon,2))

def part2(flip=False):
    d = data[:]
    x = 0
    while len(d) != 1:
        cb = get_common_bits(d)
        if flip:
            remove = [line for line in d if line[x] == cb[x]]
        else:
            remove = [line for line in d if line[x] != cb[x]]
        for r in remove:
            d.remove(r)
        x += 1
    return int(d[0], 2)

print('part 2:', part2()*part2(flip=True))
