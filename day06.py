with open('inputs/day06.txt') as f:
    data = list(map(int, f.read().split(',')))

lf = [data.count(n) for n in range(9)]

for step in range(256):
    lf[7] += lf[0]
    lf = lf[1:] + [lf[0]]
    if step+1 == 80:
        print('part 1:', sum(lf))

print('part 2:', sum(lf))
