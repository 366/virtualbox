module VirtualBox
  # Represents the VirtualBox main configuration file (VirtualBox.xml)
  # which VirtualBox uses to keep track of all known virtual machines
  # and images.
  class Global < AbstractModel
    # TODO: Perhaps make this detect the OS on initial load and set it
    # to the typicaly "default" location, instead of defaulting to
    # Mac OS X
    @@vboxconfig = "~/Library/VirtualBox/VirtualBox.xml"

    relationship :media, Media

    class <<self
      def global
        new(config)
      end

      # Sets the path to the VirtualBox.xml file. This file should already
      # exist. VirtualBox itself manages this file, not this library.
      #
      # @param [String] Full path to the VirtualBox.xml file
      def vboxconfig=(value)
        @@vboxconfig = value
      end

      # Returns the XML document of the configuration.
      #
      # @return [Nokogiri::XML::Document]
      def config
        Command.parse_xml(File.expand_path(@@vboxconfig))
      end
    end

    def initialize(document)
      populate_attributes(document)
    end
  end
end