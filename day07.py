with open('inputs/day07.txt') as f:
    data = list(map(int, f.read().split(',')))

print('part 1:', min(sum(abs(n2-n1) for n2 in data) for n1 in data))
mean = sum(data)//len(data)
c = lambda x: x*(x+1)//2
print('part 2:', sum(c(abs(n-mean)) for n in data))
