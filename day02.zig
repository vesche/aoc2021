const std = @import("std");
const print = std.debug.print;
const equal = std.mem.eql;
const input = @embedFile("inputs/day02.txt");

pub fn main() !void {
    var horizontal: i32 = 0;
    var depth: i32 = 0;
    var aim: i32 = 0;
    var horizontal_p2: i32 = 0;
    var depth_p2: i32 = 0;

    var iterate = std.mem.tokenize(input, "\n");
    while (iterate.next()) |line| {
        var tokenizeLine = std.mem.tokenize(line, " ");
        const direction = tokenizeLine.next().?;
        const amount = try std.fmt.parseInt(i32, tokenizeLine.rest(), 10);
        if (equal(u8, direction, "up")) {
            depth -= amount;
            aim -= amount;
        } else if (equal(u8, direction, "down")) {
            depth += amount;
            aim += amount;
        } else if (equal(u8, direction, "forward")) {
            horizontal += amount;
            horizontal_p2 += amount;
            depth_p2 += aim * amount;
        }
    }

    print("part 1: {d}\n", .{horizontal*depth});
    print("part 2: {d}\n", .{horizontal_p2*depth_p2});
}