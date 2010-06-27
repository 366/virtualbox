# Before everything, load virtualbox, of course
require 'spec'
require 'aruba'
require File.join(File.dirname(__FILE__), %W[.. .. lib virtualbox])

# Configuration settings/info
IntegrationInfo = {
  :test_unsafe => !!ENV["TEST_UNSAFE"],
  :vm_name => "test_vm"
}

# Mapping of VirtualBox::VM property keys to attributes in the
# `showvminfo` output.
VM_MAPPINGS = {
  :uuid => "UUID",
  :name => "name",
  :os_type_id => "ostype",
  :memory_size => "memory",
  :vram_size => "vram",
  :cpu_count => "cpus",
  :accelerate_3d_enabled => "accelerate3d",
  :accelerate_2d_video_enabled => "accelerate2dvideo",
  :clipboard_mode => "clipboard",
  :monitor_count => "monitorcount"
}

BIOS_MAPPINGS = {
  :acpi_enabled => "acpi",
  :io_apic_enabled => "ioapic"
}

MERGED_MAPPINGS = VM_MAPPINGS.merge(BIOS_MAPPINGS)