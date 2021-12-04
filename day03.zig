const std = @import("std");
const print = std.debug.print;
const input = @embedFile("inputs/day03.txt");

pub fn main() !void {
    var lines: usize = 0;
    var totals: [12]usize = undefined;
    std.mem.set(usize, totals[0..], 0);

    var iterate = std.mem.tokenize(input, "\n");
    while (iterate.next()) |line| {
        for (line) |c, i| {
            totals[i] += c-'0';
        }
        lines += 1;
    }

    var gamma: i32 = 0;
    var epsilon: i32 = 0;
    var power: i32 = 1;
    for (totals) |_, i| {
        const v = totals[(totals.len-1)-i];
        if (v > lines/2) {
            gamma += power;
        } else {
            epsilon += power;
        }
        power *= 2;
    }
    print("part1: {d}", .{gamma*epsilon});
}