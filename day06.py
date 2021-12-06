with open('inputs/day06.txt') as f:
    data = list(map(int, f.read().split(',')))

def solve(days):
    lf = [data.count(n) for n in range(9)]
    for _ in range(days):
        lf[7] += lf[0]
        lf = lf[1:] + [lf[0]]
    return sum(lf)

print('part 1:', solve(80))
print('part 2:', solve(256))
