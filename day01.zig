const std = @import("std");
const print = std.debug.print;
const numbers = @embedFile("inputs/day01.txt");
const largeInt = 99999;

fn part1() !i32 {
    var iterate = std.mem.tokenize(numbers, "\n");
    var increases: i32 = 0;
    var hold: i32 = largeInt;
    while (iterate.next()) |line| {
        const n = try std.fmt.parseInt(i32, line, 10);
        if (n > hold) {
            increases += 1;
        }
        hold = n;
    }
    return increases;
}

fn part2() !i32 {
    var iterate = std.mem.tokenize(numbers, "\n");
    var increases: i32 = 0;
    var a: i32 = largeInt+3;
    var b: i32 = largeInt+2;
    var c: i32 = largeInt+1;
    var d: i32 = largeInt;
    while (iterate.next()) |line| {
        const n = try std.fmt.parseInt(i32, line, 10);
        d = c;
        c = b;
        b = a;
        a = n;
        if (a + b + c > b + c + d) {
            increases += 1;
        }
    }
    return increases;
}

pub fn main() !void {
    print("part 1: {d}\n", .{part1()});
    print("part 2: {d}\n", .{part2()});
}