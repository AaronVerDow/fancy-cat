const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const vaxis_dep = b.dependency("vaxis", .{
        .target = target,
        .optimize = optimize,
    });
    const fzwatch_dep = b.dependency("fzwatch", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "fancy-cat",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("vaxis", vaxis_dep.module("vaxis"));
    exe.root_module.addImport("fzwatch", fzwatch_dep.module("fzwatch"));

    const config = b.addModule("config", .{ .root_source_file = b.path("config.zig") });
    exe.root_module.addImport("config", config);

    exe.addIncludePath(.{ .cwd_relative = "/opt/homebrew/Cellar/fswatch/1.17.1/include" });
    exe.addLibraryPath(.{ .cwd_relative = "/opt/homebrew/Cellar/fswatch/1.17.1/lib" });
    exe.addIncludePath(.{ .cwd_relative = "/opt/homebrew/Cellar/mupdf/1.24.9/include" });
    exe.addLibraryPath(.{ .cwd_relative = "/opt/homebrew/Cellar/mupdf/1.24.9/lib" });

    exe.linkSystemLibrary("libfswatch");
    exe.linkSystemLibrary("mupdf");
    exe.linkSystemLibrary("z");
    exe.linkLibC();

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
