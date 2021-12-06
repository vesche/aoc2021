with open('inputs/day04.txt') as f:
    data = f.read().splitlines()

size = 5
numbers = list(map(int, data[0].split(',')))

boards, current = [], []
for line in data[2:]:
    if not line:
        boards.append(current)
        current = []
        continue
    current += list(map(int, line.split()))

def check_win(current_numbers):
    result = None
    to_remove = []
    for board in boards:
        win_possibilities = []
        for i in range(size):
            win_possibilities.append(board[i*size:i*size+size])
            win_possibilities.append(board[i::size])
        for wp in win_possibilities:
            if all(n in current_numbers for n in wp):
                unmarked = sum([x for x in board if x not in current_numbers])
                if board not in to_remove:
                    to_remove.append(board)
                result = unmarked * current_numbers[-1]
    for r in to_remove:
        boards.remove(r)
    return result

part1, part2 = 0, 0
for i in range(len(numbers)+1):
    result = check_win(numbers[:i])
    if result and not part1:
        part1 = result
    if result:
        part2 = result

print('part 1:', part1)
print('part 2:', part2)
