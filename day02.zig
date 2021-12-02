const std = @import("std");
const print = std.debug.print;
const equal = std.mem.eql;
const input = @embedFile("inputs/day02.txt");

fn part1() !i32 {
    var horizontal: i32 = 0;
    var depth: i32 = 0;
    var iterate = std.mem.tokenize(input, "\n");
    while (iterate.next()) |line| {
        var tokenizeLine = std.mem.tokenize(line, " ");
        while (tokenizeLine.next()) |direction| {
            var foo = tokenizeLine.next() orelse "0";
            const amount = try std.fmt.parseInt(i32, foo, 10);
            if (equal(u8, direction, "up")) {
                depth -= amount;
            } else if (equal(u8, direction, "down")) {
                depth += amount;
            } else if (equal(u8, direction, "forward")) {
                horizontal += amount;
            }
        }
    }
    return horizontal*depth;
}

fn part2() !i32 {
    var horizontal: i32 = 0;
    var depth: i32 = 0;
    var aim: i32 = 0;
    var iterate = std.mem.tokenize(input, "\n");
    while (iterate.next()) |line| {
        var tokenizeLine = std.mem.tokenize(line, " ");
        while (tokenizeLine.next()) |direction| {
            var foo = tokenizeLine.next() orelse "0";
            const amount = try std.fmt.parseInt(i32, foo, 10);
            if (equal(u8, direction, "up")) {
                aim -= amount;
            } else if (equal(u8, direction, "down")) {
                aim += amount;
            } else if (equal(u8, direction, "forward")) {
                horizontal += amount;
                depth += aim * amount;
            }
        }
    }
    return horizontal*depth;
}

pub fn main() !void {
    print("{d}\n", .{part1()});
    print("{d}\n", .{part2()});
}