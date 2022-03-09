const CommandBuffer = @This();

/// The type erased pointer to the CommandBuffer implementation
/// Equal to c.WGPUCommandBuffer for NativeInstance.
ptr: *anyopaque,
vtable: *const VTable,

pub const VTable = struct {
    reference: fn (ptr: *anyopaque) void,
    release: fn (ptr: *anyopaque) void,
};

pub inline fn reference(buf: CommandBuffer) void {
    buf.vtable.reference(buf.ptr);
}

pub inline fn release(buf: CommandBuffer) void {
    buf.vtable.release(buf.ptr);
}

test "syntax" {
    _ = VTable;
    _ = reference;
    _ = release;
}